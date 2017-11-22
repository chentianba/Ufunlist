// initiate
$(function(){
    $('[data-toggle="popover"]').popover()
});

$(function(){
    $("input").focus(function(){
        $(this).popover('hide');
    });
    $("#change-send-code").click(function(){
    	var email= $("#change-email").val()
    	if(email=="" || (email!="" && !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email))){
            $("#change-email").attr("data-content", "邮箱格式错误或为空！");
            $("#change-email").popover('show');
        }
        else{
            $("#change-send-code").popover('hide');
            $.get(
                "/account/changepassword/verify/email/",{
                    email: email
                }, function(data, textStatus){
                    //countdown
                    if (data.isvalid == "true") {
                        // Begin to count down.
                        // alert("Begin to count down.")
                        $("#change-email").popover('hide');
                        $("#change-send-code").attr("disabled", "disabled");
                        var countdown = 180;
                        var myTimer = setInterval(function(){
                            $("#change-send-code").html(countdown+"s");
                            countdown -= 1;
                            if(countdown == 0){
                                clearInterval(myTimer);
                                $("#change-send-code").html("发送验证码");
                                $("#change-send-code").removeAttr("disabled");
                            }
                        }, 1000);
                    } else {
                        // The email has been registered.
                        // alert(data.error)
                        $("#change-email").attr("data-content", data.error);
                        $("#change-email").popover('show');
                    }
                }
            );
        }
    });
    $("#change-reset").click(function(){
    	var email = $("#change-email").val();
    	var code = $("#change-code").val();
    	var pw= $("#change-pw").val();
    	var pw2= $("#change-pw2").val();
    	if(email=="" || (email!="" && !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email))){
            // alert("Format of email is not correct!")
            $("#change-email").attr("data-content", "邮箱格式错误或为空！");
            $("#change-email").popover('show');
            return ;
        }
        else{
            $("#change-email").popover('hide');
        }
        if (code.length != 6) {
            // alert("Number of code is wrong.")
            $("#change-code").popover('show');
        	return ;
        }
        else{
            $("#change-code").popover('hide');
        }
        if (pw.length <8 || pw.length > 32) {
            // alert("Length of password is less than 8 or more than 32")
            $("#change-pw").popover('show');
            return ;
        }
        else{
            $("#change-pw").popover('hide');
        }
        if (pw != pw2) {
            // alert("Two passwords are not consistent.")
            $("#change-pw2").popover('show');
        	return ;
        } 
        else {
            $("#change-pw2").popover('hide');
        }
        $.post(
            "/account/changepassword/",{
                email: email, code: code, password:pw
            }, function(data, textStatus){
                if (data.isSuccess == "true") {
                	location.href = data.next_to;
                } else {
                	// show some error
                    // alert(data.error)
                    $("#change-reset").attr("data-content", data.error);
                    $("#change-reset").popover('show');
                }
            }
        );
    });
});