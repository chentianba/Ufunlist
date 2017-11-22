from django.shortcuts import *
from public.models import *
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.utils import timezone
import datetime
import json
from urllib import request
import re
from Ufunlist.usetting import *
from Ufunlist.settings import BASE_DIR
# from matplotlib import image
from PIL import Image


ICON = ['fa-bullhorn', 'fa-bicycle', 'fa-shopping-cart', 'fa-users', 'fa-university', 'fa-graduation-cap']

class Section:
    def __init__(self, name, target, subsections, icon):
        self.name = name
        self.target = target
        self.subsections = subsections
        self.icon = icon

def get_jlu_administer():
    try:
        user = User.objects.get(username='jlu_administer')
    except User.DoesNotExist:
        user = User.objects.create_user(username='jlu_administer', password='jlu_administer')
        user.email = "administer@jlu.edu.cn"
        user.save()
        Userdetail(user=user, gender=0, universityid=University.objects.get(name="吉林大学")).save()
    return user

def get_time(time):
    return "%s年%s月%s日%s时%s分"%(time.year, time.month, time.day, time.hour, time.minute)

def personal_info(request, uniname):
    c = {}
    c['university_name'] = uniname
    if request.user.is_authenticated():
        c['user_name'] = request.user.username
        c['user_url'] = '/account/center/%s/'%(uniname,)
        # try:
        #     c['university_name'] = request.user.userdetail.curuniversity.name
        # except Userdetail.DoesNotExist:
        #     c['university_name'] = DEFAULT_UNIVERSITY
    else:
        # c['university_name'] = DEFAULT_UNIVERSITY
        c['user_name'] = '我的账户'
        c['user_url'] = '/account/login/'
    c['university_id'] = University.objects.get(name=uniname).id
    unilist = University.objects.exclude(name=c['university_name'])
    c['university_list'] = [u.name for u in unilist]
    c['about_url'] = '/about/' + uniname + '/'
    c['mainpage_url'] = '/mainpage/' + uniname + '/'
    return c

def get_oa():
    with request.urlopen('https://oa.jlu.edu.cn/defaultroot/PortalInformation!jldxList.action?channelId=179577', timeout=1) as f:
        data=f.read().decode('utf-8')
    data=data[data.find('<div id="itemContainer">'):data.find('<div class="pages">')]
    i=data.find('<DIV')
    itemList=[]
    while(i!=-1):
        j=data.find('</DIV>')
        divStr=data[i:j+6]
        #print(itemStr)
        match=re.match('.*<DIV class="li rel"><I></I>.*<A.*href="(.*)">(.*)</A>.*<A.*>(.*)</A>.*</DIV>.*',divStr,re.DOTALL)
        item={}
        item['href']='https://oa.jlu.edu.cn/defaultroot/'+match.group(1)
        item['source']=match.group(3)
        itemStr=match.group(2)
        if((itemStr.find('<font'))!=-1):
            item['top']=1
            match2=re.match('.*</font>(.*)',itemStr)
            item['str']=match2.group(1)
        else:
            item['top']=0
            item['str']=itemStr
        itemList.append(item)
        data=data[j+5:]
        i=data.find('<DIV')
    itemList.reverse()
    uni = University.objects.get(name='吉林大学')
    jlu_administer = get_jlu_administer()
    category = Category.objects.get(name='校内通知')
    for item in itemList:
        try:
            post = Post.objects.get(content=item['href'])
        except Post.DoesNotExist:
            post = Post(time=timezone.now(), maintitle=item['str'], content=item['href'], subtitleid=2, subtitle=item['source'], haspicture=0, popularity=0, activetime=10**5, 
                replymethodid=0, replymethod='', userid=jlu_administer, categoryid=category, state=1, deadtime=(timezone.now()+datetime.timedelta(days=10**5))).save()
    return itemList

