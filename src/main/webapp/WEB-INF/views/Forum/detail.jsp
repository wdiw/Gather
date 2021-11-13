<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Gather Admin</title>
<!-- plugins:css -->

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link rel="stylesheet" href="../vendors/feather/feather.css">
<link rel="stylesheet" href="../vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet" href="../vendors/select2/select2.min.css">
<link rel="stylesheet"
	href="../vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../images/favicon.png" />
</head>

<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="../index.html"><img
					src="../images/logo.svg" class="mr-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="../index.html"><img
					src="../images/logo-mini.svg" alt="logo" /></a>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="icon-menu"></span>
				</button>
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class="input-group">
							<div class="input-group-prepend hover-cursor"
								id="navbar-search-icon">
								<span class="input-group-text" id="search"> <i
									class="icon-search"></i>
								</span>
							</div>
							<input type="text" class="form-control" id="navbar-search-input"
								placeholder="Search now" aria-label="search"
								aria-describedby="search">
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item dropdown"><a
						class="nav-link count-indicator dropdown-toggle"
						id="notificationDropdown" href="#" data-toggle="dropdown"> <i
							class="icon-bell mx-0"></i> <span class="count"></span>
					</a>
						<div
							class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
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
									<h6 class="preview-subject font-weight-normal">Application
										Error</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Just now</p>
								</div>
							</a> <a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-warning">
										<i class="ti-settings mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">Settings</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Private message</p>
								</div>
							</a> <a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-info">
										<i class="ti-user mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">New user
										registration</h6>
									<p class="font-weight-light small-text mb-0 text-muted">2
										days ago</p>
								</div>
							</a>
						</div></li>
					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						id="profileDropdown"> <img
							src="/Gather/images/Members/${memberData.id}.jpg" alt="profile" />
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
								Settings
							</a> <a class="dropdown-item"> <i
								class="ti-power-off text-primary"></i> Logout
							</a>
						</div></li>
					<li class="nav-item nav-settings d-none d-lg-flex"><a
						class="nav-link" href="#"> <i class="icon-ellipsis"></i>
					</a></li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="icon-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_settings-panel.html -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="ti-settings"></i>
				</div>
				<div id="theme-settings" class="settings-panel">
					<i class="settings-close ti-close"></i>
					<p class="settings-heading">SIDEBAR SKINS</p>
					<div class="sidebar-bg-options selected" id="sidebar-light-theme">
						<div class="img-ss rounded-circle bg-light border mr-3"></div>
						Light
					</div>
					<div class="sidebar-bg-options" id="sidebar-dark-theme">
						<div class="img-ss rounded-circle bg-dark border mr-3"></div>
						Dark
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
			</div>
			<div id="right-sidebar" class="settings-panel">
				<i class="settings-close ti-close"></i>
				<ul class="nav nav-tabs border-top" id="setting-panel"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" id="todo-tab"
						data-toggle="tab" href="#todo-section" role="tab"
						aria-controls="todo-section" aria-expanded="true">TO DO LIST</a></li>
					<li class="nav-item"><a class="nav-link" id="chats-tab"
						data-toggle="tab" href="#chats-section" role="tab"
						aria-controls="chats-section">CHATS</a></li>
				</ul>
				<div class="tab-content" id="setting-content">
					<div class="tab-pane fade show active scroll-wrapper"
						id="todo-section" role="tabpanel" aria-labelledby="todo-section">
						<div class="add-items d-flex px-3 mb-0">
							<form class="form w-100">
								<div class="form-group d-flex">
									<input type="text" class="form-control todo-list-input"
										placeholder="Add To-do">
									<button type="submit"
										class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
								</div>
							</form>
						</div>
						<div class="list-wrapper px-3">
							<ul class="d-flex flex-column-reverse todo-list">
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Team review meeting
											at 3.00 PM
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Prepare for
											presentation
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Resolve all the low
											priority tickets due today
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> Schedule
											meeting for next week
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> Project
											review
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
							</ul>
						</div>
						<h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
						<div class="events pt-4 px-3">
							<div class="wrapper d-flex mb-2">
								<i class="ti-control-record text-primary mr-2"></i> <span>Feb
									11 2018</span>
							</div>
							<p class="mb-0 font-weight-thin text-gray">Creating component
								page build a js</p>
							<p class="text-gray mb-0">The total number of sessions</p>
						</div>
						<div class="events pt-4 px-3">
							<div class="wrapper d-flex mb-2">
								<i class="ti-control-record text-primary mr-2"></i> <span>Feb
									7 2018</span>
							</div>
							<p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
							<p class="text-gray mb-0 ">Call Sarah Graves</p>
						</div>
					</div>
					<!-- To do section tab ends -->
					<div class="tab-pane fade" id="chats-section" role="tabpanel"
						aria-labelledby="chats-section">
						<div
							class="d-flex align-items-center justify-content-between border-bottom">
							<p
								class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">
								Friends</p>
							<small
								class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See
								All</small>
						</div>
						<ul class="chat-list">
							<li class="list active">
								<div class="profile">
									<img src="../images/faces/face1.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Thomas Douglas</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">19 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="../images/faces/face2.jpg" alt="image"><span
										class="offline"></span>
								</div>
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
								<div class="profile">
									<img src="images/faces/face3.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Daniel Russell</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">14 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face4.jpg" alt="image"><span
										class="offline"></span>
								</div>
								<div class="info">
									<p>James Richardson</p>
									<p>Away</p>
								</div> <small class="text-muted my-auto">2 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face5.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Madeline Kennedy</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">5 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face6.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Sarah Graves</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">47 min</small>
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
					<li class="nav-item"><a class="nav-link"
						href="/Gather/backend"> <i class="icon-grid menu-icon"></i> <span
							class="menu-title">Dashboard</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic" aria-expanded="false"
						aria-controls="ui-basic"> <i class="icon-layout menu-icon"></i>
							<span class="menu-title">Member</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../pages/ui-features/buttons.html">會員管理</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#form-elements" aria-expanded="false"
						aria-controls="form-elements"> <i
							class="icon-columns menu-icon"></i> <span class="menu-title">Activity</span>
							<i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="form-elements">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../pages/forms/basic_elements.html">全部活動</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#charts" aria-expanded="false"
						aria-controls="charts"> <i class="icon-bar-graph menu-icon"></i>
							<span class="menu-title">Sponsorship</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="charts">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="../orders">訂單管理</a></li>
								<li class="nav-item"><a class="nav-link" href="../addorder">新增訂單</a>
								</li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#tables" aria-expanded="false"
						aria-controls="tables"> <i class="icon-grid-2 menu-icon"></i>
							<span class="menu-title">Projects</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="tables">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="../pages/tables/basic-table.html">專案管理</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#icons" aria-expanded="false"
						aria-controls="icons"> <i class="icon-contract menu-icon"></i>
							<span class="menu-title">Forum</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="icons">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="/Gather/Forum/adMain">討論區管理</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">文章內容</h4>
								<p class="card-description"></p>
								<form id="form" class="forms-sample">
									<div class="form-group">
										<label>文章編號</label>
										<input name="id" id="id" 
										class="form-control" value="${forum.id}" disabled>
									</div>

									<div class="form-group">
										<label>文章分類</label> 
