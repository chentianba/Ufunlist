from django.shortcuts import *
from .forms import *
from django.contrib.auth.models import User
from django.contrib import auth
from public.models import *
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from django.core.exceptions import MultipleObjectsReturned
from django.core.mail import send_mail
# from Ufunlist.views import personal_info
from .models import RegVerify, PasswordVerify
from django.utils import timezone
from datetime import timedelta
from Ufunlist.views import personal_info, DEFAULT_UNIVERSITY
from Ufunlist.usetting import *
from Ufunlist import settings
import json
import random
import datetime
import os

# generate the verification code
def generate_code():
    num = ''
    for i in range(6):
        if i == random.randint(0, 5):
            num += str(random.randint(0, 9))
        else:
            num += chr(random.randint(65, 90))
    return num

def get_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

@login_required
def info(request):
    c = {}
    userdetail = request.user.userdetail
    c['email'] = request.user.email
    c['real_name'] = '' if userdetail.name is None else userdetail.name
    c['gender_list'] = []
    for i in range(len(GENDER)):
        if i == userdetail.gender:
            c['gender_list'].append({'name':GENDER[i], 'num':i, 'selected':"selected"})
        else:
            c['gender_list'].append({'name':GENDER[i], 'num':i, 'selected':""})
    c['student_id'] = '' if userdetail.stuid is None else userdetail.stuid
    c['belong_university'] = userdetail.universityid.name
    c['all_university'] = [{'name':userdetail.universityid.name, 'num':1, 'selected':"selected"}]
    count = 1
    for u in University.objects.exclude(name=c['belong_university']):
        count += 1
        c['all_university'].append({'name':u.name, 'num':count, 'selected':""})
    try:
        c['phone'] = Userphonenum.objects.filter(userid=request.user.id)[0].phonenum
    except IndexError:
        c['phone'] = ''
    try:
        c['wechat'] = Userwechat.objects.filter(userid=request.user.id)[0].wechat
    except IndexError:
        c['wechat'] = ''
    try:
        c['qq'] = Userqq.objects.filter(userid=request.user.id)[0].qq
    except IndexError:
        c['qq'] = ''
    return c

# Create your views here.
@csrf_exempt
def login(request):
    # print(request.GET, request.POST)
    uniname = DEFAULT_UNIVERSITY
    try:
        University.objects.get(name=uniname)
    except University.DoesNotExist:
        University(name=DEFAULT_UNIVERSITY, province=DEFAULT_UNIVERSITY, city=DEFAULT_UNIVERSITY, regstunum=0).save()
    if request.method == 'GET':
        return render(request, 'account/login-register.html', personal_info(request, uniname))
    elif request.method == 'POST':
        if request.is_ajax():
            loginform = LoginForm(request.POST)
            if loginform.is_valid():
                user = auth.authenticate(username=loginform.cleaned_data['id'],password=loginform.cleaned_data['password'])
                # print(user)
                if user is not None:
                    auth.login(request, user)
                    try:
                        next_to = request.GET.get("next", "/mainpage/"+user.userdetail.universityid.name+"/")
                    except Exception:
                        next_to = request.GET.get("next", "/mainpage/"+uniname+"/")
                    # log
                    Log(ip=get_ip(request), action=1, time=timezone.now(), userid=user).save()
                    return HttpResponse(json.dumps({'isSuccess':"true", 'url':next_to}), content_type="application/json")
                else:
                    try:
                        u = User.objects.get(email=loginform.cleaned_data['id'])
                    except Exception as e:
                        print(e)
                        return HttpResponse(json.dumps({'isSuccess':"false", 'url':''}), content_type="application/json")
                    user = auth.authenticate(username=u.username,password=loginform.cleaned_data['password'])
                    if user is not None:
                        auth.login(request, user)
                        try:
                            next_to = request.GET.get("next", "/mainpage/"+user.userdetail.universityid.name+"/")
                        except Exception:
                            next_to = request.GET.get("next", "/mainpage/"+uniname+"/")
                        # print(next_to, request.GET)
                        # log
                        Log(ip=get_ip(request), action=1, time=timezone.now(), userid=user).save()
                        return HttpResponse(json.dumps({'isSuccess':"true", 'url':next_to}), content_type="application/json")
                return HttpResponse(json.dumps({'isSuccess':"true", 'url':''}), content_type="application/json")
            return HttpResponse(json.dumps({'isSuccess':"false", 'url':''}), content_type="application/json")
    raise Http404

