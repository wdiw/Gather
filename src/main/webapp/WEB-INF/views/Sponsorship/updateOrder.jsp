<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
fieldset {
	border: 1px solid rgb(110, 104, 96);
	width: 800px;
	margin: auto;
	background-color: ivory;
	text-align: center;
}

* {
	text-align: center;
}

body {
	line-height: 50px;
}

h2 {
	color: rgb(110, 104, 96);
}

label, img {
	font-size: 20px;
	text-align: center;
	color: rgb(110, 104, 96);
}
</style>
<title>Update Orders</title>
</head>
<body>
	<section>
		<div class="container">
			<h2 style="text-align: center">
				更改訂單資料<a href="<c:url value='/' />"><button
						style="position: relative; left: 465px; width: 80px; height: 25px; font-size: 15px">回首頁</button>
				</a>
			</h2>
		</div>
	</section>
	<hr>
	<section class="container">
		<form method='POST' modelAttribute="sBean"
			class='form-horizontal' enctype="multipart/form-data">

			<fieldset>
				<div class="form-group">
					<label class="control-label col-sm-2" for='sID'> 訂單編號 </label>
					<div class="col-sm-10">
						<input name="id" value="${sBean.sID}" readonly="readonly">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for='sName'> 贊助者 </label>
					<div class="col-sm-10">
						<form:input id="sName" path="sName" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-sm-2' for="sPID"> 專案編號 </label>
					<div class='col-sm-10'>
						<form:input id="sPID" path="sPID" type='text'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-sm-2' for="sPName"> 專案名稱 </label>
					<div class='col-lg-10'>
						<form:input id="sPName" path="sPName" type='text'
							class='form:input-large' />
					</div>
				</div>



				<div class="form-group">
					<label class='control-label col-sm-2' for="sAmount"> 贊助金額 </label>
					<div class='col-sm-10'>
						<form:input id="sAmount" path="sAmount" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="projectImage">
						上傳圖片 </label>
					<div class="col-sm-10">
						<form:input id="projectImage" path="projectImage" type='file'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<div class="control-label col-sm-2">
						<img style="position: relative; left: 250px;src="<c:url value='/getPicture/${sBean.sID}'/>" width="350"
							height="300" alt="請選擇照片" id="showPic" class="img-rounded">
					</div>
					</div>

					<div class="form-group">
						<div class='control-label col-sm-2'>
							<a href="<spring:url value='/order/update' />">
								<button class='btn btn-primary'
									value="送出" style="position: relative;left: 300px" >更新</button>
							</a>
						</div>
					</div>
			</fieldset>
		</form>
	</section>

	<script type="text/javascript">
		$('#projectImage').change(function() {
			var projectImage = $("#projectImage")[0].files[0];
			var reader = new FileReader;
			reader.onload = function(e) {
				$('#showPic').attr('src', e.target.result);
			}
			reader.readAsDataURL(projectImage);
		})
	</script>
</body>
</html>