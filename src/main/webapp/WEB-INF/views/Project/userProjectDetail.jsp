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



					<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

					<link rel="stylesheet" href="/Gather/css/open-iconic-bootstrap.min.css">
					<link rel="stylesheet" href="/Gather/css/animate.css">

					<link rel="stylesheet" href="/Gather/css/owl.carousel.min.css">
					<link rel="stylesheet" href="/Gather/css/owl.theme.default.min.css">
					<link rel="stylesheet" href="/Gather/css/magnific-popup.css">

					<link rel="stylesheet" href="/Gather/css/aos.css">

					<link rel="stylesheet" href="/Gather/css/ionicons.min.css">

					<link rel="stylesheet" href="/Gather/css/bootstrap-datepicker.css">
					<link rel="stylesheet" href="/Gather/css/jquery.timepicker.css">


					<link rel="stylesheet" href="/Gather/css/flaticon.css">
					<link rel="stylesheet" href="/Gather/css/icomoon.css">
					<link rel="stylesheet" href="/Gather/css/style.css">







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

						.note-editing-area .note-editable {
							height: 400px;
							width: 100%;
						}


						.main-panel {
							transition: width 0.25s ease, margin 0.25s ease;
							width: calc(100%);
							min-height: calc(100vh - 60px);
							display: -webkit-flex;
							display: flex;
							-webkit-flex-direction: column;
							flex-direction: column;
						}

						.grid-margin {
							/* margin-bottom: 2.5rem; */
							margin: 0 auto;
							margin-top: 4em;

						}

						/* 唯讀效果 */
						.form-control:disabled,
						.form-control[readonly] {
							background-color: #e9ecef !important;
							opacity: 1;
						}

						/* 調整詳細內容下面那塊距離 */
						.container-fluid {
							width: 100%;
							padding-top: 5px;
							padding-right: 15px;
							padding-left: 15px;
							margin-right: auto;
							margin-left: auto;
						}

						/* 底部空間 */
						.hero-wrap.hero-bread {
							padding-top: 70px;
							padding-bottom: 0;
						}

						/* table 各lable 字體大小 */
						.form-group label {
							font-size: 20px;
							line-height: 1.4rem;
							vertical-align: top;
							margin-bottom: .5rem;
						}

						.btn {
							font-size: 20px;
						}

						/* 調整按鈕顏色 */
						.btn.btn-primary {
							background: #3288d8;
							border: 1px solid #3288d8;
							color: #fff;
						}

						/* 調整按鈕hover */
						.btn.btn-primary:hover {
							background: #fff;
							border: 1px solid #3288d8;
							color: #3288d8;
						}

						#navBarTop {
   						 max-width: 1850px;
						}

						.nav-link{
							font-size: 16px !important;
							}
					</style>
				</head>

				<body class="goto-here">
					<div class="py-1 bg-black">

					</div>


					<!-- partial:../../partials/_navbar.html -->
					<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
						id="ftco-navbar">
						<div class="container" id="navBarTop">
							<a href="/Gather">
								<img style="margin-left:10px;" width="100px" height="80px"  src="/Gather/images/G.png"></a>
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
								aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
								<span class="oi oi-menu"></span> Menu
							</button>

							<div class="collapse navbar-collapse" id="ftco-nav">
								<ul class="navbar-nav ml-auto">


									<div class="dropdown-menu" aria-labelledby="dropdown04">
										<a class="dropdown-item" href="shop.html">Shop</a>
										<a class="dropdown-item" href="product-single.html">Single Product</a>
										<a class="dropdown-item" href="cart.html">Cart</a>
										<a class="dropdown-item" href="checkout.html">Checkout</a>
									</div>
									</li>
									<li class="nav-item"><a href="/Gather/allposts" class="nav-link">Blog</a></li>




									<c:choose>
										<c:when test="${memberData!=null}">
											<li class="nav-item"><a href="/Gather/showMemberCenter"
													class="nav-link">會員中心</a></li>
											<li class="nav-item"><a href="/Gather/showLogout" class="nav-link">登出</a>
											</li>
											<c:choose>
												<c:when test="${memberData.status eq '管理員'}">
													<li class="nav-item"><a href="/Gather/backend"
															class="nav-link">管理員後台</a></li>
												</c:when>
											</c:choose>
										</c:when>
										<c:otherwise>
											<li class="nav-item"><a href="/Gather/pages/member/register.html"
													class="nav-link">註冊</a></li>
											<li class="nav-item"><a href="/Gather/pages/member/login.html"
													class="nav-link">登入</a></li>
										</c:otherwise>
									</c:choose>


									<!--我的最愛-->
									<c:choose>
										<c:when test="${mBean.id!=null}">
											<li class="nav-item cta cta-colored"><a href="/Gather/myFav/${mBean.id}"
													class="nav-link"><i
														class="fas fa-hand-holding-heart"></i>[${favCount}]</a>
											</li>
										</c:when>

									</c:choose>
									<!--購物車-->


								</ul>
							</div>
						</div>
					</nav>
					<!-- END nav -->
					<!-- partial -->

					<div class="hero-wrap hero-bread" style="background-image: url('/Gather/images/bg_6.jpg');">
						<div class="container">
							<div class="row no-gutters slider-text align-items-center justify-content-center">
								<h1 style="font-weight: bold;">詳細計畫內容</h1>

							</div>
						</div>



						<div class="container-fluid page-body-wrapper">


							<div class="main-panel">
								<div class="content-wrapper ">



									<div class="col-8 grid-margin stretch-card">
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
														<label for="pCategory">計畫類別</label>
														<input id="pCategory" name="pCategory" class="form-control"
														 value="${project.pCategory}" type='text'>
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


													<c:forEach items='${projectPlanList}' var='projectPlan'
														varStatus="status">

														<!--回饋方案一-->
														<div class="form-group">
															<label
																for="projectPlanPrice${status.count}">回饋方案${status.count}金額</label>
															<input id="projectPlanPrice${status.count}"
																name="projectPlanPrice${status.count}"
																class="form-control" type='number'
																value="${projectPlan.projectPlanPrice}" min="100"
																step="100">

														</div>
														<div class="form-group">
															<label
																for="ETA${status.count}">回饋方案${status.count}預計實現時間</label>
															<input id="ETA${status.count}" name="ETA${status.count}"
																value="${projectPlan.ETA}" class="form-control"
																type='month'>
														</div>

														<div class="form-group">
															<label
																for="projectPlanContent${status.count}">回饋方案${status.count}內容</label>
															<textarea rows="4" cols="50"
																id="projectPlanContent${status.count}"
																name="projectPlanContent${status.count}"
																class="form-control">${projectPlan.projectPlanContent}</textarea>
														</div>


														<div class="form-group">
															<label>回饋方案${status.count}圖片</label>
															<input type="file" name="projectPlanImage${status.count}"
																class="file-upload-default"
																id="projectPlanImage${status.count}">
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

															<img style="position: relative; left: 250px"
																src="../${projectPlan.projectPlanImage}" width="350"
																height="300" alt="請選擇圖片"
																id="projectPlanImageCover${status.count}"
																name="projectPlanImageCover${status.count}"
																class="img-rounded">
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
														class="btn btn-danger">刪除</button>

												</form>
											</div>

										</div>



										<!-- content-wrapper ends -->

									</div>
									<!-- main-panel ends -->
								</div>
								<!-- page-body-wrapper ends -->
							</div>
						</div>







						<!-- footer -->
						<footer class="ftco-footer ftco-section">
							<div class="container">
								<div class="row">
									<div class="mouse">
										<a href="#" class="mouse-icon">
											<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
										</a>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-md">
										<div class="ftco-footer-widget mb-4">
											<h2 class="ftco-heading-2">Gather</h2>
											<p>Far far away, behind the word mountains, far from the countries Vokalia
												and Consonantia.</p>
											<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
												<li class="ftco-animate"><a href="#"><span
															class="icon-twitter"></span></a></li>
												<li class="ftco-animate"><a href="#"><span
															class="icon-facebook"></span></a></li>
												<li class="ftco-animate"><a href="#"><span
															class="icon-instagram"></span></a></li>
											</ul>
										</div>
									</div>
									<div class="col-md">
										<div class="ftco-footer-widget mb-4 ml-md-5">
											<h2 class="ftco-heading-2">Menu</h2>
											<ul class="list-unstyled">
												<li><a href="#" class="py-2 d-block">Shop</a></li>
												<li><a href="#" class="py-2 d-block">About</a></li>
												<li><a href="#" class="py-2 d-block">Journal</a></li>
												<li><a href="#" class="py-2 d-block">Contact Us</a></li>
											</ul>
										</div>
									</div>
									<div class="col-md-4">
										<div class="ftco-footer-widget mb-4">
											<h2 class="ftco-heading-2">Help</h2>
											<div class="d-flex">
												<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
													<li><a href="#" class="py-2 d-block">Shipping Information</a></li>
													<li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
													<li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
													<li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
												</ul>
												<ul class="list-unstyled">
													<li><a href="#" class="py-2 d-block">FAQs</a></li>
													<li><a href="#" class="py-2 d-block">Contact</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="col-md">
										<div class="ftco-footer-widget mb-4">
											<h2 class="ftco-heading-2">Have a Questions?</h2>
											<div class="block-23 mb-3">
												<ul>
													<li><span class="icon icon-map-marker"></span><span class="text">203
															Fake St. Mountain View,
															San
															Francisco, California, USA</span></li>
													<li><a href="#"><span class="icon icon-phone"></span><span
																class="text">+2 392 3929
																210</span></a>
													</li>
													<li><a href="#"><span class="icon icon-envelope"></span><span
																class="text">info@yourdomain.com</span></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 text-center">

										<p>
											<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
											Copyright &copy;
											<script>document.write(new Date().getFullYear());</script> All rights
											reserved | This template is
											made
											with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a
												href="https://colorlib.com" target="_blank">Colorlib</a>. Downloaded
											from <a href="https://themeslab.org/" target="_blank">Themeslab</a>
											<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
										</p>
									</div>
								</div>
							</div>
						</footer>


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



						<script src="/Gather/js/member-center.js"></script>


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

									alert("按下通過")
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
									// var reason="AA";

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
											console.log("status code: " + xhr.status);
											console.log("error message: " + text);
											Swal.fire({
												title: '更新失敗',
												icon: 'error',
												text: "更新失敗",
											})
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
													location.href = "<c:url value='/Project/userProjects'/>";
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