@csrf_exempt
def register(request):
    # print(request.GET, request.POST)
    uniname = DEFAULT_UNIVERSITY
    try:
        University.objects.get(name=uniname)
    except University.DoesNotExist:
        University(name=DEFAULT_UNIVERSITY, province=DEFAULT_UNIVERSITY, city=DEFAULT_UNIVERSITY, regstunum=0).save()
    if request.method == 'GET':
        return render(request, 'account/login-register.html', personal_info(request, uniname))
    elif request.method == 'POST':
        if request.is_ajax():
            regform = RegisterForm(request.POST)
            if regform.is_valid():
                # verify code
                try:
                    RegVerify.objects.filter(deadline__lt=timezone.now()).delete()
                    verify = RegVerify.objects.get(email=regform.cleaned_data['email'], deadline__gt=timezone.now())
                except RegVerify.DoesNotExist:
                    return HttpResponse(json.dumps({"isSuccess":"false", "error":"验证码已失效"}), content_type="application/json")
                if regform.cleaned_data['code'].upper() == verify.code:
                    # verify username
                    username = regform.cleaned_data['username']
                    try:
                        User.objects.get(username=username)
                        return HttpResponse(json.dumps({"isSuccess":"false", "error":"用户已存在"}), content_type="application/json")
                    except User.DoesNotExist:
                        pass
                    # verify email
                    email = regform.cleaned_data['email']
                    try:
                        User.objects.get(email=email)
                        return HttpResponse(json.dumps({"isSuccess":"false", "error":"邮箱已被注册"}), content_type="application/json")
                    except User.DoesNotExist:
                        pass
                    password = regform.cleaned_data['password']
                    # create 'user' and extended infomaition 'userdetail'
                    user = User.objects.create_user(username=username, password=password)
                    user.email = email
                    try:
                        uni = University.objects.get(name=DEFAULT_UNIVERSITY)
                    except University.DoesNotExist:
                        uni = University(name=DEFAULT_UNIVERSITY, province=DEFAULT_UNIVERSITY, city=DEFAULT_UNIVERSITY, regstunum=0)
                        uni.save()
                    mail_uniname = DEFAULT_UNIVERSITY
                    suffix = email.split('@')[1]
                    for mails in UNIVERSITY_MAILS:
                        for i in range(1, len(mails)):
                            if mails[i] == suffix:
                                mail_uniname = mails[0]
                                break
                    try:
                        uni = University.objects.get(name=mail_uniname)
                    except University.DoesNotExist:
                        uni = University.objects.get(name=DEFAULT_UNIVERSITY)
                    userdetail = Userdetail(user=user, universityid=uni, gender=0)
                    uni.regstunum = uni.regstunum + 1
                    uni.save()
                    user.save()
                    userdetail.save()
                    auth.login(request, user)
                    next_to = request.GET.get('next', "/mainpage/"+uni.name+"/")
                    # log
                    Log(ip=get_ip(request), action=1, time=timezone.now(), userid=user).save()
                    return HttpResponse(json.dumps({"isSuccess":"true", "next_to":next_to}), content_type="application/json")
                else:
                    return HttpResponse(json.dumps({"isSuccess":"false", "error":"验证码错误"}), content_type="application/json")
            else:
                return HttpResponse(json.dumps({"isSuccess":"false", "error":regform.errors}), content_type="application/json")
    raise Http404("You are in Register!")

