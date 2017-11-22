function showLog(myPageNum){
    $.ajax({
        url: "/account/getinfo/",
        type:"GET",
        data:{
            contentType: 4,
            pageNum: myPageNum
        },  // 4 for log
        success:function(data){
            console.log(data)
            $("#account-content").empty();
            $("#account-content").append('<div class="list-group"></div>');
            var i;
            for(i = 0; i < data.logs.length; i++){
                $("#account-content .list-group").append(' \
                    <div class="d-inline-flex justify-content-between border-bottom"> \
                    <span class="list-group-item no-background border-0">' +data.logs[i]+ '</span> \
                    </div> \
                ');
            }
            total_pages = data.total_pages;
            $("#account-content").append(' \
                <div class="card-footer mx-2 mt-2 p-0 pt-2 rounded-0 border-0 no-background"> \
                    <ul class="pagination justify-content-center no-background"> \
                        <li id="last-page" class="page-item"><span class="page-link bkg-white-color">&lt; 上一页</span></li> \
                        <li class="page-item"><span class="page-link bkg-white-color">' +myPageNum+ ' / ' +total_pages+ '</span></li> \
                        <li id="next-page" class="page-item"><span class="page-link bkg-white-color">下一页 &gt;</span></li> \
                    </ul> \
                </div> \
            ');
            if(myPageNum == 1){
                $("#last-page").addClass("no-click disabled");
            }
            if(myPageNum == total_pages){
                $("#next-page").addClass("no-click disabled");
            }
        }
    });
}

function showPost(myUrl, myPageNum, myContentType){
    $.ajax({
        url: myUrl,
        type:"GET",
        data:{
            contentType: myContentType,
            pageNum: myPageNum
        },  // 2 for post
        success:function(data){
            console.log(data)
            $("#account-content").empty();
            $("#account-content").append('<div class="list-group"></div>');
            var i;
            console.log($("#navbardrop").text())
            for(i = 0; i < data.posts.length; i++){
                var fixedUrl = "/"+$("#navbardrop").text()+data.posts[i].post_url;
                if(myContentType == 2){
                    $("#account-content .list-group").append(' \
                        <div class="d-inline-flex justify-content-between border-bottom"> \
                            <a href='+fixedUrl+ ' class="list-group-item no-background border-0 break-word">' +data.posts[i].title+ '</a> \
                            <span id="del-post" class="px-3 d-inline-flex"> \
                                <span class="fa fa-trash font-medium align-self-center"></span> \
                            </span> \
                        </div> \
                    ');
                }
                else{
                    $("#account-content .list-group").append(' \
                        <div class="d-inline-flex justify-content-between border-bottom"> \
                            <a href='+fixedUrl+ ' class="list-group-item no-background border-0 break-word">' +data.posts[i].title+ '</a> \
                        </div> \
                    ');
                }
            }
            var total_pages = data.total_pages;
            $("#account-content").append(' \
                <div class="card-footer mx-2 mt-2 p-0 pt-2 rounded-0 border-0 no-background"> \
                    <ul class="pagination justify-content-center no-background"> \
                        <li id="last-page" class="page-item"><span class="page-link bkg-white-color">&lt; 上一页</span></li> \
                        <li class="page-item"><span class="page-link bkg-white-color">' +myPageNum+ ' / ' +total_pages+ '</span></li> \
                        <li id="next-page" class="page-item"><span class="page-link bkg-white-color">下一页 &gt;</span></li> \
                    </ul> \
                </div> \
            ');
            if(myPageNum == 1){
                $("#last-page").addClass("no-click disabled");
            }
            if(myPageNum == total_pages){
                $("#next-page").addClass("no-click disabled");
            }
        }
    });
}

// initiate
$(function(){
    $('[data-toggle="popover"]').popover()
});

function hideAll(){
    $("#center-id").popover('hide');
    $("#center-tel").popover('hide');
    $("#center-qq").popover('hide');
}

$(function(){
    $("#account-nav span").click(function(){
        hideAll();
    });
    $("input").focus(function(){
        $(this).popover('hide');
    });
});

