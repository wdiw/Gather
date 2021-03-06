<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
			<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<!DOCTYPE html>
				<html>

				<head>

					<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
					<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
					<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
					<!-- <link rel="stylesheet" href="js/sweetalert2.all.min.js"> -->

					<!-- Required meta tags -->
					<meta charset="utf-8">
					<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
					<title>Gather Admin</title>
					<!-- plugins:css -->
					<link rel="stylesheet" href="/Gather/vendors/feather/feather.css">
					<link rel="stylesheet" href="/Gather/vendors/ti-icons/css/themify-icons.css">
					<link rel="stylesheet" href="/Gather/vendors/css/vendor.bundle.base.css">
					<!-- endinject -->
					<!-- Plugin css for this page -->
					<!-- End plugin css for this page -->
					<!-- inject:css -->
					<link rel="stylesheet" href="/Gather/css/vertical-layout-light/style.css">
					<!-- endinject -->
					<link rel="shortcut icon" href="/Gather/images/favicon.png" />

					<!-- Datatable-->
					<link rel="stylesheet" type="text/css"
						href="https://cdn.datatables.net/v/dt/dt-1.11.1/datatables.min.css" defer />
					<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.1/datatables.min.js"
						defer></script>

					<script>

						$(document).ready(function () {
							$('#allProjectTable').DataTable({
								"language": {
									"processing": "處理中...",
									"loadingRecords": "載入中...",
									"lengthMenu": "顯示筆數 _MENU_ ",
									"zeroRecords": "沒有符合的結果",
									"info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
									"infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
									"infoFiltered": "(從 _MAX_ 項結果中過濾)",
									"infoPostFix": "",
									"search": "搜尋:",
									"paginate": {
										"first": "第一頁",
										"previous": "上一頁",
										"next": "下一頁",
										"last": "最後一頁"
									},
									"aria": {
										"sortAscending": ": 升冪排列",
										"sortDescending": ": 降冪排列"
									}
								},
								"order": [[0, "desc"]]
							});
						});


					</script>


					<style>
						.btn {
							font-size: 16px;
						}

						/* #managerProjectOutputCSV,#managerProjectOutputJson{
							font-size: 8px;
						} */

						/* 調整按鈕顏色 */
						.btn-inverse-warning:not(.btn-inverse-light) {
							background: #3288d8;
							border: 1px solid #3288d8;
							color: #fff;
						}

						/* 調整按鈕hover */
						.btn-inverse-warning:not(.btn-inverse-light):hover {
							background: #fff;
							border: 1px solid #3288d8;
							color: #3288d8;
						}


						.sidebar .nav .nav-item .nav-link .menu-title {
							color: inherit;
							display: inline-block;
							font-size: 18px;
							line-height: 1;
							vertical-align: middle;
						}
						
						.tableSpan{
							font-size: 18px;
						}

					</style>
				</head>

				<body>
					<div class="container-scroller">
						<!-- partial:/Gather/partials/_navbar.html -->
						<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
							<div
								class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
								<a class="navbar-brand brand-logo mr-5" href="/Gather">
									<img  width="50px" height="500px"  src="/Gather/images/G.png" class="mr-2" alt="logo" /></a>
										
										<!-- <a
									class="navbar-brand brand-logo-mini" href="/Gather"><img
										src="/Gather/images/logo-mini.svg" alt="logo" /></a> -->
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
												<span class="input-group-text" id="search"> <i class="icon-search"></i>
												</span>
											</div>
											<input type="text" class="form-control" id="navbar-search-input"
												placeholder="Search now" aria-label="search" aria-describedby="search">
										</div>
									</li>
								</ul>
								<ul class="navbar-nav navbar-nav-right">
									<li class="nav-item dropdown"><a class="nav-link count-indicator dropdown-toggle"
											id="notificationDropdown" href="#" data-toggle="dropdown"> <i
												class="icon-bell mx-0"></i> <span class="count"></span>
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
										</div>
									</li>
									<li class="nav-item nav-profile dropdown"><a class="nav-link dropdown-toggle"
											href="#" data-toggle="dropdown" id="profileDropdown"> <img
												src="/Gather/images/Members/${memberData.id}.jpg" alt="profile" />
										</a>
										<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
											aria-labelledby="profileDropdown">
											<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
												Settings
											</a> <a class="dropdown-item"> <i class="ti-power-off text-primary"></i>
												Logout
											</a>
										</div>
									</li>
									<li class="nav-item nav-settings d-none d-lg-flex"><a class="nav-link" href="#"> <i
												class="icon-ellipsis"></i>
										</a></li>
								</ul>
								<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
									type="button" data-toggle="offcanvas">
									<span class="icon-menu"></span>
								</button>
							</div>
						</nav>
						<!-- partial -->
						<div class="container-fluid page-body-wrapper">
							<!-- partial:/Gather/partials/_settings-panel.html -->
							<!-- <div class="theme-setting-wrapper">
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
							</div> -->
							<div id="right-sidebar" class="settings-panel">
								<i class="settings-close ti-close"></i>
								<ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
									<li class="nav-item"><a class="nav-link active" id="todo-tab" data-toggle="tab"
											href="#todo-section" role="tab" aria-controls="todo-section"
											aria-expanded="true">TO DO LIST</a></li>
									<li class="nav-item"><a class="nav-link" id="chats-tab" data-toggle="tab"
											href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
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
														<label class="form-check-label"> <input class="checkbox"
																type="checkbox"> Team review meeting
															at 3.00 PM
														</label>
													</div> <i class="remove ti-close"></i>
												</li>
												<li>
													<div class="form-check">
														<label class="form-check-label"> <input class="checkbox"
																type="checkbox"> Prepare for
															presentation
														</label>
													</div> <i class="remove ti-close"></i>
												</li>
												<li>
													<div class="form-check">
														<label class="form-check-label"> <input class="checkbox"
																type="checkbox"> Resolve all the low
															priority tickets due today
														</label>
													</div> <i class="remove ti-close"></i>
												</li>
												<li class="completed">
													<div class="form-check">
														<label class="form-check-label"> <input class="checkbox"
																type="checkbox" checked> Schedule
															meeting for next week
														</label>
													</div> <i class="remove ti-close"></i>
												</li>
												<li class="completed">
													<div class="form-check">
														<label class="form-check-label"> <input class="checkbox"
																type="checkbox" checked> Project
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
												<div class="profile">
													<img src="/Gather/images/faces/face1.jpg" alt="image"><span
														class="online"></span>
												</div>
												<div class="info">
													<p>Thomas Douglas</p>
													<p>Available</p>
												</div> <small class="text-muted my-auto">19 min</small>
											</li>
											<li class="list">
												<div class="profile">
													<img src="images/faces/face2.jpg" alt="image"><span
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
							<!-- partial:/Gather/partials/_sidebar.html -->
							<nav class="sidebar sidebar-offcanvas" id="sidebar">
								<ul class="nav">
									<li class="nav-item"><a class="nav-link" href="/Gather/backend"> <i
												class="icon-grid menu-icon"></i> <span
												class="menu-title">Dashboard</span>
										</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#ui-basic"
											aria-expanded="false" aria-controls="ui-basic"> <i
												class="icon-layout menu-icon"></i>
											<span class="menu-title">Member</span> <i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="ui-basic">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"><a class="nav-link"
														href="pages/ui-features/buttons.html">會員管理</a></li>
											</ul>
										</div>
									</li>
									<li class="nav-item"><a class="nav-link" data-toggle="collapse"
											href="#form-elements" aria-expanded="false" aria-controls="form-elements">
											<i class="icon-columns menu-icon"></i> <span
												class="menu-title">Activity</span>
											<i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="form-elements">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"><a class="nav-link"
														href="pages/forms/basic_elements.html">全部活動</a></li>
											</ul>
										</div>
									</li>
									<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#charts"
											aria-expanded="false" aria-controls="charts"> <i
												class="icon-bar-graph menu-icon"></i>
											<span class="menu-title">Sponsorship</span> <i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="charts">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"><a class="nav-link" href="orders">訂單管理</a></li>
											</ul>
										</div>
									</li>
									<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#tables"
											aria-expanded="false" aria-controls="tables"> <i
												class="icon-grid-2 menu-icon"></i>
											<span class="menu-title">Projects</span> <i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="tables">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"><a class="nav-link"
														href="pages/tables/basic-table.html">專案管理</a></li>
											</ul>
										</div>
									</li>
									<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#icons"
											aria-expanded="false" aria-controls="icons"> <i
												class="icon-contract menu-icon"></i>
											<span class="menu-title">AD</span> <i class="menu-arrow"></i>
										</a>
										<div class="collapse" id="icons">
											<ul class="nav flex-column sub-menu">
												<li class="nav-item"><a class="nav-link"
														href="pages/icons/mdi.html">廣告管理</a></li>
											</ul>
										</div>
									</li>
								</ul>
							</nav>
							<!-- partial -->
							<div class="main-panel">
								<div class="content-wrapper">
									<div class="row">

										<div class="col-lg-12 grid-margin stretch-card">
											<div class="card">
												<div class="card-body">
													<button type="button" id="managerProjectOutputCSV"
														class="btn btn-inverse-warning btn-fw">輸出CSV</button>
													
														<button type="button" id="managerProjectOutputJson"
														class="btn btn-inverse-warning btn-fw">輸出Json</button>
													<!-- <h4 class="card-title">計畫清單</h4> -->
													<div class="table-responsive">
														<table id="allProjectTable" class="table table-hover">
															<thead>
																<tr>
																	<th><span class="tableSpan">計畫編號</span></th>
																	<th><span class="tableSpan">計畫名稱</span></th>
																	<!-- <th>計畫圖片</th> -->
																	<th><span>計畫目標</span></th>

																	<th><span class="tableSpan">計劃狀態</span></th>
																	<th><span class="tableSpan">詳細資料</span></th>
																</tr>
															</thead>
															<c:forEach items='${allproject}' var='project'>
																<tr>
																	<td><span class="tableSpan">${project.pID}</span></span></td>
																	<td><span class="tableSpan">${project.pName}</span></td>
																	<!-- <td><span><img width='50' height='50'
																			src="/Gather/${project.pImageCover}"
																			class="img-rounded" /></span></td> -->

																	<td><span class="tableSpan">${project.pTarget}</span></td>
																	<td><span class="tableSpan">${project.pStatus}</span></td>

																	<td><span class="tableSpan">
																		<button type="button" id="update"
																			class="btn btn-inverse-warning btn-fw"
																			onclick='location.href="<c:url value='/Project/managerProjectDetail?pID=${project.pID}' />"'>詳細資料</button>
																	</span></td>

																</tr>
															</c:forEach>
														</table>
													</div>
												</div>
											</div>
										</div>



									</div>

								</div>

								<script src="vendors/js/vendor.bundle.base.js"></script>

								<script src="js/off-canvas.js"></script>
								<script src="js/hoverable-collapse.js"></script>
								<script src="js/template.js"></script>
								<script src="js/settings.js"></script>
								<script src="js/todolist.js"></script>

								<script>
									$("#managerProjectOutputCSV").click(function () {
										var url = "<spring:url value='/Project/projectsOutput'/>"
										$.ajax({
											url: url,
											type: "GET",
											data:{type:"csv",pStatus:"manager"},
											success: function (data) {
												Swal.fire({
													title: '已轉出',
													icon: 'success',
													text: "資料已轉出 路徑:C:/Gather/FileOutput",
													position: 'center'
													
												})
											},error: function (xhr, text) {
										
										Swal.fire({
											title: '失敗',
											icon: 'error',
											text: "失敗"
										})
									}

										})

									});//CSV END


									$("#managerProjectOutputJson").click(function () {
										var url = "<spring:url value='/Project/projectsOutput'/>"
										$.ajax({
											url: url,
											type: "GET",
											data:{type:"csv",pStatus:"manager"},
											success: function (data) {
												Swal.fire({
													title: '已轉出',
													icon: 'success',
													text: "資料已轉出 路徑:C:/Gather/FileOutput",
													position: 'center',

												})
											},error: function (xhr, text) {
										
										Swal.fire({
											title: '失敗',
											icon: 'error',
											text: "失敗",
										})
									}

										})

									})

								</script>



				</body>

				</html>