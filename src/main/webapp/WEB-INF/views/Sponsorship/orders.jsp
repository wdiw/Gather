<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<style>
* {
	font-weight: bold;
	
}
.tableSpan{
	font-size:14px
}



/*tooltip Box*/
.con-tooltip {
	/* position: relative; */
	/* background: #fafdff; */
	background-color: rgb(255, 255, 255);
	border-radius: 500px;
	/* padding: 0 20px; */
	/* margin: 300px; */
	display: inline-flexbox;
	transition: all 0.3s ease-in-out;
	cursor: default;
}

/*tooltip */
.tooltip {
	visibility: hidden;
	z-index: 1;
	opacity: .40;
	width: 320px;
	height: 120px;
	text-align: center;
	padding: 24px 50px 10px;
	background: #e5f3d5;
	color: #333;
	position: absolute;
	top: -100%;
	left: -10%;
	border-radius: 9px;
	font: 16px;
	transform: translateY(9px);
	transition: all 0.3s ease-in-out;
	box-shadow: 0 0 3px rgba(56, 54, 54, 0.86);
}
/* tooltip  after*/
.tooltip::after {
	content: " ";
	width: 0;
	height: 0;

	/* border-style: solid;
  border-width: 12px 12.5px 0 12.5px;
  border-color: #d7e1f1 transparent transparent transparent; */

	/* position: absolute; */
	/* left: 40%; */
}

.con-tooltip:hover .tooltip {
	visibility: visible;
	transform: translateY(-10px);
	opacity: 1;
	transition: .3s linear;
	animation: odsoky 1s ease-in-out infinite alternate;
}

.bottom:hover {
	transform: translateY(6px);
}

.bottom .tooltip {
	top: 180%;
	left: 0%;
}

.bottom .tooltip::after {
	top: -17%;
	left: 40%;
	transform: rotate(180deg);
}
</style>




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
<link rel="stylesheet" href="vendors/feather/feather.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<link rel="stylesheet"
	href="vendors/mdi/css/materialdesignicons.min.css">
<!-- inject:css -->
<link rel="stylesheet" href="css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />


<!-- Datatable-->
					<link rel="stylesheet" type="text/css"
						href="https://cdn.datatables.net/v/dt/dt-1.11.1/datatables.min.css" defer/>
					<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.1/datatables.min.js"
						defer></script> 

						<script>
					
									$(document).ready(function () {
								$('#ordersTable').DataTable({
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
									}
								});
							});
			
			
								</script>

</head>

<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="index.html"><img
					width="50px" height="500px"  src="/Gather/images/G.png" class="mr-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="index.html"><img
					src="images/logo-mini.svg" alt="logo" /></a>
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
							<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
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
					<li class="nav-item nav-profile dropdown"> <a class="nav-link dropdown-toggle" href="/Gather/images/Members/${memberData.id}.jpg"data-toggle="dropdown" id="profileDropdown">
              <img src="/Gather/images/Members/${memberData.id}.jpg" alt="profile"/>
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
								class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
							<small
								class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See
								All</small>
						</div>
						<ul class="chat-list">
							<li class="list active">
								<div class="profile">
									<img src="../../images/faces/face1.jpg" alt="image"><span
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
			<!-- partial:../../partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link"
						href="../../index.html"> <i class="icon-grid menu-icon"></i> <span
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
									href="pages/ui-features/buttons.html">會員管理</a></li>
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
									href="pages/forms/basic_elements.html">全部活動</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#charts" aria-expanded="false"
						aria-controls="charts"> <i class="icon-bar-graph menu-icon"></i>
							<span class="menu-title" href="orders">訂單管理</span> <i
							class="menu-arrow"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#tables" aria-expanded="false"
						aria-controls="tables"> <i class="icon-grid-2 menu-icon"></i>
							<span class="menu-title">Projects</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="tables">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/tables/basic-table.html">專案管理</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#icons" aria-expanded="false"
						aria-controls="icons"> <i class="icon-contract menu-icon"></i>
							<span class="menu-title">AD</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="icons">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/icons/mdi.html">廣告管理</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
			<!-- partial -->
			<!-- 			<div class="main-panel"> -->
			<div class="content-wrapper">
				<div class="row" style="margin: auto;">

					<div class="card" style="margin-left: 3px;">
						<div class="card-body" >
						<button id="csv" class="btn btn-inverse-secondary btn-fw" style="font-size:14px">匯出csv檔</button>
							<h1 class="card-title"
								style="text-align: center; position: relative; right: 45px;font-size: 30px">贊助訂單</h1>
