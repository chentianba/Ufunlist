from django import forms

class LoginForm(forms.Form):
    id = forms.CharField()
    password = forms.CharField()

class RegisterForm(forms.Form):
    username = forms.CharField(max_length=48)
    email = forms.EmailField()
    code = forms.CharField(max_length=6, min_length=6)
    password = forms.CharField()

class ResetForm(forms.Form):
    email = forms.EmailField()
    code = forms.CharField(max_length=6, min_length=6)
    password = forms.CharField()

class AccountInfo(forms.Form):
    university = forms.CharField()
    gender = forms.IntegerField()
    studentid = forms.CharField(max_length=16, required=False)
    realname = forms.CharField(max_length=32, required=False)
    tel = forms.CharField(required=False)
    wechat = forms.CharField(required=False)
    qq = forms.CharField(required=False)
