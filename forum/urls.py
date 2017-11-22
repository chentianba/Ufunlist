from django.conf.urls import url
from . import views

urlpatterns = [
    # url(r'^search/(?P<uniname>[^/]+)/(?P<sectionid>\d+)/$', views.search),
    url(r'^reply/(?P<uniname>[^/]+)/(?P<postid>\d+)/$', views.reply),
    url(r'^post/(?P<uniname>[^/]+)/$', views.post),
    url(r'^getpage/?$', views.get_page),
    url(r'^newreply/?$', views.new_reply),
    url(r'replytohost/?$', views.reply_to_host),
]