def logout(request):
    if request.user.is_authenticated():
        # log
        Log(ip=get_ip(request), action=2, time=timezone.now(), userid=request.user).save()
        auth.logout(request)
    return HttpResponseRedirect("/mainpage/%s/"%(DEFAULT_UNIVERSITY,))

# @csrf_exempt
def verify_email(request):
    # print(request.GET)
    if request.method == 'GET':
        if request.is_ajax():
            email = request.GET.get('email', None)
            try:
                user = User.objects.get(email=email)
                return HttpResponse(json.dumps({'isvalid':"false"}), content_type="application/json")
            except MultipleObjectsReturned:
                return HttpResponse(json.dumps({'isvalid':"false"}), content_type="application/json")
            except User.DoesNotExist:
                pass
            # generate the verification code
            num = generate_code()
            print(num)
            # begin to send email to email of user
            subject = "Ufunlist Code Verification"
            message = "Your CODE from Ufunlist is [ "+str(num)+" ], please verify as soon as possible in less than a minute"
            RegVerify.objects.filter(deadline__lt=timezone.now()).delete()
            try:
                verify = RegVerify.objects.get(email=email)
                verify.code = num
                verify.deadline = (timezone.now()+timedelta(minutes=DELTATIME))
                verify.save()
            except RegVerify.DoesNotExist:
                RegVerify(email=email, code=num, deadline=(timezone.now()+timedelta(minutes=DELTATIME))).save()
            send_mail(subject, message, settings.EMAIL_HOST_USER, [email])
            return HttpResponse(json.dumps({'isvalid':"true", "next":"/"}), content_type="application/json")
    raise Http404("Not in GET or POST")

def verify_username(request):
    if request.method == 'GET':
        if request.is_ajax():
            username = request.GET.get("username", None)
            # print(username)
            try:
                user = User.objects.get(username=username)
            except User.DoesNotExist:
                return HttpResponse(json.dumps({'isSuccess':"true"}), content_type="application/json")
    return HttpResponse(json.dumps({'isSuccess':"false"}), content_type="application/json")

@csrf_exempt
def changepassword(request):
    if request.method == 'GET':
        return render(request, 'account/changepw.html', personal_info(request, DEFAULT_UNIVERSITY))
    elif request.method == 'POST':
        if request.is_ajax():
            # Get information of reset
            resetinfo = ResetForm(request.POST)
            if resetinfo.is_valid():
                email = resetinfo.cleaned_data['email']
                code = resetinfo.cleaned_data['code']
                password = resetinfo.cleaned_data['password']
                # verify code
                try:
                    PasswordVerify.objects.filter(deadline__lt=timezone.now()).delete()
                    verify = PasswordVerify.objects.get(email=email) 
                except PasswordVerify.DoesNotExist:
                    return HttpResponse(json.dumps({"isSuccess":"false", "error":"验证码已失效"}), content_type="application/json")
                if code.upper() == verify.code:
                    # email must be exist if getting one verify
                    user = User.objects.get(email=email)
                    user.set_password(password)
                    user.save()
                    return HttpResponse(json.dumps({"isSuccess":"true", "next_to":"/account/login/"}), content_type="application/json")
                else:
                    return HttpResponse(json.dumps({"isSuccess":"false", "error":"验证码输入错误"}), content_type="application/json")
            else:
                return HttpResponse(json.dumps({"isSuccess":"false", "error":"无效的输入"}), content_type="application/json")
    raise Http404("in changepassword")