$(function(){
    var curContent = 1;
    var curPage = 1;
    $("#account-center").click(function(){
        curContent = 1;
        $("#account-nav").find(".bkg-white-color").removeClass("bkg-white-color");
        $("#account-center").addClass("bkg-white-color");
        $("#account-content").empty();
        $("#account-content").load("/static/html/base.html");
        // $("#account-content").append('<p id="test">123<p>');
        // $("#test").text("lalala");
        $.ajax({
            url:"/account/getinfo/",
            type:"GET",
            data:{contentType: 1},  // 1 for center
            success:function(data){
                console.log(data)
                // alert(data.qq)
                $("#center-username").val(data.username);
                $("#center-email").val(data.email);
                $("#center-university").val(data.university[0]); 
                // var uniNum = data.university.length-1;
                // var i;
                // for(i = 1; i < uniNum+1; i++){
                //     $("#center-university").append('<option>'+data.university[i]+'</option>');
                // }
                // $("#center-university option[text=data.university[0]]").attr("selected", true);
                $("#center-gender").val(data.gender);
                // $("#center-gender option[text=data.gender]").attr("selected", true);
                $("#center-id").val(data.id);
                $("#center-realname").val(data.realname);
                $("#center-tel").val(data.tel);
                $("#center-wechat").val(data.wechat);
                $("#center-qq").val(data.qq);
            }
        });   
    });

    $("#account-post").click(function(){
        curContent = 2;
        curPage = 1;
        $("#account-nav").find(".bkg-white-color").removeClass("bkg-white-color");
        $("#account-post").addClass("bkg-white-color");
        $("#account-content").empty(); 
        $("#account-content").append('<div class="list-group"></div>');
        // alert(curPage);

        // var i;
        // for(i = 0; i < 10; i++){
        //     $("#account-content .list-group").append(' \
        //         <div class="d-inline-flex justify-content-between border-bottom"> \
        //             <a href='+'212345#'+' class="list-group-item no-background border-0">'+'1237848484848488'+'</a> \
        //             <span class="px-3 d-inline-flex"> \
        //                 <span class="fa fa-trash font-medium align-self-center"></span> \
        //             </span> \
        //         </div> \
        //     ');
        // }  
        // $("#account-content").append(' \
        // <div class="card-footer mx-2 mt-2 p-0 pt-2 rounded-0 border-0 no-background"> \
        //     <ul class="pagination justify-content-center no-background"> \
        //         <li id="last-page" class="page-item disabled"><span class="page-link bkg-white-color">&lt; 上一页</span></li> \
        //         <li class="page-item disabled"><span class="page-link bkg-white-color">1 / ' +123+ '</span></li> \
        //         <li id="next-page" class="page-item"><span class="page-link bkg-white-color">下一页 &gt;</span></li> \
        //     </ul> \
        // </div> \
        // ');

        showPost("/account/getinfo/", curPage, 2);
        // $("#next-page").click(function(){
        //     curPage += 1;
        //     showPost("/account/getinfo/", curPage, 2);
        // });
        // $("#last-page").click(function(){
        //     // alert("tick");
        //     curPage -= 1;
        //     showPost("/account/getinfo/", curPage, 2);
        // });
        $(document).off("click", "#next-page");
        $(document).off("click", "#last-page");
        $(document).on("click", "#next-page", function(){
            curPage += 1;
            showPost("/account/getinfo/", curPage, 2);
        });
        $(document).on("click", "#last-page", function(){
            curPage -= 1;
            showPost("/account/getinfo/", curPage, 2);
        });
        $(document).on("click", ".fa-trash", function(){
            $.ajax({
                url: "/account/delpost/",
                type: "GET",
                data: {
                    postHref: $(this).parent().prev().attr("href")  
                },
                success: function(data){
                    if(data.isSuccess == "true"){
                        alert("删除成功！")
                        showPost("/account/getinfo/", curPage, 2);
                    }else{
                        alert("删除失败！");
                    }
                }
            });
        });
    });

    $("#account-favorite").click(function(){
        curContent = 3;
        curPage = 1;
        $("#account-nav").find(".bkg-white-color").removeClass("bkg-white-color");
        $("#account-favorite").addClass("bkg-white-color");
        $("#account-content").empty(); 
        $("#account-content").append('<div class="list-group"></div>');
        // alert(curPage);

        showPost("/account/getinfo/", curPage, 3);
        $(document).off("click", "#next-page");
        $(document).off("click", "#last-page");
        $(document).on("click", "#next-page", function(){
            curPage += 1;
            showPost("/account/getinfo/", curPage, 3);
        });
        $(document).on("click", "#last-page", function(){
            curPage -= 1;
            showPost("/account/getinfo/", curPage, 3);
        });
    });

    $("#account-log").click(function(){
        curContent = 4;
        curPage = 1;
        $("#account-nav").find(".bkg-white-color").removeClass("bkg-white-color");
        $("#account-log").addClass("bkg-white-color");
        $("#account-content").empty(); 
        $("#account-content").append('<div class="list-group"></div>');
        showLog(curPage);
        $(document).off("click", "#next-page");
        $(document).off("click", "#last-page");
        $(document).on("click", "#next-page", function(){
            curPage += 1;
            showLog(curPage);
        });
        $(document).on("click", "#last-page", function(){
            curPage -= 1;
            showLog(curPage);
        });
    });

    $("#account-changepw").click(function(){
        location.href = "/account/changepassword/";  
    });

    $("#account-logout").click(function(){
        location.href = "/account/logout/";
        
    });
});


$(function(){
    var validTel = true;
    var ischanged = false;

    $(document).on("click", "#center-btn", function(){
        if($("#center-tel").val()!="" && ($("#center-tel").val().length!=11 || isNaN($("#center-tel").val())==true)){
            $("#center-tel").popover('show');
            return ;
        }
        else{
            $("#center-tel").popover('hide');
        }

        if($("#center-qq").val()!="" && !/^[^0]\d{4,9}$/.test($("#center-qq").val())){
            $("#center-qq").popover('show');
            return ;
        }
        else{
            $("#center-qq").popover('hide');
        }

        if($("#center-id").val()!="" && isNaN($("#center-id").val())==true){
            $("#center-id").popover('show');
            return ;
        }
        else{
            $("#center-id").popover('hide');
        }
        $.ajax({
            url:"/account/update/",
            type:"POST",
            data:{
                university: $("#center-university").val(),
                // university: $("#center-university").find("option:selected").text(),
                gender: $("#center-gender").val(),
                // gender: $("#center-gender").find("option:selected").text(),
                studentid: $("#center-id").val(),
                realname: $("#center-realname").val(),
                tel: $("#center-tel").val(),
                wechat: $("#center-wechat").val(),
                qq: $("#center-qq").val()
            },
            success:function (data, textStatus) {
                // alert("tick");
                if(data.isSuccess=="true"){
                    alert("保存成功！")
                }
                else{
                    alert("保存失败！\n"+data.error);
                }
            }
        });
    });

});

