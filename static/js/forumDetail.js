$(function () {
    var replyTo=-1;
    var userName=$('#userName').html();
    var hostThreadId=$('#hostThreadId').text();
    console.log('nihao');
    function showReplyCollapse() {
        var btn=$(this);
        var wholeCollapse=btn.parent().siblings('.collapse');
        wholeCollapse.collapse('toggle');
        if(btn.hasClass('no-background'))
        {
            btn.removeClass('no-background').addClass('bkg-dark-color');
            btn.html('收起回复');
        }
        else
        {
            btn.removeClass('bkg-dark-color').addClass('no-background');
            btn.html('回复');
        }
        btn.trigger('blur');
    }

    $('.replyBtn').on('click',showReplyCollapse);

    function smallReply() {
        if(userName=='我的账户')
        {
            $('#loginModal').modal('show');
            return false;
        }
        var btn=$(this);
        replyTo=btn.siblings('.threadId').html();
        var collapse=btn.parents('.replyColumn').children('.collapse');
        collapse.collapse('show');
        var name=btn.parent().siblings().find('.replyName').html();
        collapse.find('textarea').val('回复 '+name).trigger('focus');

    }
    $('.smallReply').click(smallReply);
    $('.replyHostBtn').on('click',function () {
        $(document).scrollTop($('#replyContent').offset().top);
        $('#replyContent').trigger('focus');
    });
    $('.letMeSay').click(function () {
        if(userName=='我的账户')
        {
            $('#loginModal').modal('show');
            return false;
        }
        //replyTo=$(this).parents('.replyWholeCollapse').siblings().find('.threadId').html();
        var collapse=$(this).parent().siblings('.collapse');
        collapse.collapse('toggle');
        collapse.find('textarea').val('').trigger('focus');
    });
    $('.replyWholeCollapse').each(function (index) {
        //console.log('each');
        if($(this).find('.replyRow').length>1)
        {
            //console.log('length>0');
            $(this).siblings().find('.replyBtn').trigger('click');
        }
    });
    $('.replyInputBtn').click(function () {
        var textArea=$(this).siblings('textarea');
        textArea.on('focus',function () {
            $(this).popover('hide');
        });
        var content=textArea.val();
        var realContent=content;
        if(content[0]=='回'&&content[1]=='复')
        {
            //console.log('reply');
            realContent=content.slice(content.indexOf(':')+1);
        }
        else
        {
            replyTo=$(this).parents('.replyWholeCollapse').siblings().find('.threadId').html();
        }
        if(realContent=='')
        {
            textArea.popover({
                content: '回复内容不能为空',
                placement: 'top',
                trigger: 'manual'
            });
            textArea.popover('show');
            return false;
        }
        //ajax post reply
        $.ajax({
            url: '/forum/newreply/',
            data: {
            replyId: replyTo,
            username: userName,
            replyContent: realContent
            },
            method: 'POST',
            dataType: 'json',
            context: $(this),
            success: function (data) {
                console.log(data);
                if(data.success)
                {
                    console.log('success');
                    var lastReply=$(this).parents('.replyWholeCollapse').find('.replyRow').last();
                    //var d=new Date();
                    //var dateString=d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate();
                    lastReply.after('<div class="d-flex flex-column border-bottom replyRow mt-1"> \
                                    <div class="d-flex flex-row align-items-top"> \
                                        <p class="text-info m-0 mx-1 replyName">'+userName+':</p> \
                                        <p class="m-0 break-word">'+content+'</p> \
                                    </div> \
                                    <div class="d-flex flex-row justify-content-end align-items-center"> \
                                        <p class="font-small p-0 m-0 mr-2 text-secondary threadId" hidden>'+data.id+'</p> \
                                        <p class="font-small p-0 m-0 mr-2 text-secondary">'+data.time+'</p> \
                                        <button class="btn no-background rounded-0 font-small p-0 text-secondary smallReply">回复</button>  \
                                    </div> \
                                </div>');
                    $('.smallReply').click(smallReply);
                    $(this).siblings('textarea').val('');
                }
            }
        });

    });
    $('#replyToHostBtn').click(function () {
        event.preventDefault();
        var replyTextArea=$('#replyContent');
        if(!(replyTextArea.val()))
        {
            replyTextArea.popover({
                content: '请输入内容',
                trigger: 'mannual',
                placement: 'bottom'
            });
            replyTextArea.popover('show');
            replyTextArea.on('focus',function () {
                replyTextArea.popover('hide');
            });
            return false;
        }
        $(this).html('<i class="fa fa-spinner fa-spin fa-1x fa-fw"></i>');
        $.post('/forum/replytohost/',{
            replyId: hostThreadId,
            content: replyTextArea.val()
        },function (data) {
            location.reload();
        },'json');
    });
    $('#addNewBtn').click(function () {
        if(userName=='我的账户')
        {
            $('#loginModal').modal('show');
            return false;
        }
    });
    // $('#likeBtn').click(function () {
    //     if(userName=='我的账户')
    //     {
    //         $('#loginModal').modal('show');
    //         return false;
    //     }
    //     $.post('#',{
    //         threadId: hostThreadId,
    //     },function (data) {
    //         if(data.success)
    //         {
    //             $('#likeBtn').attr('disabled','').text('已收藏');
    //         }
    //     },'json');
    //     //$('#likeBtn').attr('disabled','').text('已收藏');
    // });
    console.log(userName);
    if(userName=='我的账户')
    {
        $('#replyContent').attr('placeholder','只有登录用户可以回复');
        $('#replyContent').attr('readonly','');
        $('#replyToHostBtn').attr('disabled','');
    }
});