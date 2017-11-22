// initiate
$(function(){
    $('[data-toggle="popover"]').popover();
});

// window.onload = function(){
//     // alert(screen.width)
//     $(".carousel-item img").each(function(){
//         var naturalWidth = $(this).get(0).naturalWidth;
//         var naturalHeight = $(this).get(0).naturalHeight;
//         // alert(naturalHeight)
//         var ratio = naturalWidth / naturalHeight;
//         if(ratio > 5/3){
//             // $(this).attr("width", "500px");
//             // $(this).addClass(".img-width1").addClass(".img-width2");
//             if(screen.width <= 768){
//                 $(this).attr("width", "200px");
//             }
//             else{
//                 $(this).attr("width", "500px");
//             }
//         }
//         else{
//             // $(this).attr("height", "300px");
//             // $(this).addClass(".img-height1").addClass(".img-height2");
//             if(screen.width <= 768){
//                 $(this).attr("height", "150px");
//             }
//             else{
//                 $(this).attr("height", "300px");
//             }
//         }
//     });

// };

$(".carousel-item img").each(function(){
    var naturalWidth = $(this).get(0).naturalWidth;
    var naturalHeight = $(this).get(0).naturalHeight;
    // alert(naturalHeight)
    // var ratio = $(this).attr("width") / $(this).attr("height");
    var ratio = parseInt($(this).attr("width").replace(/px/, ""))/parseInt($(this).attr("height").replace(/px/, ""))
    // alert(ratio)
    if(ratio > 5/3){
        // $(this).attr("width", "500px");
        // $(this).addClass(".img-width1").addClass(".img-width2");
        $(this).removeAttr("height");
        if(screen.width <= 768){
            $(this).attr("width", "200px");
        }
        else{
            $(this).attr("width", "500px");
        }
    }
    else{
        // $(this).attr("height", "300px");
        // $(this).addClass(".img-height1").addClass(".img-height2");
        $(this).removeAttr("width");
        if(screen.width <= 768){
            $(this).attr("height", "150px");
        }
        else{
            $(this).attr("height", "300px");
        }
    }
});

$(function(){
    $("#fav").click(function(){
        if($("#user-label").text() == "我的账户"){
            alert("您需要登录才能收藏该发布！")
        }
        else{
            if($("#fav").hasClass("fa-star-o")){
                $.ajax({
                    url:"/getpage/",
                    type:"GET",
                    data:{
                        favorite: true,
                        postId: $("#current-id").text()
                    },
                    success:function (data, textStatus) {
                        if(data.isSuccess == "true"){
                            $("#fav").removeClass("fa-star-o").addClass("fa-star");
                        }
                    }
                });
            }
            else{
                $.ajax({
                    url:"/getpage/",
                    type:"GET",
                    data:{
                        favorite: false,
                        postId: $("#current-id").text()
                    },
                    success:function (data, textStatus) {
                        if(data.isSuccess== "true"){
                            $("#fav").removeClass("fa-star").addClass("fa-star-o");
                        }
                    }
                });
            }
        }
    });

    $("#last-btn").click(function () {
        window.location.href = $("#last-url").text();
    });

    $("#next-btn").click(function () {
        window.location.href = $("#next-url").text();
    });

    var replyInfo = $("#reply-btn").attr("data-content");
    $("#reply-btn").click(function(){
        if($("#user-label").text() == "我的账户"){
            // $("#reply-btn").attr("data-content", "您需要登录才能查看该回复信息！");
            // $("#reply-btn").popover('show');
            alert("您需要登录才能查看该回复信息！");
        }
        else{
            $("#reply-btn").attr("data-content", replyInfo);
            $("#reply-btn").popover('show');
        }
    });
    $("#reply-btn").blur(function(){
        $("#reply-btn").popover('hide');
    });
});
