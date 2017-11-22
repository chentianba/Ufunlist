"""Ufunlist URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from . import views
from Ufunlist import settings
from django.conf.urls.static import static
import account
import forum

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^account/', include('account.urls')),
    url(r'^login/?$', account.views.login),
    url(r'^logout/?$', account.views.logout),
    url(r'^forum/', include('forum.urls')),
    url(r'^$', views.mainpage),
    url(r'^mainpage/(?P<uniname>[^/]+)/?$', views.mainpage),
    url(r'^about/(?P<uniname>[^/]+)/?$', views.about),
    url(r'^search/', include('search.urls')),
    url(r'^post/(?P<uniname>[^/]+)/?$', forum.views.post),
    
    url(r'^(?P<uniname>[^/]+)/(?P<postid>\d+)/details/$', views.details),
    url(r'^getpage/?$', views.like),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)