def verify_changepw_email(request):
    if request.method == "GET":
        if request.is_ajax():
            email = request.GET.get('email', None)
            try:
                user = User.objects.get(email=email)
            except MultipleObjectsReturned:
                return HttpResponse(json.dumps({'isvalid':"false", "error":"该邮箱已被多人注册"}), content_type="application/json")
            except User.DoesNotExist:
                return HttpResponse(json.dumps({'isvalid':"false", "error":"该邮箱未被注册"}), content_type="application/json")
            # generate the verification code
            num = generate_code()
            print(num)
            # begin to send email to email of user
            subject = "RESET Ufunlist Code Verification"
            message = "Your CODE of changing password from Ufunlist is [ "+str(num)+" ], please verify as soon as possible in less than a minute"
            PasswordVerify.objects.filter(deadline__lt=timezone.now()).delete()
            try:
                verify = PasswordVerify.objects.get(email=email)
                verify.code = num
                verify.deadline = (timezone.now()+timedelta(minutes=DELTATIME))
                verify.save()
            except PasswordVerify.DoesNotExist:
                PasswordVerify(email=email, code=num, deadline=(timezone.now()+timedelta(minutes=DELTATIME))).save()
            send_mail(subject, message, settings.EMAIL_HOST_USER, [email])
            return HttpResponse(json.dumps({'isvalid':"true"}), content_type="application/json")
    raise Http404("In verify_changepw_email")

@login_required
def center(request, uniname):
    c = personal_info(request, uniname)
    if request.method == 'GET':
        c.update(info(request))
        return render(request, 'account/account-center.html', c)
    elif request.method == 'POST':
        pass

@login_required
@csrf_exempt
def update(request):
    if request.method != 'POST':
        return HttpResponse(json.dumps({'isSuccess':"false"}), content_type="application/json")
    info = AccountInfo(request.POST)
    if info.is_valid():
        form = info.cleaned_data
        userdetail = request.user.userdetail
        university = form.get('university', None)
        if university != None:
            old = userdetail.universityid
            old.regstunum -= 1
            old.save()
            new = University.objects.get(name=university)
            new.regstunum += 1
            new.save()
            userdetail.universityid = new
        gender = form.get('gender', None)
        if gender != None:
            userdetail.gender = gender
        studentid = form.get('studentid', None)
        if studentid != None:
            userdetail.stuid = studentid
        realname = form.get('realname', None)
        if realname != None:
            userdetail.name = realname
        tel = form.get('tel', None)
        if tel != None:
            try:
                phone = Userphonenum.objects.get(userid=request.user)
                phone.phonenum = tel
                phone.save()
            except Userphonenum.DoesNotExist:
                Userphonenum(userid=request.user, phonenum=tel).save()
            except Userphonenum.MultipleObjectsReturned:
                return HttpResponse(json.dumps({'isSuccess':"false", 'error':"%s 有多个手机号!"%(request.user.username,)}), content_type="application/json")
        wechat_input = form.get('wechat', None)
        if wechat_input != None:
            try:
                we = Userwechat.objects.get(userid=request.user)
                we.wechat = wechat_input
                we.save()
                Userwechat.objects.get(userid=request.user)
            except Userwechat.DoesNotExist:
                Userwechat(userid=request.user, wechat=wechat_input).save()
            except Userwechat.MultipleObjectsReturned:
                return HttpResponse(json.dumps({'isSuccess':"false", 'error':"%s 有多个微信号!"%(request.user.username,)}), content_type="application/json")
        qq = form.get('qq', None)
        if qq != None:
            try:
                w = Userqq.objects.get(userid=request.user.id)
                w.qq = qq
                w.save()
            except Userqq.DoesNotExist:
                Userqq(userid=request.user, qq=qq).save()
            except Userqq.MultipleObjectsReturned:
                return HttpResponse(json.dumps({'isSuccess':"false", 'error':"%s 有多个QQ号!"%(request.user.username,)}), content_type="application/json")
        userdetail.save()
        return HttpResponse(json.dumps({'isSuccess':"true"}), content_type="application/json")
    print("error")
    raise Http404("In update.")

