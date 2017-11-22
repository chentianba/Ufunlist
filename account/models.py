from django.db import models
from public.models import University

# Create your models here.
class RegVerify(models.Model):
    id = models.BigAutoField(primary_key=True)
    email = models.EmailField(unique=True)
    code = models.CharField(max_length=6)
    deadline = models.DateTimeField()
    def __str__(self):
        return u'%s %s %s %s' % (self.id, self.email, self.code, self.deadline)

class PasswordVerify(models.Model):
    id = models.BigAutoField(primary_key=True)
    email = models.EmailField(unique=True)
    code = models.CharField(max_length=6)
    deadline = models.DateTimeField()
    def __str__(self):
        return u'%s %s %s %s' % (self.id, self.email, self.code, self.deadline)
