<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
             
                  
                  <form  id="form" class="forms-sample">
                   <div class="form-group">
                      <label for='id'>會員編號</label>
                      <input name="memberid" id="memberid" disabled="disabled" class="form-control" value="${memberData.id}" readonly="readonly">
                    </div>
                    <div class="form-group">
                      <label for='id'>活動編號</label>
                      <input name="activityid" id="activityid" disabled="disabled" class="form-control" value="${activity.id}" readonly="readonly">
                    </div>
                    <div class="form-group">
                      <label for="name">活動名稱</label>
                      <input id="name" name="name" disabled="disabled" class="form-control" value="${activity.name}" type='text'>
                    </div>
                    
                    <div class="form-group">
                      <label for="name">參加人數</label>
                      <input id="activityParticipationCount" name="activityParticipationCount" disabled="disabled" class="form-control" value="${activityParticipationCount}" type='text'>
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
                      <textarea name="description" id="description" disabled="disabled" cols="100" rows="10" >${activity.description}</textarea>
                    </div>
                    <div class="form-group">
                    <img style="position: relative; left: 250px" src="<c:url value='/ActivitygetPicture/${activity.id}'/>" width="350"
							height="300" alt="請選擇照片" id="showPic" class="img-rounded">
                    </div>
                    
                    <a id="activitylogin"  class="btn btn-primary mr-2">
						活動登錄
					</a>

					<a href="<spring:url value='/Activity/userpage' />" class="btn btn-primary mr-2">
						返回
					</a>
                  </form>
                </div>


		
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
	
	
	

	
	
	
	
	$("#activitylogin").click(function () {
		
		$("#activitylogin").hide();//存檔按鈕隱藏
	
		var id= '${activity.id}';
		var memberid='${memberData.id}';
		var memberlogin='${activitylogin}';
    var m_id="${activitylogin.m_id}";
    var logintime="${activitylogin.logintime}";
    var activityloginbean='${activitylogin.activityBean}'
    var activitybean='${activity}'
    

    
		
		if(activityloginbean!=activitybean){
		
			$.ajax({
			url: "<spring:url value='/Activity/login/" + id + "'/>",
			type: "Put",
			
			data: {id:id,memberid:memberid},//前面是標籤，後面是值
			success: function (data) {
				 Swal.fire({
                     title: '活動登錄成功！',
                     icon: 'success',
                     imageUrl: "<c:url value='/ActivitygetPicture/${activity.id}'/>",
                     imageWidth: 400,
                     imageHeight: 200,
                 })
                 
                 location.href= "<spring:url value='/Activity/userpage'/>";

			},
			error: function (jqXHR, textStatus, errorThrown) {
				alert("活動登錄失敗");
			}
		})
		
		
	}else{

    Swal.fire({
                     title: '你已登錄過此活動！無法再登錄!',
                     icon: 'success',
                     imageUrl: "<c:url value='/ActivitygetPicture/${activity.id}'/>",
                     imageWidth: 400,
                     imageHeight: 200,
                 })
                 
                 location.href= "<spring:url value='/Activity/userpage'/>";


  }
		
		
		
		
		
	

	});
	
	
	
	
	
	
	
	
	
	
	
	
	

	</script>
</body>


</html>