@login_required
def get_info(request):
    if request.method == 'GET':
        content_type = request.GET.get('contentType', None)
        if content_type != None:
            if content_type == '1':
                c = info(request)
                c['username'] = request.user.username
                ulist = [u['name'] for u in c['all_university']]
                c['university'] = [ulist[0]]
                c['university'].extend(ulist)
                c['gender'] = request.user.userdetail.gender
                c['id'] = c['student_id']
                c['realname'] = c['real_name']
                c['tel'] = c['phone']
                return HttpResponse(json.dumps(c), content_type="application/json")
            elif content_type == '2':
                page_num = request.GET.get('pageNum', None)
                if page_num != None:
                    page_num = int(page_num)
                    all_posts = Post.objects.filter(userid=request.user.id).order_by('-time')
                    c = {}
                    tmp = len(all_posts)
                    if tmp == 0:
                        c['total_pages'] = 1
                    else:
                        c['total_pages'] = tmp//SEARCH_PAGE_LENGTH + (0 if tmp%SEARCH_PAGE_LENGTH == 0 else 1)
                    posts = []
                    for post in all_posts[SEARCH_PAGE_LENGTH*(page_num-1):SEARCH_PAGE_LENGTH*page_num]:
                        posts.append({'title':post.maintitle, 'post_url':"/%s/details/"%(post.id,)})
                    c['posts'] = posts
            elif content_type == '3':
                page_num = request.GET.get('pageNum', None)
                if page_num != None:
                    page_num = int(page_num)
                    all_posts = Userlikepost.objects.filter(userid=request.user.id).order_by('-id')
                    c = {}
                    tmp = len(all_posts)
                    if tmp == 0:
                        c['total_pages'] = 1
                    else:
                        c['total_pages'] = tmp//SEARCH_PAGE_LENGTH + (0 if tmp%SEARCH_PAGE_LENGTH == 0 else 1)
                    posts = []
                    for post in all_posts[SEARCH_PAGE_LENGTH*(page_num-1):SEARCH_PAGE_LENGTH*page_num]:
                        posts.append({'title':post.postid.maintitle, 'post_url':"/%s/details/"%(post.postid.id,)})
                    c['posts'] = posts
            elif content_type == '4':
                page_num = request.GET.get('pageNum', None)
                if page_num != None:
                    page_num = int(page_num)
                    all_logs = Log.objects.filter(userid=request.user.id).order_by('-id')
                    c = {}
                    tmp = len(all_logs)
                    if tmp == 0:
                        c['total_pages'] = 1
                    else:
                        c['total_pages'] = tmp//SEARCH_PAGE_LENGTH + (0 if tmp%SEARCH_PAGE_LENGTH == 0 else 1)
                    logs = []
                    for log in all_logs[SEARCH_PAGE_LENGTH*(page_num-1):SEARCH_PAGE_LENGTH*page_num]:
                        time = log.time + datetime.timedelta(hours=8)
                        if log.action == 1:
                            title = "%s: 【%s】 ---at %s----  log IN"%(request.user.username, time.strftime("%Y-%m-%d %H:%I:%S"), log.ip)
                        elif log.action == 2:
                            title = "%s: 【%s】 ---at %s----  log OUT"%(request.user.username, time.strftime("%Y-%m-%d %H:%I:%S"), log.ip)
                        else:
                            title = "Take care, Invalid Log!"
                        logs.append(title)
                    c['logs'] = logs                
            else:
                raise Http404("In get_info")
        return HttpResponse(json.dumps(c), "application/json")

def delpost(request):
    href = request.GET.get('postHref', None)
    if href is not None:
        postid = int(href.split('/')[2])
        try:
            post = Post.objects.get(id=postid)
            for pic in Picture.objects.filter(postid=post):
                abs_name = pic.path + pic.name
                os.remove(settings.BASE_DIR+abs_name)
                pic.delete()
                # print(settings.BASE_DIR+abs_name)
            post.delete()
            return HttpResponse(json.dumps({'isSuccess':"true"}), content_type="application/json")
        except Post.DoesNotExist:
            pass
    return HttpResponse(json.dumps({'isSuccess':"false"}), content_type="application/json")
