<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
				<!DOCTYPE html>
				<html lang="en">
				<!-- <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script> -->
				<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

				<head>
					<!-- Required meta tags -->
					<meta charset="utf-8">
					<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
					<title>Gather Admin</title>
					<!-- plugins:css -->
					<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
					<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

					<link rel="stylesheet" href="../vendors/feather/feather.css">
					<link rel="stylesheet" href="../vendors/ti-icons/css/themify-icons.css">
					<link rel="stylesheet" href="../vendors/css/vendor.bundle.base.css">
					<!-- endinject -->
					<!-- Plugin css for this page -->
					<link rel="stylesheet" href="../vendors/select2/select2.min.css">
					<link rel="stylesheet" href="../vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
					<!-- End plugin css for this page -->
					<!-- inject:css -->
					<link rel="stylesheet" href="../css/vertical-layout-light/style.css">
					<!-- endinject -->
					<link rel="shortcut icon" href="../images/favicon.png" />

					<!-- include summernote css/js -->
					<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
						rel="stylesheet">
					<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js" defer></script>



					<style>
						/* 改變text樣式 */
						.swal2-popup {
							width: 40em;
							font-size: 1.6rem !important;
							font-family: Georgia, serif;
						}

						.swal2-textarea {
							height: 10em;
							width: 30em;
							padding: .75em;
						}
						/* summerNore */
						.note-editing-area .note-editable {
							height: 400px;
							width: 100%;
						}

						.sidebar .nav .nav-item .nav-link .menu-title {
							color: inherit;
							display: inline-block;
							font-size: 18px;
							line-height: 1;
							vertical-align: middle;
						}

						#passButton,#NotPassButton,#deleteButton{
							color: white;
							font-size: 16px;
						}

						label, .form-control{
							font-size: 18px !important;
						}

					</style>
				</head>

				<body>
					<div class="container-scroller">
						<!-- partial:../../partials/_navbar.html -->
						<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
							<div
								class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
								<a class="navbar-brand brand-logo mr-5" href="/Gather"><img  width="50px" height="500px"  src="/Gather/images/G.png" class="mr-2" alt="logo" /></a>
								<a class="navbar-brand brand-logo-mini" href="/Gather"><img
										src="../images/logo-mini.svg" alt="logo" /></a>
							</div>
							<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
								<button class="navbar-toggler navbar-toggler align-self-center" type="button"
									data-toggle="minimize">
									<span class="icon-menu"></span>
								</button>
								<ul class="navbar-nav mr-lg-2">
									<li class="nav-item nav-search d-none d-lg-block">
										<div class="input-group">
											<div class="input-group-prepend hover-cursor" id="navbar-search-icon">
												<span class="input-group-text" id="search">
													<i class="icon-search"></i>
												</span>
											</div>
											<input type="text" class="form-control" id="navbar-search-input"
												placeholder="Search now" aria-label="search" aria-describedby="search">
										</div>
									</li>
								</ul>
								<ul class="navbar-nav navbar-nav-right">
									<li class="nav-item dropdown">
										<a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown"
											href="#" data-toggle="dropdown">
											<i class="icon-bell mx-0"></i>
											<span class="count"></span>
										</a>
										<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
											aria-labelledby="notificationDropdown">
											<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications
											</p>
											<a class="dropdown-item preview-item">
												<div class="preview-thumbnail">
													<div class="preview-icon bg-success">
														<i class="ti-info-alt mx-0"></i>
													</div>
												</div>
												<div class="preview-item-content">
													<h6 class="preview-subject font-weight-normal">Application Error
													</h6>
													<p class="font-weight-light small-text mb-0 text-muted">
														Just now
													</p>
												</div>
											</a>
											<a class="dropdown-item preview-item">
												<div class="preview-thumbnail">
													<div class="preview-icon bg-warning">
														<i class="ti-settings mx-0"></i>
													</div>
												</div>
												<div class="preview-item-content">
													<h6 class="preview-subject font-weight-normal">Settings</h6>
													<p class="font-weight-light small-text mb-0 text-muted">
														Private message
													</p>
												</div>
											</a>
											<a class="dropdown-item preview-item">
												<div class="preview-thumbnail">
													<div class="preview-icon bg-info">
														<i class="ti-user mx-0"></i>
													</div>
												</div>
												<div class="preview-item-content">
													<h6 class="preview-subject font-weight-normal">New user registration
													</h6>
													<p class="font-weight-light small-text mb-0 text-muted">
														2 days ago
													</p>
												</div>
											</a>
										</div>
									</li>
									<li class="nav-item nav-profile dropdown">
										<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
											id="profileDropdown">
											<img src="/Gather/images/Members/${memberData.id}.jpg" alt="profile" />
										</a>
										<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
											aria-labelledby="profileDropdown">
											<a class="dropdown-item">
												<i class="ti-settings text-primary"></i>
												Settings
											</a>
											<a class="dropdown-item">
												<i class="ti-power-off text-primary"></i>
												Logout
											</a>
										</div>
									</li>
									<li class="nav-item nav-settings d-none d-lg-flex">
										<a class="nav-link" href="#">
											<i class="icon-ellipsis"></i>
										</a>
									</li>
								</ul>
								<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
									type="button" data-toggle="offcanvas">
									<span class="icon-menu"></span>
								</button>
							</div>
						</nav>
						<!-- partial -->
						<div class="container-fluid page-body-wrapper">
							<!-- partial:../../partials/_settings-panel.html -->
							<!-- <div class="theme-setting-wrapper">
								<div id="settings-trigger"><i class="ti-settings"></i></div>
								<div id="theme-settings" class="settings-panel">
									<i class="settings-close ti-close"></i>
									<p class="settings-heading">SIDEBAR SKINS</p>
									<div class="sidebar-bg-options selected" id="sidebar-light-theme">
										<div class="img-ss rounded-circle bg-light border mr-3"></div>Light
									</div>
									<div class="sidebar-bg-options" id="sidebar-dark-theme">
										<div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark
									</div>
									<p class="settings-heading mt-2">HEADER SKINS</p>
									<div class="color-tiles mx-0 px-4">
										<div class="tiles success"></div>
										<div class="tiles warning"></div>
										<div class="tiles danger"></div>
										<div class="tiles info"></div>
										<div class="tiles dark"></div>
										<div class="tiles default"></div>
									</div>
								</div>
							</div> -->
							<div id="right-sidebar" class="settings-panel">
								<i class="settings-close ti-close"></i>
								<ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
									<li class="nav-item">
										<a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section"
											role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section"
											role="tab" aria-controls="chats-section">CHATS</a>
									</li>
								</ul>
								<div class="tab-content" id="setting-content">
									<div class="tab-pane fade show active scroll-wrapper" id="todo-section"
										role="tabpanel" aria-labelledby="todo-section">
										<div class="add-items d-flex px-3 mb-0">
											<form class="form w-100">
												<div class="form-group d-flex">
													<input type="text" class="form-control todo-list-input"
														placeholder="Add To-do">
													<button type="submit" class="add btn btn-primary todo-list-add-btn"
														id="add-task">Add</button>
												</div>
											</form>
										</div>
										<div class="list-wrapper px-3">
											<ul class="d-flex flex-column-reverse todo-list">
												<li>
													<div class="form-check">
														<label class="form-check-label">
															<input class="checkbox" type="checkbox">
															Team review meeting at 3.00 PM
														</label>
													</div>
													<i class="remove ti-close"></i>
												</li>
												<li>
													<div class="form-check">
														<label class="form-check-label">
															<input class="checkbox" type="checkbox">
															Prepare for presentation
														</label>
													</div>
													<i class="remove ti-close"></i>
												</li>
												<li>
													<div class="form-check">
														<label class="form-check-label">
															<input class="checkbox" type="checkbox">
															Resolve all the low priority tickets due today
														</label>
													</div>
													<i class="remove ti-close"></i>
												</li>
												<li class="completed">
													<div class="form-check">
														<label class="form-check-label">
															<input class="checkbox" type="checkbox" checked>
															Schedule meeting for next week
														</label>
													</div>
													<i class="remove ti-close"></i>
												</li>
												<li class="completed">
													<div class="form-check">
														<label class="form-check-label">
															<input class="checkbox" type="checkbox" checked>
															Project review
														</label>
													</div>
													<i class="remove ti-close"></i>
												</li>
											</ul>
										</div>
										<h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
										<div class="events pt-4 px-3">
											<div class="wrapper d-flex mb-2">
												<i class="ti-control-record text-primary mr-2"></i>
												<span>Feb 11 2018</span>
											</div>
											<p class="mb-0 font-weight-thin text-gray">Creating component page build a
												js</p>
											<p class="text-gray mb-0">The total number of sessions</p>
										</div>
										<div class="events pt-4 px-3">
											<div class="wrapper d-flex mb-2">
												<i class="ti-control-record text-primary mr-2"></i>
												<span>Feb 7 2018</span>
											</div>
											<p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
											<p class="text-gray mb-0 ">Call Sarah Graves</p>
										</div>
									</div>
									<!-- To do section tab ends -->
									<div class="tab-pane fade" id="chats-section" role="tabpanel"
										aria-labelledby="chats-section">
										<div class="d-flex align-items-center justify-content-between border-bottom">
											<p
												class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">
												Friends</p>
											<small
												class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See
												All</small>
										</div>
										<ul class="chat-list">
											<li class="list active">
												<div class="profile"><img src="../images/faces/face1.jpg"
														alt="image"><span class="online"></span></div>
												<div class="info">
													<p>Thomas Douglas</p>
													<p>Available</p>
												</div>
												<small class="text-muted my-auto">19 min</small>
											</li>
											<li class="list">
												<div class="profile"><img src="../images/faces/face2.jpg"
														alt="image"><span class="offline"></span></div>
												<div class="info">
													<div class="wrapper d-flex">
														<p>Catherine</p>
													</div>
													<p>Away</p>
												</div>
												<div class="badge badge-success badge-pill my-auto mx-2">4</div>
												<small class="text-muted my-auto">23 min</small>
											</li>
											<li class="list">
												<div class="profile"><img src="images/faces/face3.jpg" alt="image"><span
														class="online"></span></div>
												<div class="info">
													<p>Daniel Russell</p>
													<p>Available</p>
												</div>
												<small class="text-muted my-auto">14 min</small>
											</li>
											<li class="list">
												<div class="profile"><img src="images/faces/face4.jpg" alt="image"><span
														class="offline"></span></div>
												<div class="info">
													<p>James Richardson</p>
													<p>Away</p>
												</div>
												<small class="text-muted my-auto">2 min</small>
											</li>
											<li class="list">
												<div class="profile"><img src="images/faces/face5.jpg" alt="image"><span
														class="online"></span></div>
												<div class="info">
													<p>Madeline Kennedy</p>
													<p>Available</p>
												</div>
												<small class="text-muted my-auto">5 min</small>
											</li>
											<li class="list">
												<div class="profile"><img src="images/faces/face6.jpg" alt="image"><span
														class="online"></span></div>
												<div class="info">
													<p>Sarah Graves</p>
													<p>Available</p>
												</div>
												<small class="text-muted my-auto">47 min</small>
											</li>
										</ul>
									</div>
									<!-- chat tab ends -->
								</div>
							</div>
							<!-- partial -->
							<!-- partial:../../partials/_sidebar.html -->
							<nav class="sidebar sidebar-offcanvas" id="sidebar">
								<ul class="nav">
									<li class="nav-item">
										<a class="nav-link" href="/Gather/backend">
											<i class="icon-grid menu-icon"></i>
											<span class="menu-title">Dashboard</span>
										</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="collapse" href="#ui-basic"
											aria-expanded="false" aria-controls="ui-basic">
											<i class="icon-layout menu-icon"></i>
											<span class="menu-title">Member</span>
											<i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="ui-basic">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"> <a class="nav-link"
														href="/Gather/showAllMember">會員管理</a></li>
												<li class="nav-item"><a class="nav-link" href="/Gather/addMember">新增會員</a>
												</li>
											</ul>
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="collapse" href="#form-elements"
											aria-expanded="false" aria-controls="form-elements">
											<i class="icon-columns menu-icon"></i>
											<span class="menu-title">Activity</span>
											<i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="form-elements">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"><a class="nav-link"
														href="/Gather/Activity/selectall">全部活動</a></li>
											</ul>
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false"
											aria-controls="charts">
											<i class="icon-bar-graph menu-icon"></i>
											<span class="menu-title">Sponsorship</span>
											<i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="charts">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"> <a class="nav-link" href="/Gather/orders">訂單管理</a></li>
												<li class="nav-item"> <a class="nav-link" href="/Gather/addorder">新增訂單</a>
												</li>
											</ul>
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false"
											aria-controls="tables">
											<i class="icon-grid-2 menu-icon"></i>
											<span class="menu-title">Projects</span>
											<i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="tables">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"> <a class="nav-link"
														href="/Gather/Project/allProjectInBackstage">專案管理</a></li>
											</ul>
										</div>
									</li>
									<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#icons"
										aria-expanded="false" aria-controls="icons"> <i
											class="icon-contract menu-icon"></i>
										<span class="menu-title">Forum</span> <i class="menu-arrow"></i>
									</a>
									<div class="collapse" id="icons">
										<ul class="nav flex-column sub-menu">
											<li class="nav-item"><a class="nav-link"
													href="/Gather/Forum/adMain">討論區管理</a></li>
										</ul>
									</div>
								</li>
								</ul>
							</nav>
							<!-- partial -->
							<div class="main-panel">
								<div class="content-wrapper">



									<div class="col-12 grid-margin stretch-card">
										<div class="card">
											<div class="card-body">
												
												<p class="card-description">

												</p>
												<form id="form" class="forms-sample">
													<div class="form-group">
														<label for='pID'>計畫編號</label>
														<input name="pID" id="pID" class="form-control"
															value="${project.pID}" readonly>
													</div>


													<div class="form-group">
														<label for="pName">計畫名稱</label>
														<input id="pName" name="pName" class="form-control"
															value="${project.pName}" type='text'>
													</div>
													<div class="form-group">
														<label for="pTarget">計畫目標金額</label>
														<input id="pTarget" name="pTarget" class="form-control"
															value="${project.pTarget}" type='text'>
													</div>



													<div class="form-group">
														<label for="pSDate">計畫開始日期</label>
														<input id="pSDate" name="pSDate" class="form-control"
															value="${project.pSDate}" type='Date'>
													</div>

													<div class="form-group">
														<label for="pEDate">計畫結束日期</label>
														<input id="pEDate" name="pEDate" class="form-control"
															value="${project.pEDate}" type='Date'>
													</div>


													<div class="form-group">
														<label>更換封面</label>
														<input type="file" name="changeImageCover"
															class="file-upload-default" id="changeImageCover">

														<div class="input-group col-xs-12">
															<input type="text" class="form-control file-upload-info"
																disabled placeholder="上傳圖片">

															<span class="input-group-append">
																<button class="file-upload-browse btn btn-primary"
																	type="button" id="coverImageUpload">上傳</button>
															</span>
														</div>
													</div>


													<div class="form-group">

														<img style="position: relative; left: 250px"
															src="../${project.pImageCover}" width="350" height="300"
															alt="請選擇照片" id="pImageCover" name="pImageCover"
															class="img-rounded">
													</div>

													<div class="form-group">
														<label for="pDescribe">計畫描述</label>
														<textarea rows="4" cols="50" id="pDescribe" name="pDescribe"
															class="form-control">${project.pDescribe}</textarea>
													</div>

													<div class="form-group">
														<label for="pContent">計畫完整內容</label>
														<textarea rows="4" cols="50" id="pContent" name="pContent"
															class="form-control">${project.pContent}</textarea>
													</div>

												
													<c:forEach   items='${projectPlanList}' var='projectPlan' varStatus="status">
														
														<!--回饋方案一-->
														<div class="form-group">
															<label for="projectPlanPrice${status.count}">回饋方案${status.count}金額</label>
															<input id="projectPlanPrice${status.count}"   name="projectPlanPrice${status.count}"
																class="form-control" type='number' value="${projectPlan.projectPlanPrice}"
																min="100" step="100">

														</div>
														<div class="form-group">
															<label for="ETA${status.count}">回饋方案${status.count}預計實現時間</label>
															<input id="ETA${status.count}" name="ETA${status.count}" 
															value="${projectPlan.ETA}" class="form-control" type='month'>
														</div>
	
														<div class="form-group">
															<label for="projectPlanContent${status.count}">回饋方案${status.count}內容</label>
															<textarea rows="4" cols="50" id="projectPlanContent${status.count}"
																name="projectPlanContent${status.count}" class="form-control">${projectPlan.projectPlanContent}</textarea>
														</div>
	
	
														<div class="form-group">
															<label>回饋方案${status.count}圖片</label>
															<input type="file" name="projectPlanImage${status.count}"
																class="file-upload-default" id="projectPlanImage${status.count}">
															<div class="input-group col-xs-12">
																<input type="text" class="form-control file-upload-info"
																	disabled placeholder="上傳圖片">
	
																<span class="input-group-append">
																	<button class="file-upload-browse btn btn-primary"
																		type="button" disabled>上傳</button>
																</span>
															</div>
														</div>
														
														
														<div class="form-group">
	
															<img style="position: relative; left: 250px" src="../${projectPlan.projectPlanImage}" width="350"
																
																height="300" alt="請選擇圖片" id="projectPlanImageCover${status.count}"
																name="projectPlanImageCover${status.count}" class="img-rounded">
														</div>

														
													</c:forEach> 

													


													<div class="form-group">
														<label for="pStatus">狀態</label>
														<input id="pStatus" name="pStatus" class="form-control"
															value="${project.pStatus}" type='text'>
													</div>


													<div class="form-group">
														<label for="reason">狀態說明</label>
														<textarea rows="4" cols="50" id="reason" name="reason"
															class="form-control">${project.reason}</textarea>
													</div>



													<!-- 以下為按鈕 -->
													<button id="sendButton" type='button' name='updateButton'
														class="btn btn-primary mr-2">送出審核</button>


													<button id="passButton" type='button' name='passButton'
														class="btn btn-info">通過</button>

													<button id="NotPassButton" type='button' name='NotPassButton'
														class="btn btn-warning">不通過</button>

													<button id="deleteButton" type='button' name='deleteButton'
														class="btn btn-danger" >刪除</button> 

												</form>
											</div>

										</div>

										<!-- content-wrapper ends -->

									</div>
									<!-- main-panel ends -->
								</div>
								<!-- page-body-wrapper ends -->
							</div>
							<!-- container-scroller -->
							<!-- plugins:js -->
							<script src="../vendors/js/vendor.bundle.base.js"></script>
							<!-- endinject -->
							<!-- Plugin js for this page -->
							<script src="../vendors/typeahead.js/typeahead.bundle.min.js"></script>
							<script src="../vendors/select2/select2.min.js"></script>
							<!-- End plugin js for this page -->
							<!-- inject:js -->
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
							<!-- End custom js for this page-->


							<script type="text/javascript">

								$(document).ready(function () {
									$('#pContent').summernote();


									var projectID = ${ project.pID };//抓專案ID
									var mStatus = "${sessionScope.memberData.status}"//取得會員身分


									if (mStatus == '管理員') {
										//管理員身分
										$("#passButton").show();
										$("#NotPassButton").show();
										$("#sendButton").hide();




									} else {
										//會員身分

										$("#sendButton").show();
										$("#passButton").hide();
										$("#NotPassButton").hide();
										$("#deleteButton").hide();
										// $(".form-control").attr("disabled", true)
										$(".form-control").attr("readonly", true)
										$("#pDescribe").attr("readonly", false);
										$("#pContent").attr("readonly", false);
									}




									//當更換圖片
									$("#changeImageCover").on("change", function () {
										var changeImageCover = $("#changeImageCover")[0].files[0];
										var reader = new FileReader;
										reader.onload = function (e) {
											$('#pImageCover').attr('src', e.target.result);
										}
										reader.readAsDataURL(changeImageCover);

									});


									//管理者按通過
									$("#passButton").click(function () {

										
										$("#pStatus").val("通過");//把狀態改為通過
										var pStatus = $("#pStatus").val();
										//var reason = $("#reason").val("已通過審核並上架");



										var url = "<spring:url value='/Project/theProject/changeStatus/" + projectID + "'/>";
										$.ajax({
											url: url,
											type: 'PUT',
											data: { pStatus: pStatus, reason: "已通過審核並上架" },
											success: function (data) {
												Swal.fire({
													title: '更新成功',
													icon: 'success',
													text: "已經更新！",
													position: 'center',

												}).then((result) => {
													if (result.isConfirmed) {
														location.href = "<c:url value='/Project/allProjectInBackstage'/>";
													}
												})
											},
											error: function (xhr, text) {
												console.log("status code: " + xhr.status);
												console.log("error message: " + text);
												Swal.fire({
													title: '更新失敗',
													icon: 'error',
													text: "更新失敗",
												})
											}

										})
									})






									//管理者按不通過
									$("#NotPassButton").click((async () => {
										

										const { value: text } = await Swal.fire({
											input: 'textarea',
											inputLabel: 'Message',
											inputPlaceholder: 'Type your message here...',
											inputAttributes: {
												'aria-label': 'Type your message here'
											},
											showCancelButton: true,
											height: 20

										})


										$("#pStatus").val("未通過");//把狀態改為未通過
										var pStatus = $("#pStatus").val();
										var reason = text;//存管理員所寫的理由

										var url = "<spring:url value='/Project/theProject/changeStatus/" + projectID + "'/>";
										$.ajax({
											url: url,
											type: 'PUT',
											data: { pStatus: pStatus, reason: reason },
											success: function (data) {
												Swal.fire({
													title: '更新成功',
													icon: 'success',
													text: "已經更新！",
													position: 'center',

												}).then((result) => {
													if (result.isConfirmed) {
														location.href = "<c:url value='/Project/allProjectInBackstage'/>";
													}
												})
											},
											error: function (xhr, text) {
												// console.log("status code: " + xhr.status);
												// console.log("error message: " + text);
												// Swal.fire({
												// 	title: '更新失敗',
												// 	icon: 'error',
												// 	text: "更新失敗",
												// })
											}

										})

									}))//NotPassButton End



									//使用者按送出審核
									$("#sendButton").click(function () {
										$(".form-control").attr("disabled", false);//送出前必須把所有input欄位解開，不然table取不到值
										var pStatus = $("#pStatus").val("待審核");//把狀態改為待審核
										var reason = $("#reason").val("請待管理員進行審核");
										var form = document.getElementById("form")
										var formData = new FormData(form);
										var url = "<spring:url value='/Project/theProject/" + projectID + "'/>";


										$.ajax({
											url: url,
											type: 'PUT',
											data: formData,
											contentType: false, //required
											processData: false, // required
											mimeType: 'multipart/form-data',
											success: function (data) {
												Swal.fire({
													title: '更新成功',
													icon: 'success',
													text: "已經送出審核！",
													position: 'center',

												}).then((result) => {
													if (result.isConfirmed) {
														location.href = "<c:url value='/Project/allProjectInBackstage'/>";
													}
												})
											},
											error: function (xhr, text) {
												console.log("status code: " + xhr.status);
												console.log("error message: " + text);
												Swal.fire({
													title: '更新失敗',
													icon: 'error',
													text: "送出審核失敗",
												})
											}
										});
									})






									//刪除按鈕
									$("#deleteButton").click(function () {

										const swalWithBootstrapButtons = Swal.mixin({
											customClass: {
												confirmButton: 'btn btn-success',
												cancelButton: 'btn btn-danger'
											},
											buttonsStyling: false
										})


										swalWithBootstrapButtons.fire({
											title: '確定刪除?',
											text: "你將刪除此計畫!",
											icon: 'warning',
											showCancelButton: true,
											confirmButtonText: '刪除!',
											cancelButtonText: '取消!',
											reverseButtons: true
										}).then((result) => {
											if (result.isConfirmed) {

												var url = "<spring:url value='/Project/theProject/" + projectID + "'/>";

												$.ajax({
													url: url,
													type: 'DELETE',
													data: {},

													success: function (data) {
														Swal.fire({
															position: 'center',
															icon: 'success',
															title: '刪除成功',

															timer: 3000,
															timerProgressBar: true,
															showConfirmButton: false,
														})
														location.href = "<c:url value='/Project/allProjectInBackstage'/>";
													},
													error: function (xhr, text) {
														swalWithBootstrapButtons.fire(
															'失敗',
															'刪除失敗，請確認有此紀錄 ',
															'error'
														)
													}
												})


											}

											else if (
												/* Read more about handling dismissals below */
												result.dismiss === Swal.DismissReason.cancel
											) {
												swalWithBootstrapButtons.fire(
													'取消',
													'已取消刪除 ',
													'success'
												)
											}
										})
									})//刪除按鈕結束






								})//read function 結束

							</script>
				</body>

				</html>