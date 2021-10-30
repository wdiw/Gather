
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊會員頁面</title>
<link rel="stylesheet" type="text/css" href="/Gather/style.css">
<style>
table {
	border-spacing: 2%;
	padding: 1%;
	border: 1%;
	width: 100%;
}

.btn-outline-light {
	color: #5B4B00;
	background-color: #cebfa0;
	border-color: #5B4B00;
}

.btn-outline-light:hover, .btn-outline-light:focus, .btn-outline-light:active:hover
	{
	color: #4b4b2a;
	background-color: #caca92;
	border-color: #c9c969;
}

body {
	background-color: rgba(214, 204, 191, 0.767);
	line-height: 50px;
}

h2 {
	background-color: whitesmoke;
	color: rgb(110, 104, 96);
}

tr {
	text-align: center;
}

td {
	background-color: whitesmoke;
	;
}

img {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<br>註冊表單:<br>
		姓名:<input type="text" id="text_name"><br>
		帳號:<input type="text" id="text_account"><br>
		密碼:<input type="password" id="text_password"><br>
		<br><input type="button" value="新增" id="add"><br><br>
		<a href="./"><input type="button" value="回到首頁"/></a>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
				$(function () {
					//新增
					$("#add").click(function () {
						let user_name = $('#text_name').val();
						let user_account = $("#text_account").val();
						let user_password = $("#text_password").val();

						console.log(
							user_name +
							user_account +
							user_password
							//ok
						)

						if ($.trim(user_name) == '' |
							$.trim(user_account) == '' |
							$.trim(user_password) == '') {
							alert('Can not be Empty');
							(this).focus;
							return;
						}


						var params = {
							"name":'' + user_name,
							"account": '' + user_account,
							"password": '' + user_password
						};

						$.ajax({
							type: 'post',
							url: 'http://localhost:8080/Gather/api/register',
							contentType: 'application/json',
							data: JSON.stringify(params),
							success: function (data) {
								alert('成功新增')
							},
							error: function (e) {
								console.log(e);
							}
						});
					});
					
				})
			</script>




		<%--
<tr>
    <td>生日:</td>
    <td>
    民國
    <input type="text" name="birthyear" size="2" maxlength="3">年
    <input type="text" name="birthmonth" size="2" maxlength="2">月
    <input type="text" name="birthday" size="2" maxlength="2">日    
    </td>
</tr>

<tr>
    <td>身份證字號:</td>
    <td><input type="text" name="id" maxlength="10"></td>
</tr
>
<tr>
    <td width="150">聯絡地址:</td>
    <td>郵遞區號 <input type="text" name="zipcode" size="3" maxlength="3"><input type="text" name="address" size="50" maxlength="50"></td>
</tr>
<tr>
    <td>聯絡電話:</td>
    <td><input type="text" name="phone" size="20"></td>
</tr>
<tr>
    <td>E-mail:</td>
    <td><input type="text" name="mailaddress" size="20" maxlength="20"></td>
</tr>
 --%>
			
			

</body>
</html>