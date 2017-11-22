from django.conf.urls import url, include
from . import views

urlpatterns = [
    url(r'^login/?$', views.login),
    url(r'^logout/?$', views.logout),
    url(r'^register/?$', views.register),
    url(r'^changepassword?/$', views.changepassword),
    url(r'^changepassword/verify/email/?$', views.verify_changepw_email),
    url(r'^verify/email/?$', views.verify_email),
    url(r'^verify/username/?$', views.verify_username),

    url(r'^center/(?P<uniname>[^/]+)/?$', views.center),
    url(r'^update/?$', views.update),
    url(r'^getinfo/?$', views.get_info),
    url(r'^delpost/?$', views.delpost),
]
