<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<!-- note: 最新 -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
</head>

<body>
	<img src="/images/1.jpg">
    <div class="container"> 
        <span id="accountsp"></span>
        <div class="account">帳號:<input type="text" name="account" id="account"><br></div>
        <div class="password">密碼:<input type="password" name="password" id="password"><span id="passwordsp"></span><br></div>
        <div class="btn"><button  id="login" value="" class="button">登入</button>
        <!-- 
        <button type="button" id="register" value=""class="button">註冊(尚未開放)</button></div>
         -->
        </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
        $(function () {
        	var wait = function(){ 
        	    if(condition){ 
        	     // run when condition is met 
        	    } 
        	    else { 
        	     setTimeout(check, 1000); // check again in a second 
        	    } 
        	} 

            $(document).ready(function () {
                $("#login").click(function () {
                    var useraccount = $("#account").val();
                    var userpassword = $("#password").val();
                    console.log(useraccount+userpassword)
                    if ($.trim(useraccount) == '') {
                        alert('不得為空');
                        (this).focus;
                        return;
                    }
                    var params = {"account":''+ useraccount,
            	 		   "password":''+ userpassword};
                    console.log('debug1:params'+params[0]);
                    
                    $.ajax({
                        type: 'post',
                        url: 'http://localhost:8080/Gather/api/login/',
                        contentType: 'application/json',
                        data: JSON.stringify(params),
                        success: function (data) {
                            console.log("Success:" + data);
                            if (data == 'Y') {
                                //$("#accountsp").html('登入成功');
                            	/*
                            	Swal.fire({
								  title: '登入成功',
								  text: '${memberData.name}您好，您的身分為${memberData.status}',	
								  icon: 'success',
								  showConfirmButton: false
								})
								*/
                            	$(location).attr('href', '//localhost:8080/Gather/showLoginSuccess');
								
								
                            }

                            if (data == 'N') {
                                $("#accountsp").html('帳號或密碼輸入錯誤，請重新輸入');
                            }
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    });
                });
            })
        })
    </script>
</body>

</html>