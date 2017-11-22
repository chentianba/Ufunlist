from django.shortcuts import *
from public.models import *
# from public.models import Userdetail
from django.contrib.auth.models import User
from django.template import RequestContext
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.core.exceptions import ObjectDoesNotExist
from django.utils import timezone
from io import StringIO
import datetime
import json
import random
from Ufunlist import settings
from Ufunlist.views import personal_info
from .forms import *
from Ufunlist.settings import BASE_DIR
from Ufunlist.usetting import *


# Create your views here.
def get_category(sectionid):
    if sectionid == -1:
        # means global
        top = ALL_CATEGORY
        sub = ALL_CATEGORY
    else:
        sec = Category.objects.get(id=sectionid)
        if sec.parentid == None:
            top = sec.name
            sub = ALL_CATEGORY
        else:
            top = sec.parentid.name
            sub = sec.name
    top_list = []
    sub_list = []
    for i in range(len(CATEGORY)):
        if CATEGORY[i] == top:
            top_list.append({'number':i, 'select':"selected", 'topname':CATEGORY[i]})
            for j in range(len(SUBCATEGORY[i])):
                if SUBCATEGORY[i][j] == sub:
                    sub_list.append({'number':j, 'select':"selected", 'subname':SUBCATEGORY[i][j]})
                else:
                    sub_list.append({'number':j, 'select':"", 'subname':SUBCATEGORY[i][j]})
        else:
            top_list.append({'number':i, 'select':"", 'topname':CATEGORY[i]})
    return {'top_list':top_list, 'sub_list':sub_list}

def count_dfs(root):
    q = [root]
    count = 0
    while q != []:
        cur = q.pop(0)
        count += 1
        q.extend(Forumpost.objects.filter(parentid=cur.id))
    return count - 1

def generate_dfs(post):
    q = []
    q.extend(Forumpost.objects.filter(parentid=post.id).order_by('-time'))
    result = []
    while q != [] and q != None:
        cur = q.pop()
        # print(cur.id, cur.parentid.id, post.id)
        if cur.parentid.id == post.id:
            result.append({'id':cur.id, 'username':cur.userid.username, 'content':TO_HTML(cur.content), 'time':cur.time})
        else:
            result.append({'id':cur.id, 'username':cur.userid.username, 'content':TO_HTML("回复%s:"%(cur.parentid.userid.username,)+cur.content), 'time':cur.time})
        q.extend(Forumpost.objects.filter(parentid=cur.id).order_by('-time'))
    return result

def generate_hostlist(host):
    floors = []
    num = 2
    for post in Forumpost.objects.filter(parentid=host.id).order_by('time'):
        # print(post)
        floors.append({'id':post.id, 'username':post.userid.username, 'gender':post.userid.userdetail.gender ,'content':TO_HTML(post.content), 'time':post.time, 'no':num, 'list':generate_dfs(post)})
        num += 1
    return floors

@csrf_exempt
def get_page(request):
    if request.method == 'POST':
        print(request.POST)
        form = ForumSearchForm(request.POST)
        if form.is_valid():
            top = CATEGORY[form.cleaned_data['topCategory']]
            sub = SUBCATEGORY[form.cleaned_data['topCategory']][form.cleaned_data['subCategory']]
            if top == ALL_CATEGORY:
                pass
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
                        return_data['pageNum'] = num
                        return_data['totalPage'] = tmp//SEARCH_PAGE_LENGTH + (0 if tmp%SEARCH_PAGE_LENGTH == 0 else 1)
                        return_data['postList'] = []
                        for p in posts[SEARCH_PAGE_LENGTH*(num-1):SEARCH_PAGE_LENGTH*num]:
                            return_data['postList'].append({'title':p.title, 'popularity':count_dfs(p), 'url':"/forum/reply/%s/%s/"%(uniname, p.id), 'hasPic':0, 'extraInfo':'','show_popularity':True})
                        print(return_data)
                        return HttpResponse(json.dumps(return_data), content_type="application/json")
                    else:
                        pass
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
                        return_data['pageNum'] = num
                        return_data['totalPage'] = tmp//SEARCH_PAGE_LENGTH + (0 if tmp%SEARCH_PAGE_LENGTH == 0 else 1)
                        return_data['postList'] = []
                        for p in posts[SEARCH_PAGE_LENGTH*(num-1):SEARCH_PAGE_LENGTH*num]:
                            return_data['postList'].append({'title':p.title, 'popularity':count_dfs(p), 'url':"/forum/reply/%s/%s/"%(uniname, p.id), 'hasPic':0, 'extraInfo':'','show_popularity':True})
                        print(return_data)
                        return HttpResponse(json.dumps(return_data), content_type="application/json")
                    else:
                        # Post operations
                        pass
    raise Http404("In function get_page")

