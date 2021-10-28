<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Orders</title>
</head>
<style>
* {
	text-align: center;
}

body {
	line-height: 50px;
}

h2 {
	color: rgb(110, 104, 96);
}

th {
	font-size: 20px;
	text-align: center
}

tr {
	color: rgb(110, 104, 96);
}
</style>
<body>
	<div></div>
	<h2>
		所有訂單 <a href="<c:url value='/orders' />" ><button
				style="position: relative; left: 465px; width: 80px; height: 25px; font-size: 15px">新增訂單</button>
		</a>
	</h2>
	<div class="container mt-3">
		<table class="table table-hover">
			<tr style="background-color: rgb(179, 175, 162)">
				<th>訂單編號</th>
				<th>贊助人</th>
				<th>專案圖片</th>
				<th>專案編號</th>
				<th>專案名稱</th>
				<th>贊助金額</th>
				<th>選項</th>
			</tr>
			<c:forEach items='${orders}' var='order'>
				<tr>
					<td>${order.sID}</td>
					<td>${order.sName}</td>
					<td><img width='50' height='50'
						src="<c:url value='/getPicture/${order.sID}'/>"
						class="img-rounded" /></td>
					<td>${order.sPID}</td>
					<td>${order.sPName}</td>
					<td>${order.sAmount}</td>
					<td><a
						href="<spring:url value='/order/update?id=${order.sID}' />">
							<button>修改</button>
					</a> <a href="<spring:url value='/order/delete?id=${order.sID}' />">
							<button>刪除</button>
					</a></td>
				</tr>
			</c:forEach>
		</table>

	</div>


</body>
</html>