<!-- 							<div> -->
<!-- 								<input -->
<!-- 									style="border-radius: 40px; border-width: 2px; border-color: lightgrey; margin-left: 940px" -->
<!-- 									class="search-bar" type="text" name="search" id="searchBar" -->
<!-- 									placeholder="搜尋..."> -->
<!-- 								<p class="btn btn-primary py-2 px-3" id="searchBtn"> -->
<!-- 									<i class="fas fa-search-dollar"></i> -->
<!-- 								</p> -->
<!-- 							</div> -->

							<div >
								<table class="table table-hover"
									style="text-align: center; width: 10%;font-size: 10px" id="ordersTable">
									<thead>
										<tr >
											<th><span class="tableSpan"><i class="mdi mdi-nutrition"></i>訂單編號<span></th>
											<th><span class="tableSpan"><i class="mdi mdi-account-star"></i> 贊助人編號<span></th>
											<th><span class="tableSpan"><i class="mdi mdi-file-image"></i> 專案圖片<span></th>
											<th><span class="tableSpan"><i class="mdi mdi-counter"></i>專案編號<span></th>
											<th><span class="tableSpan"><i class="mdi mdi-book"></i>專案名稱<span></th>
											<th><span class="tableSpan"><i class="mdi mdi-coin"></i>贊助金額<span></th>
											<th><span class="tableSpan"><i class="mdi mdi-pencil"></i><span></th>
											<th><span class="tableSpan"><i class="mdi mdi-delete"></i><span></th>
										</tr>
									</thead>
									<c:forEach items='${orders}' var='order' varStatus="status">
										<tr>
											<td><span class="tableSpan">${order.sID}<span></td>
											<td><span>

												<div class="con-tooltip bottom">
													<p><span class="tableSpan">${order.mID}</span></p>
													<div class="tooltip" style="font-weight: bold;">

														<p><span class="tableSpan">姓名 : ${order.sName}</span></p>
														<p><span class="tableSpan">電話 : ${order.sPhone}</span></p>
														<p><span class="tableSpan">地址 : ${order.sAddress}</span></p>
														<p><span class="tableSpan">信箱 : ${order.sEmail}</span></p>
													</div>
												</div>
											<span></td>

											<td><span class="tableSpan"><img width='50' height='50'
												src="${order.projectImage}" class="img-rounded" /><span></td>
											<td class="sPID">
												<button type="button"
													class="btn btn-inverse-primary btn-rounded btn-icon"
													onclick="data(${status.index})">${order.sPID}</button>

											<span></td>
											<td><span class="tableSpan">${order.sPName}<span></td>
											<td><span class="tableSpan">$${order.sTotal}<span></td>
											<td><span class="tableSpan">
												<button type="button" id="update"
													class="btn btn-inverse-warning btn-fw"
													onclick='location.href="<c:url value='/order/${order.sID}'/>"'>修改</button>
											<span></td>
											<td><span class="tableSpan">
												<button type="button" id="delete"
													class="btn btn-inverse-danger btn-fw"
													onclick="deleteOrder(${order.sID})">刪除</button>
											<span></td>
										</tr>
									</c:forEach>
								</table>
							</div>

						</div>
					</div>


					<!-- main-panel ends -->
				</div>
				<!-- page-body-wrapper ends -->
			</div>
			<!-- container-scroller -->
			<!-- plugins:js -->
			<script src="vendors/js/vendor.bundle.base.js"></script>
			<!-- endinject -->
			<!-- Plugin js for this page -->
			<!-- End plugin js for this page -->
			<!-- inject:js -->
			<script src="js/off-canvas.js"></script>
			<script src="js/hoverable-collapse.js"></script>
			<script src="js/template.js"></script>
			<script src="js/settings.js"></script>
			<script src="js/todolist.js"></script>
			<!-- endinject -->
			<!-- Custom js for this page-->
			<!-- End custom js for this page-->


			<script>
		function deleteOrder(deleteId) {
            $.ajax({
              url: "<spring:url value='/order/delete/" + deleteId +"'/>",
              type: 'delete',
              contentType: "application/json; charset=utf-8",
              data: {},
              success: function (data) {
                Swal.fire({
                  title: '刪除成功',
                  icon: 'success',
                  text: "已經刪除！",
                  position: 'center',

                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                      location.href= "<c:url value='/orders'/>";
                    }
                  })
                },
                  error: function (xhr, text) {
                    console.log("status code: " + xhr.status);
                    console.log("error message: " + text);
                    Swal.fire({
                      title: '刪除失敗',
                      icon: 'error',
                      text: "此筆ID" + $("#id").val() + "不存在，請檢查後重試！",
                    })
                  }
            });

          };
         
//           $("#searchBtn").click(function () {
//   			var search = $("#searchBar").val()
//   			location.href = "<spring:url value='/ordersSearch?search=" + search + "'/>"
//   		})
  		
  		function data(index){
        	  var sPID=parseInt($('.sPID').eq(index).text());
        	  var data = {
      				sPID:$('.sPID').eq(index).text(),
      			}
        	  
        	  $.ajax({
        		  url: "<c:url value='/data/'/>"+$('.sPID').eq(index).text(),
//         		  url: "./data/"+sPID_test,
  				  type: 'POST',
  				  data:data,
                  success: function () {
                 	location.href= "<c:url value='/dataInfo/" + sPID +"'/>";
//                        alert("hiiiiiii");
                    },
            
                });
        	  
        	  
          }
          
	
	</script>
	 <script>
       $('#csv').click(function () {
                  var url = "<c:url value='/Csv/'/>";
                  $.ajax({
                    url: url,
                    type: 'get',
                    contentType: "application/json; charset=utf-8",
                    data: {},
                    success: function (data) {
                      Swal.fire({
                        title: '匯出成功',
                        icon: 'success',
                        text: "已匯出全部訂單資料！ 按OK回訂單管理首頁！",
                        position: 'center',

                      })
                    },
                    error: function (xhr, text) {
                      console.log("status code: " + xhr.status);
                      console.log("error message: " + text);
                      Swal.fire({
                        title: '匯出失敗',
                        icon: 'error',
                        text: "匯出失敗，請重新嘗試!",
                      })
                    }
                  });

                });

              
     </script>
	
	
</body>

</html>


