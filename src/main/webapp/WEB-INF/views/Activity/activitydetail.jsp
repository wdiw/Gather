<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Gather Admin</title>
<!-- plugins:css -->
<link rel="stylesheet" href="../vendors/feather/feather.css">
<link rel="stylesheet" href="../vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../images/favicon.png" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>活動詳情</h2>
			</div>
		</div>
	</section>

	<hr>
	<section class="container">
		<div class="row">

			<div class="col-md-5">
          <div align="center">
				<table  >
					<tr>
						<td>活動編號: </td>
						<td><input id="id" name="id" value="${activity.id}" disabled></td>
					</tr>
					<tr>
						<td>活動名稱:</td>
						<td><input id="name" name="name" value="${activity.name}" disabled /></td>
					</tr>
					<tr>
						<td>開始日期:</td>
						<td><input id="beginDate" name="beginDate" value="${activity.beginDate}" type="date"disabled></td>
					</tr>
					<tr>
						<td>結束日期:</td>
						<td><input id="endDate" name="endDate" value="${activity.endDate}" type="date" disabled></td>
					</tr>
					
					
					<tr>
						<td>活動內容:</td>
						<td><textarea rows="4" cols="50" id="description" name="description"
								disabled>${activity.description}</textarea></td>
					</tr>
				</table>
			</div>



				<p>

					<a id="editButton" name="editButton" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>修改
					</a>

					<a id="deleteButton" name="deleteButton" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>刪除
					</a>

					<a id="updateButton" name="updateButton" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>存檔
					</a>



					<a href="<spring:url value='/Activity/selectall' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a>
				</p>
			</div>
		</div>
	</section>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {

			$("#updateButton").hide();//一開始存檔按鈕隱藏

			var id= '${activity.id}';//透過model中的project.pID取得ID
			var name = "";
			var description = "";
			var beginDate="";
			var endDate = "";

		
			
			

			//點刪除按鈕時，透過id刪除資料
			$("#deleteButton").click(function () {

				$.ajax({
					url: "<spring:url value='/Activity/theActivity/" + id + "'/>",
					type: "DELETE",
					// data: { pID: pID },//前面是標籤，後面是值
					data: {},//前面是標籤，後面是值
					success: function (data) {
						alert("活動編號:"+id+"刪除成功，跳轉回活動清單");
						location.href="<spring:url value='/Activity/selectall'/>"

					},
					error: function (jqXHR, textStatus, errorThrown) {
						alert("刪除失敗");
					}
				})

			});

			//修改按鈕，變成可編輯
			$("#editButton").click(function () {
				$("#name").prop("disabled", false);
				$("#description").prop("disabled", false);
				$("#beginDate").prop("disabled", false);
				$("#endDate").prop("disabled", false);
				$("#updateButton").show();//存檔按鈕顯示
				$("#editButton").hide();//編輯按鈕隱藏

			})


			//案存檔按鈕
			$("#updateButton").click(function () {
				name = $("#name").val();
				description = $("#description").val();
				beginDate = $("#beginDate").val();
				endDate = $("#endDate").val();
				
				$.ajax({
					url: "<spring:url value='/Activity/theActivity/" + id + "'/>",
					type: "PUT",
					data: { name: name, description: description,beginDate: beginDate,endDate: endDate },//前面是標籤，後面是值
					success: function (data) {
						alert("修改成功，跳轉回活動清單");
						$("#name").prop("disabled", true);
						$("#description").prop("disabled", true);
						$("#beginDate").prop("disabled", true);
						$("#endDate").prop("disabled", true);
						$("#updateButton").hide();//存檔按鈕隱藏
						$("#editButton").show();//編輯按鈕顯示
						location.href="<spring:url value='/Activity/selectall'/>"

					},
					error: function (jqXHR, textStatus, errorThrown) {
						alert("存檔失敗");
					}
				})

			})


		})

	</script>
</body>


</html>