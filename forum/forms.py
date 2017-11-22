from django import forms

class PostForm(forms.Form):
    topCategory = forms.IntegerField()
    subCategory = forms.IntegerField()
    title = forms.CharField()
    subtitle = forms.IntegerField(required=False)
    image_files = forms.Field(required=False, widget=forms.ClearableFileInput(attrs={'multiple': True}))
    content = forms.CharField()
    contactMethod = forms.IntegerField(required=False)
    contactContent = forms.CharField(required=False)
    activeTime = forms.IntegerField(required=False)

class ForumSearchForm(forms.Form):
    searchContent = forms.CharField(required=False)
    titleOnly = forms.CharField(required=False)
    hasPic = forms.CharField(required=False)
    topCategory = forms.IntegerField()
    subCategory = forms.IntegerField()
    curUniId = forms.IntegerField()
    pageNum = forms.IntegerField()

class NewReplyForm(forms.Form):
    replyId = forms.IntegerField()
    username = forms.CharField()
    replyContent = forms.CharField()

class ReplyToHostForm(forms.Form):
    replyId = forms.IntegerField()
    content = forms.CharField()

