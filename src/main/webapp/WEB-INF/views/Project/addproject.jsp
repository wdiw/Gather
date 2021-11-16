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
						
					</style>
				</head>

				<body class="goto-here">
					<div class="py-1 bg-black">

					</div>


					<!-- partial:../../partials/_navbar.html -->
					<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
						id="ftco-navbar">
						<div class="container">
							<a class="navbar-brand" href="/Gather">Gather</a>
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
								<h1 style="font-weight: bold;">提出計畫</h1>

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
														<label for="pName">計畫名稱</label>
														<input id="pName" name="pName" class="form-control" type='text'>
													</div>

													<div class="form-group">
														<label for="pTarget">計畫目標金額</label>
														<input id="pTarget" name="pTarget" class="form-control"
															type='number' value="10000" min="100" step="100">

													</div>

													<div class="form-group">
														<label for="pSDate">計畫開始日期</label>
														<input id="pSDate" name="pSDate" class="form-control"
															type='Date' >
													</div>

													<div class="form-group">
														<label for="pEDate">計畫結束日期</label>
														<input id="pEDate" name="pEDate" class="form-control"
															type='Date'>
													</div>

													<div class="form-group">
														<label for="pEDate">請選擇計畫類別</label>
														<select class="form-control" id="pCategory" name="pCategory">
															<option value="科技">科技</option>
															<option value="設計">設計</option>
															<option value="藝術"> 藝術</option>
															<option value="教育">教育</option>
															<option value="挺好店">挺好店</option>

														</select>
													</div>

													<div class="form-group">
														<label>計畫封面</label>
														<input type="file" name="pImage" class="file-upload-default"
															id="pImage">
														<div class="input-group col-xs-12">
															<input type="text" class="form-control file-upload-info"
																disabled placeholder="上傳圖片">

															<span class="input-group-append">
																<button class="file-upload-browse btn btn-primary"
																	type="button">上傳</button>
															</span>
														</div>
													</div>

													<div class="form-group">

														<img style="position: relative; left: 250px" src="" width="350"
															height="300" alt="請選擇照片" id="pImageCover" name="pImageCover"
															class="img-rounded">
													</div>


													<div class="form-group" >
														<label for="pDescribe">計畫簡述</label>
														<textarea rows="4" cols="50" id="pDescribe" name="pDescribe"
															class="form-control"></textarea>
													</div>

													<div class="form-group" >
													<label>計畫完整內容</label>
													<textarea id="pContent"  name="pContent" class="form-control"></textarea>
													</div>

													


													<!--回饋方案一-->
													<div class="form-group">
														<label for="projectPlanPrice1">回饋方案1金額</label>
														<input id="projectPlanPrice1" name="projectPlanPrice1"
															class="form-control" type='number' value="10000" min="100"
															>

													</div>

													<div class="form-group">
														<label for="ETA1">回饋方案1預計實現時間</label>
														<input id="ETA1" name="ETA1" class="form-control" type='month'>
													</div>

													<div class="form-group">
														<label for="projectPlanContent1">回饋方案1內容</label>
														<textarea rows="4" cols="50" id="projectPlanContent1"
															name="projectPlanContent1" class="form-control" placeholder="內容項目請以正斜線(/)作為換行符號"></textarea>
													</div>


													<div class="form-group">
														<label>回饋方案1圖片</label>
														<input type="file" name="projectPlanImage1"
															class="file-upload-default" id="projectPlanImage1">
														<div class="input-group col-xs-12">
															<input type="text" class="form-control file-upload-info"
																disabled placeholder="上傳圖片">

															<span class="input-group-append">
																<button class="file-upload-browse btn btn-primary"
																	type="button">上傳</button>
															</span>
														</div>
													</div>

													<div class="form-group">

														<img style="position: relative; left: 250px" src="" width="350"
															height="300" alt="請選擇圖片" id="projectPlanImageCover1"
															name="projectPlanImageCover1" class="img-rounded">
													</div>



													<!--回饋方案二-->
													<div class="form-group">
														<label for="projectPlanPrice2">回饋方案2金額</label>
														<input id="projectPlanPrice2" name="projectPlanPrice2"
															class="form-control" type='number' min="100">

													</div>

													<div class="form-group">
														<label for="ETA2">回饋方案2預計實現時間</label>
														<input id="ETA2" name="ETA2" class="form-control" type='month'>
													</div>

													<div class="form-group">
														<label for="projectPlanContent2">回饋方案2內容</label>
														<textarea rows="4" cols="50" id="projectPlanContent2"
															name="projectPlanContent2" class="form-control" placeholder="內容項目請以正斜線(/)作為換行符號"></textarea>
													</div>


													<div class="form-group">
														<label>回饋方案2圖片</label>
														<input type="file" name="projectPlanImage2"
															class="file-upload-default" id="projectPlanImage2">
														<div class="input-group col-xs-12">
															<input type="text" class="form-control file-upload-info"
																disabled placeholder="上傳圖片">

															<span class="input-group-append">
																<button class="file-upload-browse btn btn-primary"
																	type="button">上傳</button>
															</span>
														</div>
													</div>

													<div class="form-group">

														<img style="position: relative; left: 250px" src="" width="350"
															height="300" alt="請選擇圖片" id="projectPlanImageCover2"
															name="projectPlanImageCover2" class="img-rounded">
													</div>


													<!--回饋方案三-->
													<div class="form-group">
														<label for="projectPlanPrice3">回饋方案3金額</label>
														<input id="projectPlanPrice3" name="projectPlanPrice3"
															class="form-control" type='number' min="100">

													</div>

													<div class="form-group">
														<label for="ETA3">回饋方案3預計實現時間</label>
														<input id="ETA3" name="ETA3" class="form-control" type='month'>
													</div>

													<div class="form-group">
														<label for="projectPlanContent3">回饋方案3內容</label>
														<textarea rows="4" cols="50" id="projectPlanContent3"
															name="projectPlanContent3" class="form-control" placeholder="內容項目請以正斜線(/)作為換行符號"></textarea>
													</div>


													<div class="form-group">
														<label>回饋方案3圖片</label>
														<input type="file" name="projectPlanImage3"
															class="file-upload-default" id="projectPlanImage3">
														<div class="input-group col-xs-12">
															<input type="text" class="form-control file-upload-info"
																disabled placeholder="上傳圖片">

															<span class="input-group-append">
																<button class="file-upload-browse btn btn-primary"
																	type="button">上傳</button>
															</span>
														</div>
													</div>

													<div class="form-group">

														<img style="position: relative; left: 250px" src="" width="350"
															height="300" alt="請選擇圖片" id="projectPlanImageCover3"
															name="projectPlanImageCover3" class="img-rounded">
													</div>
													
												
													<button id="test"  name='test'
													class="btn btn-primary mr-2">一鍵輸入</button>

													<button id="addProject" type='submit' name='addProject'
														class="btn btn-primary mr-2">送出</button>

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
											<h2 class="ftco-heading-2">Minishop</h2>
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


						<script>
							$("#pImageCover").hide();//一開始圖片隱藏
							$("#projectPlanImageCover1").hide();//一開始圖片隱藏
							$("#projectPlanImageCover2").hide();//一開始圖片隱藏
							$("#projectPlanImageCover3").hide();//一開始圖片隱藏

							//當更換封面
							$("#pImage").on("change", function () {
								var changeImageCover = $("#pImage")[0].files[0];
								var reader = new FileReader;
								reader.onload = function (e) {
									$('#pImageCover').attr('src', e.target.result);
								}
								reader.readAsDataURL(changeImageCover);
								$("#pImageCover").show();//圖片顯示

							});

							//當更換回饋一圖片
							$("#projectPlanImage1").on("change", function () {
								var changeImageCover = $("#projectPlanImage1")[0].files[0];
								var reader = new FileReader;
								reader.onload = function (e) {
									$('#projectPlanImageCover1').attr('src', e.target.result);
								}
								reader.readAsDataURL(changeImageCover);
								$("#projectPlanImageCover1").show();//圖片顯示

							});

							//當更換回饋二圖片
							$("#projectPlanImage2").on("change", function () {
								var changeImageCover = $("#projectPlanImage2")[0].files[0];
								var reader = new FileReader;
								reader.onload = function (e) {
									$('#projectPlanImageCover2').attr('src', e.target.result);
								}
								reader.readAsDataURL(changeImageCover);
								$("#projectPlanImageCover2").show();//圖片顯示

							});

							//當更換回饋一圖片
							$("#projectPlanImage3").on("change", function () {
								var changeImageCover = $("#projectPlanImage3")[0].files[0];
								var reader = new FileReader;
								reader.onload = function (e) {
									$('#projectPlanImageCover3').attr('src', e.target.result);
								}
								reader.readAsDataURL(changeImageCover);
								$("#projectPlanImageCover3").show();//圖片顯示

							});



							//送出
							$("#form").on("submit", function (e) {
							
								e.preventDefault();
							

								var form = document.getElementById("form");
								var formData = new FormData(form);//把表單的資料裝成data
								var url = "<spring:url value='/Project/addProject'/>"


								$.ajax({
									// 'Content-Type': 'multipart/form-data',
									// 使用 multipart/form-data 在此不需要設定 Content-Type。
									contentType: false, //required
									processData: false, // required
									mimeType: 'multipart/form-data',
									url: url,
									type: "POST",

									data: formData,

									success: function (data) {
										Swal.fire({
											title: '提交成功',
											icon: 'success',
											text: "已經提交計畫，請待管理員審核！",
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
											title: '提交失敗',
											icon: 'error',
											text: "計畫提交失敗",
										})
									}
								})

							})//送出結束


						</script>

						<script>
							$(document).ready(function () {
								$('#pContent').summernote();
							});

						</script>

						<script>
							// 	//一鍵輸入
							$("#test").click(function (e) {
								e.preventDefault();
								$('#pName').val("每月限量製造200個，日本職人創意設計之木皮革皮夾");
								$('#pTarget').val(50000)
								$('#pSDate').val("2021-11-16")
								$('#pEDate').val('2021-12-30')
								$('#pCategory').val("設計")
								$('#pDescribe').val("兼顧【輕薄】和【便利性】，收納方便。使用日本最高級的枥木皮革。創新設計，獨特使用體驗，日本大阪職人的每個月200個限量製作!")

								$('#projectPlanPrice1').val(3200)
								$('#ETA1').val('2022-02')
								$('#projectPlanContent1').val('➤ SHUTTO QUARTET 大阪職人設計皮夾 x 1 /（六色任選：駝色、橙色、棕色、綠色、海軍藍色、黑色）/➤專用 BOX x 1')

								$('#projectPlanPrice2').val(4500)
								$('#ETA2').val('2022-02')
								$('#projectPlanContent2').val('➤ SHUTTO QUARTET 大阪職人設計皮夾 x 2 /（六色任選：駝色、橙色、棕色、綠色、海軍藍色、黑色）/➤專用 BOX x 2')

								$('#pContent').summernote('editor.pasteHTML', '<span style="font-size: 0.875rem;">你也常遇到此狀況嗎?</span><br></p><ul style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, " segoe="" ui",="" 微軟正黑體,="" "microsoft="" jhenghei",="" sans-serif;="" font-size:="" 15px;"=""><li>覺得<u><span style="font-weight: bolder;">皮夾太厚重，攜帶使用不便</span></u>，放進口袋內鼓鼓的，好難看</li><li>想要拿出來的<u><span style="font-weight: bolder;">卡片或零錢，常常要找很久</span></u>，讓人等待的時間好尷尬….</li><li>市面上的皮夾外型設計都大同小異，<span style="font-weight: bolder;"><u>缺乏自己風格</u></span></li><li><span style="font-weight: bolder;"><u>中國製</u></span>的品質，價格便宜但<u><span style="font-weight: bolder;">耐用度沒有信心</span></u></li></ul><p><span style="color: rgb(63, 63, 63); font-size: 0.875rem;"><br></span></p><p><span style="color: rgb(63, 63, 63); font-size: 0.875rem;">來自日本大阪皮革職人打造的SHUTTO QUARTET原創設計皮夾</span><br></p><p><span style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, " segoe="" ui",="" 微軟正黑體,="" "microsoft="" jhenghei",="" sans-serif;="" font-size:="" 15px;"=""><br></span></p><ul style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, " segoe="" ui",="" 微軟正黑體,="" "microsoft="" jhenghei",="" sans-serif;="" font-size:="" 15px;"=""><li>打開皮夾，內容物一目了然，不浪費尋找東西的時間</li><li>兼顧<u><span style="font-weight: bolder;">【輕薄】和【便利性】</span></u>，收納方便</li><li>完全日本製，使用<u><span style="font-weight: bolder;">最高品質的枥木皮革</span></u></li><li>取得<u><span style="font-weight: bolder;">日本專利的獨家設計</span></u>，多種顏色選擇，適合各性別年齡族群</li><li>自己使用或是親友贈禮都相當合適</li></ul><p>');
							})//一鍵輸入結束
						</script>

				</body>

				</html>