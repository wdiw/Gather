<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.Gather.member.entity.Member"%>
<!DOCTYPE html>

<%

String stayTime="2";
String URL="./";
String content=stayTime+";URL="+URL;
response.setHeader("REFRESH",content); 

%>

<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<style>
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
body{
    background-color: rgba(214, 204, 191, 0.767);
    line-height: 50px;
}
h2{
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
</style>
<meta charset="UTF-8">
<title>登入成功</title>
</head>
<body>



<script>
Swal.fire({
  title: '登入成功',
  text: '${memberData.name}您好，您的身分為${memberData.status}',	
  icon: 'success',
  showConfirmButton: false
})
</script>
</body>
</html>