<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>執行結果</title>
</head>
<body>
	<div align='center'>
		<h1>執行成功</h1>
    </div>
    <div align='center'>
    	<a href="<c:url value='/Forum/adMain' />"><button>回論壇首頁</button></a>
    </div><br>
    <div align='center'>
    	<a href="<c:url value='/' />"><button>回首頁</button></a>
    </div>
</body>
</html>
