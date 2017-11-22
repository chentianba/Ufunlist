from public.models import *
from account.models import *
# import datetime
from django.utils import timezone
from django.contrib.auth.models import User
import random

def category():
	notification = Category(name='通知',isforum=False)
	notification.save()
	Category(name='校内通知', parentid=notification, isforum=False).save()
	Category(name='院系通知', parentid=notification, isforum=False).save()
	Category(name='社团活动', parentid=notification, isforum=False).save()
	lostfound = Category(name='失物招领',isforum=False)
	lostfound.save()
	Category(name='重要证件',parentid=lostfound, isforum=False).save()
	Category(name='较大价值',parentid=lostfound, isforum=False).save()
	Category(name='普通物件',parentid=lostfound, isforum=False).save()
	deal = Category(name='购物',isforum=False)
	deal.save()
	Category(name='卖物',parentid=deal, isforum=False).save()
	Category(name='求购',parentid=deal, isforum=False).save()
	friends = Category(name='交友', isforum=False)
	friends.save()
	Category(name='男生',parentid=friends, isforum=False).save()
	Category(name='女生',parentid=friends, isforum=False).save()
	jobs = Category(name='工作', isforum=False)
	jobs.save()
	Category(name='全职', parentid=jobs, isforum=False).save()
	Category(name='兼职', parentid=jobs, isforum=False).save()
	forum = Category(name='论坛',isforum=True)
	forum.save()
	Category(name='本科生', parentid=forum, isforum=True).save()
	Category(name='研究生', parentid=forum, isforum=True).save()
	Category(name='博士生', parentid=forum, isforum=True).save()

def university():
	University(name='吉林大学', province='吉林省', city='长春市', regstunum='0').save()
	University(name='东北师大', province='吉林省', city='长春市', regstunum='0').save()
	University(name='长春理工大学', province='吉林省', city='长春市', regstunum='0').save()

def user():
	un = University.objects.get(name='吉林大学')
	user = User.objects.create_user(username='我的账户', password='ls131flj231a213')
	user.save()
	userdetail = Userdetail(user=user, stuid='', gender=0, name='', universityid=un)
	userdetail.save()

def showall():
	print(University.objects.all())
	print(Userdetail.objects.all())
	print(Category.objects.all())
	print(Post.objects.all())
	print(Forumpost.objects.all())
	print(RegVerify.objects.all())
	print(PasswordVerify.objects.all())
	print(User.objects.all())

def initialize():
	category()
	university()
	user()