def reply(request, uniname, postid):
    c = personal_info(request, uniname)
    if request.method == 'GET':
        host = Forumpost.objects.get(id=postid)
        c['host_id'] = postid
        c['host_title'] = host.title
        c['host_content'] = TO_HTML(host.content)
        c['host_time'] = host.time
        c['host_username'] = host.userid.username
        c['host_gender'] = host.userid.userdetail.gender # 1 is man and 2 is woman, 0 is ?
        c['floors'] = generate_hostlist(host)
        post = Forumpost.objects.get(id=postid)
        c['top_category'] = {'name':post.categoryid.parentid.name, 'url':"/search/%s/%s/"%(c['university_name'], post.categoryid.parentid.id)}
        c['sub_category'] = {'name':post.categoryid.name, 'url':"/search/%s/%s/"%(c['university_name'], post.categoryid.id)}
        return render(request, 'forum/forumDetail.html', c)
    raise Http404("In reply")

def save_image(f, post, count):
    image_name = str(post.id)+'_'+str(count)+'.jpg'
    image_path = IMG_SAVED_DIR
    try:
        with open(BASE_DIR+image_path+image_name, 'xb') as des:
            des.write(f.read())
        pic = Picture(name=image_name, postid=post, path=image_path)
        pic.save()
    except IOError:
        post.delete()

@login_required
@csrf_exempt
def post(request, uniname):
    if request.method == 'GET':
        c = personal_info(request, uniname)
        c['phones'] = [p.phonenum for p in Userphonenum.objects.filter(userid=request.user.id)]
        c['qqs'] = [q.qq for q in Userqq.objects.filter(userid=request.user.id)]
        c['wechats'] = [w.wechat for w in Userwechat.objects.filter(userid=request.user.id)]
        c['emails'] = [request.user.email]
        return render(request, 'forum/post.html', c)
    elif request.method == 'POST':
        postform = PostForm(request.POST,request.FILES)
        if postform.is_valid():
            print(postform.cleaned_data)
            top = CATEGORY[postform.cleaned_data['topCategory']]
            sub = SUBCATEGORY[postform.cleaned_data['topCategory']][postform.cleaned_data['subCategory']]
            if top != ALL_CATEGORY and sub != ALL_CATEGORY:
                subcategory = Category.objects.get(name=sub)
                if subcategory.isforum:
                    #ForumPost operations
                    title = postform.cleaned_data['title']
                    content = postform.cleaned_data['content']
                    Forumpost(title=title, content=content, time=timezone.now(), userid=request.user, categoryid=subcategory).save()
                    return HttpResponseRedirect("/search/%s/%s"%(request.user.userdetail.universityid.name, subcategory.id))
                else:
                    maintitle = postform.cleaned_data['title']
                    content = postform.cleaned_data['content']
                    contactMethod = postform.cleaned_data['contactMethod']
                    contactContent = postform.cleaned_data['contactContent']
                    activetime = postform.cleaned_data['activeTime']
                    hasPic = 0
                    subtitle = postform.cleaned_data['subtitle']
                    files = request.FILES.getlist('image_files')
                    print("I am here")
                    if files.__len__() != 0:
                        hasPic = 1
                    else:
                        hasPic = 0
                    print(files.__len__())
                    print(files, request.POST)
                    if subtitle == None:
                        post = Post(time=timezone.now(), maintitle=maintitle, subtitleid=0, subtitle='',content=content, haspicture=hasPic,
                             popularity=0, activetime=activetime, replymethodid=contactMethod+1, replymethod=contactContent,
                             userid=request.user, categoryid=subcategory, state=1, deadtime=(timezone.now()+datetime.timedelta(days=activetime)))
                    else:
                        post = Post(time=timezone.now(), maintitle=maintitle, subtitleid=1, subtitle=subtitle, content=content,
                             haspicture=hasPic, popularity=0, activetime=activetime, replymethodid=contactMethod+1,
                             replymethod=contactContent, userid=request.user, categoryid=subcategory, state=1, deadtime=(timezone.now()+datetime.timedelta(days=activetime)))
                    post.save()
                    if files.__len__() != 0:
                        count = 0
                        for f in files:
                            count = count + 1
                            save_image(f, post, count)
                    return HttpResponseRedirect("/%s/%s/details/" % (uniname, post.id))
    raise Http404("In post")

@csrf_exempt
@login_required
def new_reply(request):
    if request.method != 'POST':
        raise Http404("In new_reply.")
    reply = NewReplyForm(request.POST)
    if not reply.is_valid():
        raise Http404("Not valid.")
    form = reply.cleaned_data
    to_post = Forumpost.objects.get(id=form.get('replyId'))
    target = Forumpost(content=form.get('replyContent'), time=timezone.now(), userid=request.user, parentid=to_post, categoryid=to_post.categoryid)
    target.save()
    print("here")
    return HttpResponse(json.dumps({'success':True, 'time':target.time.strftime("%Y-%m-%d %H:%m"), 'id':target.id}), content_type="application/json")

@login_required
@csrf_exempt
def reply_to_host(request):
    if request.method == 'POST':
        replytohost = ReplyToHostForm(request.POST)
        if replytohost.is_valid():
            form = replytohost.cleaned_data
            to_post = Forumpost.objects.get(id=form.get('replyId'))
            Forumpost(content=form.get('content'), time=timezone.now(), userid=request.user, parentid=to_post, categoryid=to_post.categoryid).save()
            return HttpResponse(json.dumps({}), content_type="application/json")
    raise Http404("In reply_to_host.")
