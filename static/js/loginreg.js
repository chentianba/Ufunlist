function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function hideAll(){
    $("#login-email").popover('hide');
    $("#login-pw").popover('hide');
    $("#login-btn").popover('hide');
    $("#reg-username").popover('hide');
    $("#reg-email").popover('hide');
    $("#reg-captcha").popover('hide');
    $("#reg-pw").popover('hide');
    $("#reg-pw2").popover('hide');
}
$(function(){
    $("#myTab a").click(function(){
        hideAll();
    });
});

// initiate
$(function(){
    $('[data-toggle="popover"]').popover()
});

$(function(){
    // login
    $(document).on("keypress", function(event){
        if(event.keyCode==13 && $("#nav-login-tab").hasClass("active")){  
            $("#login-btn").click();  
         } 
    });

    $("#login-btn").click(function(){
        var emailField = $("#login-email").val();
        // if(emailField=="" || (emailField!="" && !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(emailField))){
        if(emailField=="") {
            $("#login-email").popover('show');
            return false;
        }
        else{
            $("#login-email").popover('hide');
        }
        var pwField = $("#login-pw").val();
        if(pwField==""){
            $("#login-pw").popover('show');
        }
        else{
            $("#login-pw").popover('hide');
            // var xmlhttp = new XMLHttpRequest();
            // xmlhttp.onreadystatechange = function(){
            //     if (xmlhttp.readyState==4 && xmlhttp.status==200){
            //         // countdown
            //     }
            // }
            // xmlhttp.open("POST", "#", true);
            // xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            // var fakeForm = $("#login-email").attr("name")+"="+$("#login-email").val()+"&"+$("#login-pw").attr("name")+"="+$("#login-pw").val();
            // xmlhttp.send(fakeForm);2440734460@qq.com
            
	        $.ajax({
	            url:"/account/login/",
	            type:"POST",
	            data:{"id":$("#login-email").val(),"password":$("#login-pw").val()},
                // headers:{ 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }，
                // beforeSend: function(xhr){
                //     var csrftoken = getCookie('csrftoken');
                //     alert(csrftoken);
                //     xhr.setRequestHeader("X-CSRFToken", csrftoken);
                // },
	            success:function (data, textStatus) {
	            	// alert("tick");
	            	if(data.isSuccess=="true"){
                    	$("#login-btn").popover('hide');
                    	location.href=data.url;
                	}
                	else{
                    	$("#login-btn").popover('show');
                	}
	            }
	        });
            // $.post(
            //     "/account/login/",{
            //     email: $("#login-email").val(),
            //     password: $("#login-pw").val(),
            //     'csrfmiddlewaretoken': '{{ csrf_token }}' 
            //     }, function(data, textStatus){
            //         if(data.isSuccess=="true"){
            //             $("#login-btn").popover('hide');
            //             location.href=data.url;
            //         }
            //         else{
            //             $("#login-btn").popover('show');
            //         }
            //     }
            // );
        }
    });
    
    // username
    var validName = false;
    $("#reg-username").blur(function(){
    	if ($("#reg-username").val().length < 4 || $("#reg-username").val().length >8){
            // alert("Your username is less than four characters.")
            $("#reg-username").attr("data-content", "用户名长度应为4-16位！");
            $("#reg-username").popover('show');
    		return;
        }
        else{
            $("#reg-username").popover('hide');
        }
        $.get(
            "/account/verify/username/",{
                username: $("#reg-username").val()
            }, function(data, textStatus){
                if(data.isSuccess=="true"){
                    validName = true;
                    $("#reg-username").popover('hide');
                }
                else{
                    validName = false;                   
                    $("#reg-username").attr("data-content", "该用户名已被占用！");
                    $("#reg-username").popover('show');
                }
            }
        );
        // $.ajax({

        // });
    });
    $("input").focus(function(){
        $(this).popover('hide');
    });
    $("#reg-captcha-btn").click(function(){
        var emailField = $("#reg-email").val();
        var universityList = ['@jlu.edu.cn', '@mails.jlu.edu.cn', '@nenu.edu.cn', '@mails.nenu.edu.cn', '@cust.edu.cn', '@mails.cust.edu.cn'];
        if(emailField=="" || (emailField!="" && !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(emailField))){
            $("#reg-email").attr("data-content", "邮箱格式错误或为空");
            $("#reg-email").popover('show');
            return ;
        }
        else{
            $("#reg-email").popover('hide');
        }
        var validEmail = false;
        for( suffix in universityList){
            // alert(universityList[suffix])
            if(emailField.endsWith(universityList[suffix])){
                validEmail = true;
                break;
            }
        }
        if(validEmail == false){
            $("#reg-email").attr("data-content", "暂不支持该邮箱，\n请使用校园邮箱！");
            $("#reg-email").popover('show');
            return ;
        }
        else{
            $("#reg-email").popover('hide');
            $.get(
                "/account/verify/email/",{
                    email: emailField
                }, function(data, textStatus){
                    //countdown
                    if (data.isvalid == "true") {
                    	// Begin to count down.
                        // alert("Begin to count down.")
                        $("#reg-email").popover('hide');
                        $("#reg-captcha-btn").attr("disabled", "disabled");
                        var countdown = 180;
                        var myTimer = setInterval(function(){
                            $("#reg-captcha-btn").html(countdown+"s");
                            countdown -= 1;
                            if(countdown == 0){
                                clearInterval(myTimer);
                                $("#reg-captcha-btn").html("发送验证码");
                                $("#reg-captcha-btn").removeAttr("disabled");
                            }
                        }, 1000);                       
                    } else {
                        // The email has been registered.
                        $("#reg-email").attr("data-content", "该邮箱已被注册！");
                        $("#reg-email").popover('show');
                    }
                }
            );
        }
    });

    $("#reg-btn").click(function(){
        var captchaField = $("#reg-captcha").val();
        if(captchaField.length != 6){
            $("#reg-captcha").popover('show');
            return false;
        }
        else{
            $("#reg-captcha").popover('hide');
        }
        var pwField = $("#reg-pw").val();
        if(pwField.length>32 || pwField.length<8){
            $("#reg-pw").popover('show');
            return false;
        }
        else{
            $("#reg-pw").popover('hide');
        }
        if(pwField!=$("#reg-pw2").val()){
            $("#reg-pw2").popover('show');
            return false;
        }
        if(!validName){
            $("#reg-username").popover('show');
            return false;
        }
        $.ajax({
        	url: "/account/register/",
        	type: "POST",
        	data: {"username":$("#reg-username").val(), "password":pwField, "code":captchaField, "email":$("#reg-email").val()},
        	success: function(data) {
        		if (data.isSuccess == "true") {
        			location.href=data.next_to;
        		} else {
                    // alert(data.error)
                    $("#reg-btn").attr("data-content", data.error);
                    $("#reg-btn").popover('show');
        		}
        	}
        });
    });

    // $("#reg-btn").click(function(){
    //     var emailField = $("#reg-email").val();
    //     if(emailField=="" || (emailField!="" && !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(emailField))){
    //         $("#reg-email").popover('show');
    //         return false;
    //     }
    //     else{
    //         $("#reg-email").popover('hide');
    //     }
    // });
});