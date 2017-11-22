from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class University(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=48, unique=True, db_index=True)
    province = models.CharField(max_length=32)
    city = models.CharField(max_length=32)
    regstunum = models.PositiveIntegerField()
    def __str__(self):
        return u'%s %s %s %s' % (self.name, self.province, self.city, self.regstunum)

class Userdetail(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.OneToOneField(User, unique=True, related_name="userdetail")
    stuid = models.CharField(max_length=16, null=True)
    gender = models.PositiveIntegerField() # 0 is ?, 1 is man and 2 is woman
    name = models.CharField(max_length=32, null=True)
    universityid = models.ForeignKey(University, on_delete=models.DO_NOTHING, related_name='userdetail', db_index=True, null=True)

class Log(models.Model):
    id = models.BigAutoField(primary_key=True)
    ip = models.GenericIPAddressField()
    action = models.PositiveIntegerField(default=0) # 1 is login, and 2 is logout
    time = models.DateTimeField()
    userid = models.ForeignKey(User, on_delete=models.CASCADE, db_index=True)

class Category(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=48, unique=True)
    parentid = models.ForeignKey('self', on_delete=models.CASCADE ,db_index=True, null=True)
    isforum = models.BooleanField()
    def __str__(self):
        if self.parentid:
            return u'%s %s %s %s' % (self.id, self.name ,self.parentid.id, self.isforum)
        else:
            return u'%s %s %s %s' % (self.id, self.name ,self.parentid, self.isforum)

class Post(models.Model):
    id = models.BigAutoField(primary_key=True)
    time = models.DateTimeField()
    deadtime = models.DateTimeField()
    maintitle = models.TextField()
    subtitleid = models.PositiveIntegerField() # 0 means nothinig, 1 means number, 2 means string
    subtitle = models.TextField() # means price or others, now it's just price, salary
    content = models.TextField()
    haspicture = models.PositiveIntegerField() # 0 means no, 1 means yes
    popularity = models.PositiveIntegerField()
    activetime = models.PositiveIntegerField() # 0 means that now it's out of date
    replymethodid = models.PositiveIntegerField() # 1, 2, 3, 4 -> [phone, email, qq, wechat]
    replymethod = models.CharField(max_length=48)
    userid = models.ForeignKey(User, on_delete=models.CASCADE, db_index=True)
    categoryid = models.ForeignKey(Category, on_delete=models.DO_NOTHING, db_index=True)
    state = models.PositiveIntegerField() # 0 means invalid and 1 means valid
    def __str__(self):
        return u'%s %s %s %s' % (self.maintitle, self.userid, self.userid, self.haspicture)

class Forumpost(models.Model):
    id = models.BigAutoField(primary_key=True)
    title = models.TextField(null=True)
    content = models.TextField()
    time = models.DateTimeField()  #when post is created
    userid = models.ForeignKey(User, on_delete=models.CASCADE, db_index=True)
    parentid = models.ForeignKey('self', null=True, on_delete=models.CASCADE, db_index=True)
    categoryid = models.ForeignKey(Category, on_delete=models.DO_NOTHING, db_index=True)
    class Meta:
        ordering = ['-time']
    def __str__(self):
        if self.parentid:
            return u'%s %s %s %s %s %s %s' % (self.id, self.title, self.content, self.time, self.userid.username, self.parentid.id, self.categoryid.name)
        else:
            return u'%s %s %s %s %s %s %s' % (self.id, self.title, self.content, self.time, self.userid.username, self.parentid, self.categoryid.name)

class Picture(models.Model):
    name = models.CharField(max_length=48)
    postid = models.ForeignKey(Post, on_delete=models.CASCADE)
    path = models.CharField(max_length=64)
    class Meta:
        unique_together = (("postid", "path","name"),)
    def __str__(self):
        return u'%s %s %s' % (self.id, self.postid.id, self.path+self.name)

class Userlikepost(models.Model):
    userid = models.ForeignKey(User, on_delete=models.CASCADE)
    postid = models.ForeignKey(Post, on_delete=models.CASCADE, db_index=True)
    class Meta:
        unique_together = (("userid", "postid",),)
    def __str__(self):
        return u'%s %s' % (self.userid.username, self.postid)

class Userphonenum(models.Model):
    userid = models.OneToOneField(User, on_delete=models.CASCADE, db_index=True)
    phonenum = models.CharField(max_length=32)
    def __str__(self):
        return u'%s %s' % (self.userid.username, self.phonenum)

class Useremail(models.Model):
    userid = models.OneToOneField(User, on_delete=models.CASCADE, db_index=True)
    email = models.EmailField()
    def __str__(self):
        return u'%s %s' % (self.userid.username, self.email)

class Userqq(models.Model):
    userid = models.OneToOneField(User, on_delete=models.CASCADE, db_index=True)
    qq = models.CharField(max_length=32)
    def __str__(self):
        return u'%s %s' % (self.userid.username, self.qq)

class Userwechat(models.Model):
    userid = models.OneToOneField(User, on_delete=models.CASCADE, db_index=True)
    wechat = models.CharField(max_length=48)
    def __str__(self):
        return u'%s %s' % (self.userid.username, self.wechat)