<!-- 										<input id="name" name="name" -->
<%-- 										class="form-control" value="${forum.postCategory}" type='text'> --%>
										<select name="postCategory">
<%-- 											<option selected>${forum.postCategory}</option> --%>
											<option selected>公告</option>
											<option>閒聊</option>
											<option>討論</option>
											<option>心得</option>
										</select>
									</div>

									<div class="form-group">
										<label>文章標題</label>
										<input id="name" name="name" 
										class="form-control" value="${forum.name}" type='text'>
									</div>

									<div class="form-group">
										<label>文章描述</label>
										<textarea rows="15" cols="50" 
										id="post" name="post" class="form-control">${forum.post}</textarea>
									</div>
									
									<button id="updateButton" type='button' name='updateButton'
										class="btn btn-primary mr-2" onclick="updatebtn(${forum.id})">送出</button>
									
									<button id="deleteButton" type='button' name='deleteButton'
										class="btn btn-danger" onclick="deletebtn(${forum.id})">刪除</button>
									
									<button id="returnButton" type='button' name='returnButton'
										class="btn btn-primary mr-2" onclick='location.href="<c:url value='/Forum/queryAll' />"'>回討論區</button>
									
									<br><br>
<!-- 									<div class="form-group"> -->
<!-- 										<label>文章回應</label> -->
<!-- 										<textarea rows="4" cols="50" id="post" name="post" -->
<%-- 											class="form-control">${forum.post}</textarea> --%>
<!-- 									</div> -->
									
								</form>
								
								<br><br>

								<div class="table-responsive">
									<table class="table table-hover">

										<thead>
											<tr>
												<th>留言編號</th>
												<th>留言人</th>
												<th>留言內容</th>
												<th>留言時間</th>
											</tr>
										</thead>
										<c:forEach items='${AllForumComment}' var='forumcomments'>
											<tr>
												<td>${forumcomments.forumcommentID}</td>
												<td>
													<div
														style="width: 100%; white-space: normal; word-wrap: break-word; word-break: break-all; cursor: pointer;">
														${forumcomments.forumcommenter}</div>
												</td>
												<td onMouseOver="this.style.backgroundColor='pink';"
													onMouseOut="this.style.backgroundColor='';">
													<div id="post" name="post" class="showcontent"
														style="width: 100%; white-space: normal; word-wrap: break-word; word-break: break-all; cursor: pointer;"
														onMouseOver="this.style.backgroundColor='orange';"
														onMouseOut="this.style.backgroundColor='';">
														${forumcomments.forumcomment}</div>
												</td>
												<td>${forumcomments.forumcommentTime}</td>
											</tr>
										</c:forEach>
									</table>
								</div>

								<br><br>
								
								<h3>新增留言</h3>
							
									<div class="form-group">
										<textarea id="forumcomment" name="forumcomment" cols="100" rows="10" 
										class="form-control" placeholder="請輸入留言"></textarea>
									</div>

									<button type='submit' id="addcomment" name='submit'
										class="btn btn-primary mr-2">送出留言</button>
							
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
			<!-- Custom js for this page -->
			<script src="../js/file-upload.js"></script>
			<script src="../js/typeahead.js"></script>
			<script src="../js/select2.js"></script>
			<!-- End custom js for this page -->
			
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



			<script>
			
				$(document).ready(function(){
				$('#post').summernote({  //#後面放id屬性值
  					placeholder: '請輸入文章內容',
  					tabsize: 2,
  	        		height: 100,
  				});
				$('#forumcomment').summernote({  //#後面放id屬性值
  					placeholder: '請輸入留言',
  					tabsize: 2,
  	        		height: 100,
  				});
				});
				
				//更新按鈕
				function updatebtn(id) {
					
					var form = document.getElementById("form")
					var formData = new FormData(form);
					var url = "<spring:url value='/Forum/detail/" + id + "'/>";
// 					alert(form);
// 					alert(formData);

					$.ajax({
						url: url,
						type: 'put',
						data: formData,
						contentType: false, //required
						processData: false, // required
						mimeType: 'multipart/form-data',
						success: function (data) {
							Swal.fire({
								title: '更新成功',
								icon: 'success',
								text: "已經更新！",
								position: 'center',

							}).then((result) => {
								if (result.isConfirmed) {
									location.href = "<spring:url value='/Forum/queryAll'/>";
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
					});
				};
				
				
				//刪除按鈕
				function deletebtn(id) {
					
					Swal.fire({
						title: '確定刪除?',
						text: "你將刪除此計畫!",
						icon: 'warning',
						showCancelButton: true,
						confirmButtonText: '刪除!',
						cancelButtonText: '取消!',
// 						reverseButtons: true
					}).then((result) => {
						if (result.isConfirmed) {

							var url = "<spring:url value='/Forum/detail/" + id + "'/>";

							$.ajax({
								url: url,
								type: 'DELETE',
								data: {},
								
								success: function (data) {
									Swal.fire({
										position: 'center',
										icon: 'success',
										title: '刪除成功',
									
// 										timer: 3000,
										timerProgressBar: true,
										showConfirmButton: false,
									})
									location.href = "<spring:url value='/Forum/queryAll'/>";
								},
								error: function (xhr, text) {
// 									swalWithBootstrapButtons.fire(
									Swal.fire(
										'失敗', 
										'刪除失敗，請確認有此紀錄 ', 
										'error'
									)
								}
							})
						
						} else if (
							result.dismiss === Swal.DismissReason.cancel
						) {
							Swal.fire(
								'取消',
								'已取消刪除 ',
								'success'
							)
						}
					})
				} //function deletebtn(id)
				
				
// 					window.onload = function () {
// 			            var oInput = document.getElementById("myInput"); //取得id="myInput"標籤，也就是<input>
// 			            var omessageBox = document.getElementById("messageBox"); //取得id="messageBox"標籤，也就是<div>
// 			            var oPostBtn = document.getElementById("doPost"); //取得id="doPost"標籤，也就是<button>

// 			            oPostBtn.onclick = function () {
// 			                if (oInput.value) {
// 			                    //在JavaScript中，會等於false的值只會有undefined, null, false, 0, ""這五種，物件類永遠為true

// 			                    //建一個顯示時間的div
// 			                    var oTime = document.createElement("div");
// 			                    oTime.className = "time";
// 			                    var myDate = new Date();
// 			                    oTime.innerHTML = myDate.toLocaleString();
// 			                    omessageBox.appendChild(oTime);


// 			                    //建一個顯示留言的div
// 			                    var oMessageContent = document.createElement("div");
// 			                    oMessageContent.setAttribute("style", "border-style:dotted;background-color:lightblue;border-width:thin;")
// 			                    oMessageContent.className = "message_content";
// 			                    oMessageContent.innerHTML = oInput.value;
// 			                    oInput.value = "";
// 			                    omessageBox.appendChild(oMessageContent);

// 			                }
// 			            }
// 			        }
				
					//送出留言
					$("#addcomment").click(function() { //對應button的id屬性值addcomment
						
						var forumcomment=$('#forumcomment').val();
						var id=$('#id').val();
           
			            Swal.fire({
			                title: '您確定要送出嗎？',
							text:forumcomment,
			                icon: 'question',
			                showCancelButton: true,
//			                 closeOnConfirm: true,
			            }).then((result) => {
			                if (result.isConfirmed) {
			                    $.ajax({
			                        type:"post", //對應@PostMapping
			                        url:"<spring:url value='/Forum/addforumcomment'/>", //對應@PostMapping
			                        data:{forumcomment:forumcomment,id:id},	//?		                       
									
			                        success: function(data){
			                            Swal.fire({
			                            	title: '已新增成功！',
			                            	icon: 'success',
			                            }).then((result)=>{
			                            	if (result.isConfirmed) {
// 			                            		location.href= "<spring:url value='/Forum/detail/" + id + "'/>";
			                            		location.href= "<spring:url value='/Forum/detail?id=" + ${forum.id} + "'/>";
			                            	}
			                            })
			                            
			                        },
			                        error: function(e, text){
			                        	
			                        	Swal.fire({
			                            	title: '新增失敗！',
			                            	icon: 'error',
			                            })
			                        	
			                            console.log(e.status);
			                            console.log(text);
			                        }
			                    })
			                } else if (result.dismiss === Swal.DismissReason.cancel) {
			                    Swal.fire({
			                        icon: 'error',
			                        title: '已取消送出請求',
			                        text: '您的變更將不會被儲存!'
			                    })
			                }
			            }) 

					 }) //$("#addbtn").click(function
				
			</script>
			
			
</body>

</html>