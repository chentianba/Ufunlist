from django.shortcuts import render
from django.http import Http404
from public.models import *
import datetime
import random
from django.shortcuts import *
from public.models import Category, Forumpost, University
from public.models import Userdetail
from django.template import RequestContext
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.core.exceptions import ObjectDoesNotExist
from django.utils import timezone
import datetime
import json
import random
from Ufunlist import settings
from Ufunlist.views import personal_info
from forum.forms import *
from forum.views import get_category,count_dfs
from Ufunlist.usetting import *
# Create your views here.



@csrf_exempt
def global_search(request, uniname):
    c = personal_info(request, uniname)
    c.update(get_category(-1))
    if request.method != 'GET':
        raise Http404("In global_search")
    c['posts'] = []
    content = request.GET.get('content', '')
    posts_one = Post.objects.filter(userid__userdetail__universityid__name=uniname, maintitle__icontains=content, deadtime__gt=timezone.now()).order_by('-time')
    posts_two = Post.objects.filter(userid__userdetail__universityid__name=uniname, content__icontains=content, deadtime__gt=timezone.now()).order_by('-time')
    posts_three = Post.objects.filter(userid__userdetail__universityid__name=uniname, subtitleid__gt=0, subtitle__icontains=content, deadtime__gt=timezone.now()).order_by('-time')
    posts = list(posts_one)
    posts.extend(posts_two)
    posts.extend(posts_three)
    posts = sorted(list(set(posts)), key=lambda p:p.time, reverse=True)
    count = len(posts)
    if count == 0:
        c['position'] = "1 / 1"
    else:
        c['position'] = "1 / %s"%(count//SEARCH_PAGE_LENGTH + (0 if count%SEARCH_PAGE_LENGTH==0 else 1))
    for p in posts[:SEARCH_PAGE_LENGTH]:
        if p.subtitleid == 1:
            subtitle = "￥%s"%(p.subtitle,)
        elif p.subtitleid == 2:
            subtitle = "%s"%(p.subtitle,)
        else:
            subtitle = ""
        c['posts'].append({'title':p.maintitle, 'hasPic':p.haspicture!=0, 'extraInfo':subtitle, 'show_popularity': False if p.categoryid.name == SCHOOL_NOTIFICATIONS else True,
                         'popularity':p.popularity, 'url':"/%s/%s/details/" % (uniname, p.id) if p.categoryid.name != SCHOOL_NOTIFICATIONS else p.content})
    (pre_index, next_index) = c['position'].split('/')
    c['pre_index_show'] = (int(pre_index) > 1)
    c['next_index_show'] = (int(pre_index) < int(next_index))
    return render(request, 'search/postList.html', c)

def search(request, uniname, sectionid):
    c = personal_info(request, uniname)
    sec = Category.objects.get(id=sectionid)
    c.update(get_category(sectionid))
    if request.method == 'GET':
        c['posts'] = []
        if sec.isforum:
            if sec.parentid == None:
                posts = Forumpost.objects.filter(categoryid__parentid=sec.id, userid__userdetail__universityid__name=uniname, parentid=None)
            else:
                posts = Forumpost.objects.filter(categoryid=sec.id, userid__userdetail__universityid__name=uniname, parentid=None)
            count = len(posts)
            total = count//SEARCH_PAGE_LENGTH + (0 if count%SEARCH_PAGE_LENGTH==0 else 1)
            if count != 0:
                c['position'] = "1 / %s"%(total)
            else:
                c['position'] = "1 / 1"
            for p in posts[:SEARCH_PAGE_LENGTH]:
                c['posts'].append({'title':p.title, 'hasPic':0, 'extraInfo':"", 'show_popularity':True, 'popularity':count_dfs(p), 'url':"/forum/reply/%s/%s/"%(uniname, p.id)})
        else:
            if sec.parentid == None:
                posts = Post.objects.filter(categoryid__parentid=sec.id, userid__userdetail__universityid__name=uniname, deadtime__gt=timezone.now()).order_by('-time')
            else:
                posts = Post.objects.filter(categoryid=sec.id, userid__userdetail__universityid__name=uniname, deadtime__gt=timezone.now()).order_by('-time')
            count = len(posts)
            if count == 0:
                c['position'] = "1 / 1"
            else:
                c['position'] = "1 / %s"%(count//SEARCH_PAGE_LENGTH + (0 if count%SEARCH_PAGE_LENGTH==0 else 1))
            for p in posts[:SEARCH_PAGE_LENGTH]:
                if p.subtitleid == 1:
                    subtitle = "￥%s"%(p.subtitle,)
                elif p.subtitleid == 2:
                    subtitle = "%s"%(p.subtitle,)
                else:
                    subtitle = ""
                c['posts'].append({'title':p.maintitle, 'hasPic': p.haspicture!=0, 'extraInfo' : subtitle, 'popularity': p.popularity,
                                 'show_popularity': False if p.categoryid.name == SCHOOL_NOTIFICATIONS else True,
                                'url': "/%s/%s/details/" % (uniname, p.id) if sec.name != SCHOOL_NOTIFICATIONS else p.content})
        # print(c)
        (pre_index, next_index) = c['position'].split('/')
        c['pre_index_show'] = (int(pre_index) > 1)
        c['next_index_show'] = (int(pre_index) < int(next_index))
        return render(request, 'search/postList.html', c)
    elif request.method == 'POST':
        pass
    raise Http404("Your request doesn't have GET or POST method!-2")

@csrf_exempt
def get_page(request):
    if request.method == 'POST':
        # print(request.POST)
        form = ForumSearchForm(request.POST)
        if form.is_valid():
            top = CATEGORY[form.cleaned_data['topCategory']]
            sub = SUBCATEGORY[form.cleaned_data['topCategory']][form.cleaned_data['subCategory']]
            if top == ALL_CATEGORY:
                return_data = {}
                curUniId = form.cleaned_data['curUniId']
                posts = []
                content = form.cleaned_data.get('searchContent', '')
                posts_one = Post.objects.filter(userid__userdetail__universityid=curUniId, maintitle__icontains=content, deadtime__gt=timezone.now()).order_by('-time')
                posts_two = Post.objects.filter(userid__userdetail__universityid=curUniId, subtitleid__gt=0, subtitle__icontains=content, deadtime__gt=timezone.now()).order_by('-time')
                posts_three = Post.objects.filter(haspicture__lt=0) # generate empty <QuerySet []>
                if form.cleaned_data.get('titleOnly', None) != "on":
                    posts_three = Post.objects.filter(userid__userdetail__universityid=curUniId, content__icontains=content, deadtime__gt=timezone.now()).order_by('-time')
                if form.cleaned_data.get('hasPic', None) == "on":
                    posts_one = posts_one.filter(haspicture__gt=0)
                    posts_two = posts_two.filter(haspicture__gt=0)
                    posts_three = posts_three.filter(haspicture__gt=0)
                posts = list(posts_one)
                posts.extend(posts_two)
                posts.extend(posts_three)
                posts = sorted(list(set(posts)), key=lambda p:p.time, reverse=True)
                uniname = University.objects.get(id=curUniId).name
                num = form.cleaned_data['pageNum']
                tmp = len(posts)
                if tmp == 0:
                    return_data['pageNum'] = 1
                    return_data['totalPage'] = 1
                else:
                    return_data['pageNum'] = num
                    return_data['totalPage'] = tmp//SEARCH_PAGE_LENGTH + (0 if tmp%SEARCH_PAGE_LENGTH == 0 else 1)
                return_data['postList'] = []
                for p in posts[SEARCH_PAGE_LENGTH*(num-1):SEARCH_PAGE_LENGTH*num]:
                    if p.subtitleid == 1:
                        subtitle = "￥%s"%(p.subtitle,)
                    elif p.subtitleid == 2:
                        subtitle = "%s"%(p.subtitle,)
                    else:
                        subtitle = ""
                    return_data['postList'].append({'title':p.maintitle, 'popularity':p.popularity, 'url':"/%s/%s/details/"%(uniname, p.id) if p.categoryid.name != SCHOOL_NOTIFICATIONS else p.content,
                                                 'hasPic':p.haspicture!=0, 'extraInfo':subtitle, 'show_popularity': False if p.categoryid.name == SCHOOL_NOTIFICATIONS else True})
                # print(return_data)
                # return HttpResponse(json.dumps(return_data), content_type="application/json")
            else:
                if sub == ALL_CATEGORY:
                    topsection = Category.objects.get(name=top)
                    if topsection.isforum:
                        # top is forum
                        curUniId = form.cleaned_data['curUniId']
                        uniname = University.objects.get(id=curUniId).name
                        num = form.cleaned_data['pageNum']
                        return_data = {}
                        if form.cleaned_data.get('searchContent', None) is None:
                            # search content is empty
                            posts = Forumpost.objects.filter(parentid=None, categoryid__parentid=topsection.id, userid__userdetail__universityid=curUniId)
                        else:
                            content = form.cleaned_data.get('searchContent')
                            result = []
                            result.extend(Forumpost.objects.filter(title__icontains=content, parentid=None, categoryid__parentid=topsection.id, userid__userdetail__universityid=curUniId))
                            if form.cleaned_data.get('titleOnly', None) != "on":
                                result.extend(Forumpost.objects.filter(content__icontains=content, parentid=None, categoryid__parentid=topsection.id, userid__userdetail__universityid=curUniId))
                            posts = sorted(list(set(result)), key=lambda r:r.time, reverse=True)
                        # handle uniformly
                        tmp = len(posts)
                        if tmp == 0:
                            return_data['pageNum'] = 1
                            return_data['totalPage'] = 1
                        else:
                            return_data['pageNum'] = num
                            return_data['totalPage'] = tmp//SEARCH_PAGE_LENGTH + (0 if tmp%SEARCH_PAGE_LENGTH == 0 else 1)
                        return_data['postList'] = []
                        for p in posts[SEARCH_PAGE_LENGTH*(num-1):SEARCH_PAGE_LENGTH*num]:
                            return_data['postList'].append({'title':p.title, 'popularity':count_dfs(p), 'url':"/forum/reply/%s/%s/"%(uniname, p.id), 'hasPic':0, 'extraInfo':'',
                                                     'show_popularity': False if p.categoryid.name == SCHOOL_NOTIFICATIONS else True})
                        # print(return_data)
                        # return HttpResponse(json.dumps(return_data), content_type="application/json")
                    else:
                        # top is not forum
                        curUniId = form.cleaned_data['curUniId']
                        uniname = University.objects.get(id=curUniId).name
                        num = form.cleaned_data['pageNum']
                        return_data = {}
                        if form.cleaned_data.get('searchContent', None) is None:
                            # search content is empty
                            posts = Post.objects.filter(categoryid__parentid=topsection.id, userid__userdetail__universityid=curUniId, deadtime__gt=timezone.now())
                        else:
                            content = form.cleaned_data.get('searchContent')
                            result = []
                            if form.cleaned_data.get('hasPic',None) != "on":
                                result.extend(Post.objects.filter(maintitle__icontains=content,categoryid__parentid=topsection.id,
                                                                    userid__userdetail__universityid=curUniId, deadtime__gt=timezone.now()))
                                result.extend(Post.objects.filter(subtitleid__gt=0, subtitle__icontains=content,categoryid__parentid=topsection.id,
                                                                    userid__userdetail__universityid=curUniId, deadtime__gt=timezone.now()))
                                if form.cleaned_data.get('titleOnly', None) != "on":
                                    result.extend(Post.objects.filter(content__icontains=content,categoryid__parentid=topsection.id,
                                                                        userid__userdetail__universityid=curUniId, deadtime__gt=timezone.now()))
                            else:
                                result.extend(Post.objects.filter(maintitle__icontains=content, haspicture__gt=0,
                                                                  categoryid__parentid=topsection.id, deadtime__gt=timezone.now(),
                                                                  userid__userdetail__universityid=curUniId))
                                result.extend(Post.objects.filter(subtitleid__gt=0, subtitle__icontains=content, haspicture__gt=0,
                                                                  categoryid__parentid=topsection.id, deadtime__gt=timezone.now(),
                                                                  userid__userdetail__universityid=curUniId))
                                if form.cleaned_data.get('titleOnly', None) != "on":
                                    result.extend(Post.objects.filter(content__icontains=content, haspicture__gt=0,
                                                                      categoryid__parentid=topsection.id, deadtime__gt=timezone.now(),
                                                                      userid__userdetail__universityid=curUniId))
                            posts = sorted(list(set(result)), key=lambda r: r.time, reverse=True)
                        # handle uniformly
                        tmp = len(posts)
                        if tmp == 0:
                            return_data['pageNum'] = 1
                            return_data['totalPage'] = 1
                        else:
                            return_data['pageNum'] = num
                            return_data['totalPage'] = tmp // SEARCH_PAGE_LENGTH + (0 if tmp % SEARCH_PAGE_LENGTH == 0 else 1)
                        return_data['postList'] = []
                        for p in posts[SEARCH_PAGE_LENGTH * (num - 1):SEARCH_PAGE_LENGTH * num]:
                            if p.subtitleid == 1:
                                subtitle = "￥%s"%(p.subtitle,)
                            elif p.subtitleid == 2:
                                subtitle = "%s"%(p.subtitle,)
                            else:
                                subtitle = ""
                            return_data['postList'].append({'title': p.maintitle, 'popularity': p.popularity, 'show_popularity': False if p.categoryid.name == SCHOOL_NOTIFICATIONS else True,
                                                            'url': "/%s/%s/details/" % (uniname, p.id) if p.categoryid.name != SCHOOL_NOTIFICATIONS else p.content,
                                                            'hasPic': p.haspicture != 0, 'extraInfo': subtitle})
                        # print(return_data)
                        # return HttpResponse(json.dumps(return_data), content_type="application/json")
                else:
                    # top != ALL_CATEGORY and sub != ALL_CATEGORY
                    subsection = Category.objects.get(name=sub)
                    if subsection.isforum:
                        # Forumpost operations
                        curUniId = form.cleaned_data['curUniId']
                        uniname = University.objects.get(id=curUniId).name
                        num = form.cleaned_data['pageNum']
                        return_data = {}
                        if form.cleaned_data.get('searchContent', None) is None:
                            # search content is empty
                            posts = Forumpost.objects.filter(parentid=None, categoryid=subsection.id, userid__userdetail__universityid__id=curUniId)
                        else:
                            # search content is not empty
                            content = form.cleaned_data.get('searchContent')
                            result = []
                            result.extend(Forumpost.objects.filter(title__icontains=content, parentid=None, categoryid=subsection.id, userid__userdetail__universityid__id=curUniId))
                            if form.cleaned_data.get('titleOnly', None) != "on":
                                result.extend(Forumpost.objects.filter(content__icontains=content, parentid=None, categoryid=subsection.id, userid__userdetail__universityid__id=curUniId))
                            posts = sorted(list(set(result)), key=lambda r:r.time, reverse=True)
                        # handle uniformly
                        tmp = len(posts)
                        if tmp == 0:
                            return_data['pageNum'] = 1
                            return_data['totalPage'] = 1
                        else:
                            return_data['pageNum'] = num
                            return_data['totalPage'] = tmp//SEARCH_PAGE_LENGTH + (0 if tmp%SEARCH_PAGE_LENGTH == 0 else 1)
                        return_data['postList'] = []
                        for p in posts[SEARCH_PAGE_LENGTH*(num-1):SEARCH_PAGE_LENGTH*num]:
                            return_data['postList'].append({'title':p.title, 'popularity':count_dfs(p), 'url': "/forum/reply/%s/%s/"%(uniname, p.id), 'hasPic':0, 'extraInfo':'',
                                                 'show_popularity': False if p.categoryid.name == SCHOOL_NOTIFICATIONS else True})
                        # print(return_data)
                        # return HttpResponse(json.dumps(return_data), content_type="application/json")
                    else:
                        # Other Post operations
                        curUniId = form.cleaned_data['curUniId']
                        uniname = University.objects.get(id=curUniId).name
                        num = form.cleaned_data['pageNum']
                        return_data = {}
                        if form.cleaned_data.get('searchContent', None) is None:
                            # search content is empty
                            posts = Post.objects.filter(categoryid=subsection.id, userid__userdetail__universityid__id=curUniId, deadtime__gt=timezone.now())
                        else:
                            # search content is not empty
                            content = form.cleaned_data.get('searchContent')
                            result = []
                            if form.cleaned_data.get('hasPic',None) != "on":
                                result.extend(Post.objects.filter(maintitle__icontains=content, categoryid=subsection.id,
                                                                    userid__userdetail__universityid__id=curUniId, deadtime__gt=timezone.now()))
                                result.extend(Post.objects.filter(subtitleid__gt=0, subtitle__icontains=content, categoryid=subsection.id,
                                                                    userid__userdetail__universityid__id=curUniId, deadtime__gt=timezone.now()))
                                if form.cleaned_data.get('titleOnly', None) != "on":
                                    result.extend(Post.objects.filter(content__icontains=content, categoryid=subsection.id,
                                                                        userid__userdetail__universityid__id=curUniId, deadtime__gt=timezone.now()))
                            else:
                                result.extend(Post.objects.filter(maintitle__icontains=content, categoryid=subsection.id, haspicture__gt=0,
                                                        userid__userdetail__universityid__id=curUniId, deadtime__gt=timezone.now()))
                                result.extend(Post.objects.filter(subtitleid__gt=0, subtitle__icontains=content, categoryid=subsection.id, haspicture__gt=0,
                                                        userid__userdetail__universityid__id=curUniId, deadtime__gt=timezone.now()))
                                if form.cleaned_data.get('titleOnly', None) != "on":
                                    result.extend(
                                        Post.objects.filter(content__icontains=content, categoryid=subsection.id, haspicture__gt=0, deadtime__gt=timezone.now(),
                                                            userid__userdetail__universityid__id=curUniId))
                            posts = sorted(list(set(result)), key=lambda r: r.time, reverse=True)
                        # handle uniformly
                        tmp = len(posts)
                        if tmp == 0:
                            return_data['pageNum'] = 1
                            return_data['totalPage'] = 1
                        else:
                            return_data['pageNum'] = num
                            return_data['totalPage'] = tmp // SEARCH_PAGE_LENGTH + (0 if tmp % SEARCH_PAGE_LENGTH == 0 else 1)
                        return_data['postList'] = []
                        for p in posts[SEARCH_PAGE_LENGTH * (num - 1):SEARCH_PAGE_LENGTH * num]:
                            if p.subtitleid == 1:
                                subtitle = "￥%s"%(p.subtitle,)
                            elif p.subtitleid == 2:
                                subtitle = "%s"%(p.subtitle,)
                            else:
                                subtitle = ""
                            return_data['postList'].append({'title': p.maintitle, 'popularity': p.popularity, 'show_popularity': False if p.categoryid.name == SCHOOL_NOTIFICATIONS else True,
                                                            'url': "/%s/%s/details/" % (uniname, p.id) if p.categoryid.name != SCHOOL_NOTIFICATIONS else p.content,
                                                            'hasPic': p.haspicture!=0, 'extraInfo': subtitle})
                        # print(return_data)
                        # return HttpResponse(json.dumps(return_data), content_type="application/json")
            # print(return_data)
            return HttpResponse(json.dumps(return_data), content_type="application/json")
    raise Http404("In function get_page")

