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
           <div class="card-body">
                  <h4 class="card-title">活動內容編輯</h4>
                  
                  <form  id="form" class="forms-sample">
                    <div class="form-group">
                      <label for='id'>活動編號</label>
                      <input name="id" id="id" disabled="disabled" class="form-control" value="${activity.id}" readonly="readonly">
                    </div>
                    <div class="form-group">
                      <label for="name">活動名稱</label>
                      <input id="name" name="name" disabled="disabled" class="form-control" value="${activity.name}" type='text'>
                    </div>
                    <div class="form-group">
                      <label for="beginDate">活動開始日期</label>
                      <input id="beginDate" name="beginDate" disabled="disabled" class="form-control" value="${activity.beginDate}" type='date'>
                    </div>
                    <div class="form-group">
                      <label for="endDate">活動結束日期</label>
                      <input id="endDate" name="endDate" disabled="disabled" class="form-control" value="${activity.endDate}"  type='date'>
                    </div>
                    <div class="form-group">
                      <label for="description">活動內容</label>
                      <textarea name="description" id="description" disabled="disabled" cols="100" rows="10" placeholder="請輸入活動詳情">${activity.description}</textarea>
                    </div>
                    <div class="form-group">
                      <label>上傳圖片</label>
                      <input type="file" name="projectImage" class="file-upload-default" id="projectImage">
                      <div class="input-group col-xs-12">
                        <input type="text" class="form-control file-upload-info" disabled placeholder="上傳圖片" >
                        <span class="input-group-append">
                          <button class="file-upload-browse btn btn-primary" type="button">上傳</button>
                        </span>
                      </div>
                    </div>
                    <div class="form-group">
					
						<img style="position: relative; left: 250px" src="<c:url value='/getPicture/${activity.id}'/>" width="350"
							height="300" alt="請選擇照片" id="showPic" class="img-rounded">
					</div>
                    
                  </form>
                </div>


				<p>

					<a id="editButton" name="editButton" class="btn btn-primary mr-2">
						修改
					</a>

					<a id="deleteButton" name="deleteButton" class="btn btn-primary mr-2">
						刪除
					</a>

					<a id="updateButton" name="updateButton" class="btn btn-primary mr-2">
						存檔
					</a>
					
					
                    	


					<a href="<spring:url value='/Activity/sapage' />" class="btn btn-primary mr-2">
						返回
					</a>
					<button id='inputalldata'class="btn btn-light">一鑑輸入</button>
				</p>
			</div>
		</div>
	</section>
	  <script src="../js/off-canvas.js"></script>
  <script src="../js/hoverable-collapse.js"></script>
  <script src="../js/template.js"></script>
  <script src="../js/settings.js"></script>
  <script src="../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="../js/file-upload.js"></script>
  <script src="../js/typeahead.js"></script>
  <script src="../js/select2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	
	
	$('#inputalldata').click(function(event) {
		
	    $('#name').val("群眾募資分享交流小聚");
	    $('#beginDate').val("2021/11/19");
	    $('#endDate').val("2021-11-19");
	    $('#description').val("2014年，群眾募資平台因為學運一炮而紅，也讓眾多的人可以透過少少的資金，開始去追尋創業、打造自己的夢想 當你有一個Ideal不知道要從哪找資金、人脈、資源時，群眾募資已成為時下完成夢想最簡單的方式之一 但你知道會遇到哪些問題嗎？如果不知道，那你應該要來參加活動!");
	    
	  
	});
	
	var pic;
	$('#projectImage').change(function() {
		var projectImage = $("#projectImage")[0].files[0];
		var reader = new FileReader;	
		reader.onload = function(e) {
			$('#showPic').attr('src', e.target.result);
			pic=e.target.result;
//				console.log(e.target.result);
		}
		reader.readAsDataURL(projectImage);
		console.log(projectImage);
	})
	
	
	
	
	
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
						location.href="<spring:url value='/Activity/sapage'/>"

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
				var form=document.getElementById("form");
				var formdata=new FormData(form);
				$.ajax({
					url: "<spring:url value='/Activity/theActivity/" + id + "'/>",
					type: "PUT",
					data: formdata,//前面是標籤，後面是值
					 contentType: false, //required
                     processData: false, // required
                     /*一定要加*/
                     mimeType: 'multipart/form-data', //有圖片就要加這行
					success: function (data) {
						alert("修改成功，跳轉回活動清單");
						$("#name").prop("disabled", true);
						$("#description").prop("disabled", true);
						$("#beginDate").prop("disabled", true);
						$("#endDate").prop("disabled", true);
						$("#updateButton").hide();//存檔按鈕隱藏
						$("#editButton").show();//編輯按鈕顯示
						location.href="<spring:url value='/Activity/sapage'/>"

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