from django.db import models
from public.models import Forumpost

# Create your models here.
# class CacheForumpost(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     related = models.ForeignKey(Forumpost)
#     title = models.TextField()
#     childnum = models.PositiveIntegerField()
#     time = models.DateTimeField()
#     class Meta:
#         ordering = ['-time']
#     def __str__(self):
#         return u'%s %s %s %s' % (self.id, self.title, self.childnum, self.time)