def mainpage(request, uniname=DEFAULT_UNIVERSITY):
    c = personal_info(request, uniname)
    sections = []
    uni = University.objects.get(name=uniname)
    count = 0
    if uniname == DEFAULT_UNIVERSITY:
        try:
            get_oa()
        except Exception as e:
            print(e)
            pass
    for sec in Category.objects.filter(parentid=None):
        namenum = []
        sub = Category.objects.filter(parentid=sec.id)
        for s in sub:
            if not s.isforum:
                now = timezone.now()
                delta = datetime.timedelta(hours=8+now.hour, minutes=now.minute, seconds=now.second)
                num = Post.objects.filter(categoryid=s.id, userid__userdetail__universityid=uni, time__gt=(now-delta)).count()
                namenum.append({'name':s.name, 'target':'/search/'+uniname+'/'+str(s.id)+'/', 'num':num, 'ishot':(num > HOT_LEVEL)})
                target = '/search/'+uniname+'/'+str(sec.id)+'/'
            else:
                now = timezone.now()
                delta = datetime.timedelta(hours=8+now.hour, minutes=now.minute, seconds=now.second)
                num = Forumpost.objects.filter(categoryid=s.id, parentid=None, userid__userdetail__universityid=uni, time__gt=(now-delta)).count()
                namenum.append({'name':s.name, 'target':'/search/'+uniname+'/'+str(s.id)+'/', 'num':num, 'ishot':(num > HOT_LEVEL)})
                target = '/search/'+uniname+'/'+str(sec.id)+'/'
        sections.append(Section(sec.name, target, namenum, ICON[count]))
        count += 1

    c['sections'] = [sections[:3], sections[3:6]]
    return render(request, 'index.html', c)

def about(request, uniname):
    return render(request, 'about.html', personal_info(request, uniname))

def handle_image(post):
    pictures = Picture.objects.filter(postid=post)
    image_list = []
    if pictures.__len__() != 0:
        for element in pictures:
            (width, height) = Image.open(BASE_DIR+element.path+element.name).size
            # print(height, width)
            image_list.append({'name':element.path+element.name, 'width':width, 'height':height})
    else:
        (width, height) = Image.open(BASE_DIR+IMG_SAVED_DIR+'warning.jpg').size
        image_list.append({'name':IMG_SAVED_DIR+'warning.jpg', 'width':width, 'height':height})
    num_list = list(range(0, pictures.__len__()))
    top_element = image_list[0]
    image_num = image_list.__len__()
    return {'image_list': image_list, 'num_list': num_list, 'top_element': top_element, 'image_num': image_num}


def details(request, uniname, postid):
    context = personal_info(request, uniname)
    post = Post.objects.get(id=int(postid))
    post.popularity += 1
    post.save()
    user = request.user
    context['is_black'] = 0
    try:
        like_list = Userlikepost.objects.filter(userid=user)
        for element in like_list:
            if element.postid_id == int(postid):
                context['is_black'] = 1
    except:
        context['is_black'] = 0
    context['top'] = post.categoryid.parentid.name
    context['sub'] = post.categoryid.name
    context['top_url'] = "/search/%s/%s/"%(uniname, post.categoryid.parentid.id)
    context['sub_url'] = "/search/%s/%s/"%(uniname, post.categoryid.id)
    ways=['', '手机', '邮箱', 'QQ', 'WeChat']
    context['replymethod_id'] = ways[post.replymethodid]
    context['replymethod'] = post.replymethod
    context['content'] = TO_HTML(post.content)
    context['title'] = post.maintitle if post.maintitle != "" else "^v^^v^^v^"
    context['subtitle'] = "￥%s"%(post.subtitle,) if post.subtitleid != 0 else ""
    context['id'] = post.id
    context['time'] = get_time(post.time+datetime.timedelta(hours=8))
    # print(context)
    pre_postid = int(postid)
    posts = Post.objects.filter(id__gt=pre_postid, categoryid=post.categoryid).order_by('id')
    if len(posts) != 0:
        pre_postid = posts[0].id
    next_postid = int(postid)
    posts = Post.objects.filter(id__lt=next_postid, categoryid=post.categoryid).order_by('-id')
    if len(posts) != 0:
        next_postid = posts[0].id
    context['pre_postid'] = pre_postid
    context['next_postid'] = next_postid

    context.update(handle_image(post))
    return render(request, 'search/post-content.html', context)


@login_required
def like(request):
    if request.method == "GET":
        print(request.GET)
        return_data = {}
        try:
            if request.GET['favorite'] == "true":
                post = Post.objects.get(id=int(request.GET['postId']))
                like = Userlikepost(userid=request.user, postid=post)
                like.save()
                return_data['isSuccess'] = "true"
            else:
                like_list = Userlikepost.objects.filter(userid=request.user)
                for element in like_list:
                    if element.postid_id == int(request.GET['postId']):
                        post = Post.objects.get(id=int(request.GET['postId']))
                        Userlikepost.objects.get(userid=request.user,postid=post).delete()
                        return_data['isSuccess'] = "true"
        except Exception as e:
            print(e)
            return_data['isSuccess'] = 'false'
        print(return_data['isSuccess'])
        return HttpResponse(json.dumps(return_data), content_type="application/json")
    else:
        raise Http404("ERROR")