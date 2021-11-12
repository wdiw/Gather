<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.Gather.member.entity.Member" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
			<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<!DOCTYPE html>
				<html lang="en">

				<head>
					<title>Gather募資—分享你我的好想法</title>
					<meta charset="utf-8">
					<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
						.img-fluid {
							max-width: 286px;
							height: 286px;
						}

						.cat span {
							color: rgb(14 124 236) !important
						}

						/* .progress {
							background-color: black
						} */
					</style>
				</head>

				<body class="goto-here">
					<div class="py-1 bg-black">
						<div class="container">
							<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
								<div class="col-lg-12 d-block">
									<div class="row d-flex">
										<div class="col-md pr-4 d-flex topper align-items-center">
											<div class="icon mr-2 d-flex justify-content-center align-items-center">
												<span class="icon-phone2"></span>
											</div>
											<span class="text">+ 1235 2355 98</span>
										</div>
										<div class="col-md pr-4 d-flex topper align-items-center">
											<div class="icon mr-2 d-flex justify-content-center align-items-center">
												<span class="icon-paper-plane"></span>
											</div>
											<span class="text">youremail@email.com</span>
										</div>
										<div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
											<span class="text">3-5 Business days delivery &amp; Free Returns</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
						id="ftco-navbar">
						<div class="container">
							<a class="navbar-brand" href="./">Gather</a>
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
								aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
								<span class="oi oi-menu"></span> Menu
							</button>

							<div class="collapse navbar-collapse" id="ftco-nav">
								<ul class="navbar-nav ml-auto">
									
									<li class="nav-item dropdown active">
										<a class="nav-link dropdown-toggle" href="#" id="dropdown04"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">Catalog</a>
										<div class="dropdown-menu" aria-labelledby="dropdown04">
											<a class="dropdown-item" href="shop.html">Shop</a>
											<a class="dropdown-item" href="product-single.html">Single Product</a>
											<a class="dropdown-item" href="cart.html">Cart</a>
											<a class="dropdown-item" href="checkout.html">Checkout</a>
										</div>
									</li>
									<li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>




								<%Member memberData= (Member)session.getAttribute("memberData");
									if (memberData == null) {%>
									<li class="nav-item"><a href="/Gather/pages/member/register.html" class="nav-link">註冊</a></li>
									<li class="nav-item"><a href="/Gather/pages/member/login.html" class="nav-link">登入</a></li>
								<%} else {
									  if(!memberData.getStatus().equals("管理員")){
								%>
								<li class="nav-item"><a href="/Gather/showMemberCenter" class="nav-link">會員中心</a></li>
								<li class="nav-item"><a href="/Gather/showLogout" class="nav-link">登出</a></li>
									<%  } else{
								%>
								<li class="nav-item"><a href="/Gather/showMemberCenter" class="nav-link">會員中心</a></li>
								<li class="nav-item"><a href="/Gather/showLogout" class="nav-link">登出</a></li>
								<li class="nav-item"><a href="/Gather/backend" class="nav-link">管理員後台</a></li>
											
								<%
									}}
								%>






									<!--購物車-->
									<li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link">
										<span class="icon-shopping_cart"></span>[0]</a></li>
									<!--購物車-->

								</ul>
							</div>
						</div>
					</nav>
					<!-- END nav -->

					<div class="hero-wrap hero-bread" style="background-image: url('/Gather/images/bg_6.jpg');">
						<div class="container">
							<div class="row no-gutters slider-text align-items-center justify-content-center">
								<div class="col-md-9 ftco-animate text-center">
									<!-- <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Shop</span></p> -->
									<h1 class="mb-0 bread">首頁</h1>
								</div>
							</div>
						</div>
					</div>



					<section class="ftco-section bg-light">


						<div class="container">

							<div class="row">
								<div class="col-sm-12 col-md-12 col-lg-12 ">

									<input id="searchBar" name="searchBar" /><button id="searchBtn" name="searchBtn"
										class="btn btn-primary">搜尋</button>
								</div>
							</div>

							<div class="row">
								<div class="col-md-8 col-lg-10 order-md-last">
									<div class="row">




										<c:forEach items='${allProject}' var='project'>

											<div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
												<div class="product d-flex flex-column">
													<a href="<c:url value='/Gather/showProject/${project.pID}' />"
														class="img-prod"><img class="img-fluid"
															src="/Gather/${project.pImageCover}" alt="">
														<!-- <span class="status">50% Off</span> -->
														<div class="overlay"></div>
													</a>
													<div class="text py-3 pb-4 px-3">
														<div class="d-flex">
															<div class="cat">
																<span>${project.pCategory}</span>
															</div>


															<div>
																<span class="EDate">${project.pEDate}</span>
															</div>



														</div>
														<h3><a href="<c:url value='/Gather/showProject/${project.pID}' />">${project.pName}</a></h3>
														<div class="pricing">
															<p class="price">
																<!-- <span class="mr-2 price-dc"></span> -->
																<span
																	class="price-sale">目標金額:NT$${project.pTarget}</span>
															</p>
														</div>

														<div class="pricing">
															<p class="price">
																<!-- <span class="mr-2 price-dc"></span> -->
																<span
																	class="price-sale">累積贊助:NT$${project.pAmountNow}</span>
															</p>
														</div>
														<p></p>
														<div class="container">
															

															<div class="progress">
																<div class="progress-bar" role="progressbar"
																	aria-valuenow="0" aria-valuemin="0"
																	aria-valuemax="100"
																	style="width:${Math.round((project.pAmountNow/project.pTarget)*100)}%">
																	
																</div>
															</div>
														</div>

														<!-- 有需要加入我的最愛可以用
														<p class="bottom-area d-flex px-3">
		    							
		    							<a href="#" class="buy-now text-center py-2">我的最愛<span><i class="far fa-heart "></i></span></a>
		    						</p> -->
													</div>
												</div>
											</div>
										</c:forEach>

										


									</div>
									<div class="row mt-5">
										<div class="col text-center">
											<div class="block-27">
												<ul>
													<li><a href="#">&lt;</a></li>
													<li class="active"><span>1</span></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#">&gt;</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>





								<div class="col-md-4 col-lg-2">
									<div class="sidebar">
										<div class="sidebar-box-2">
											<h2 class="heading">主題</h2>
											<div class="fancy-collapse-panel">


												<div class="panel-group" id="accordion" role="tablist"
													aria-multiselectable="true">


													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingFour">
															<h4 class="panel-title">
																<a class="collapsed" data-toggle="collapse"
																	data-parent="#accordion" href="#collapseFour"
																	aria-expanded="false"
																	aria-controls="collapseThree">主題
																</a>
															</h4>
														</div>
														<div id="collapseFour" class="panel-collapse collapse"
															role="tabpanel" aria-labelledby="headingFour">
															<div class="panel-body">
																<ul>
																	<li><a
																			href="<spring:url value='/Project/allProjectInForestage'/>">全部</a>
																	</li>
																	<li><a
																			href="<spring:url value='/Project/category?category=設計'/>">設計</a>
																	</li>
																	<li><a
																			href="<spring:url value='/Project/category?category=科技'/>">科技</a>
																	</li>
																	<li><a
																			href="<spring:url value='/Project/category?category=藝術'/>">藝術</a>
																	</li>
																	<li><a
																			href="<spring:url value='/Project/category?category=遊戲'/>">遊戲</a>
																	</li>
																	<li><a
																			href="<spring:url value='/Project/category?category=優質店家'/>">優質店家</a>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										</form>
									</div>
								</div>
							</div>
						</div>
						</div>
					</section>

					<section class="ftco-gallery">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-md-8 heading-section text-center mb-4 ftco-animate">
									<h2 class="mb-4">Follow Us On Instagram</h2>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and
										Consonantia, there live the blind texts. Separated they live in</p>
								</div>
							</div>
						</div>
						<div class="container-fluid px-0">
							<div class="row no-gutters">
								<div class="col-md-4 col-lg-2 ftco-animate">
									<a href="/Gather/images/gallery-1.jpg"
										class="gallery image-popup img d-flex align-items-center"
										style="background-image: url(/Gather/images/gallery-1.jpg);">
										<div class="icon mb-4 d-flex align-items-center justify-content-center">
											<span class="icon-instagram"></span>
										</div>
									</a>
								</div>
								<div class="col-md-4 col-lg-2 ftco-animate">
									<a href="/Gather/images/gallery-2.jpg"
										class="gallery image-popup img d-flex align-items-center"
										style="background-image: url(/Gather/images/gallery-2.jpg);">
										<div class="icon mb-4 d-flex align-items-center justify-content-center">
											<span class="icon-instagram"></span>
										</div>
									</a>
								</div>
								<div class="col-md-4 col-lg-2 ftco-animate">
									<a href="/Gather/images/gallery-3.jpg"
										class="gallery image-popup img d-flex align-items-center"
										style="background-image: url(/Gather/images/gallery-3.jpg);">
										<div class="icon mb-4 d-flex align-items-center justify-content-center">
											<span class="icon-instagram"></span>
										</div>
									</a>
								</div>
								<div class="col-md-4 col-lg-2 ftco-animate">
									<a href="/Gather/images/gallery-4.jpg"
										class="gallery image-popup img d-flex align-items-center"
										style="background-image: url(/Gather/images/gallery-4.jpg);">
										<div class="icon mb-4 d-flex align-items-center justify-content-center">
											<span class="icon-instagram"></span>
										</div>
									</a>
								</div>
								<div class="col-md-4 col-lg-2 ftco-animate">
									<a href="/Gather/images/gallery-5.jpg"
										class="gallery image-popup img d-flex align-items-center"
										style="background-image: url(/Gather/images/gallery-5.jpg);">
										<div class="icon mb-4 d-flex align-items-center justify-content-center">
											<span class="icon-instagram"></span>
										</div>
									</a>
								</div>
								<div class="col-md-4 col-lg-2 ftco-animate">
									<a href="/Gather/images/gallery-6.jpg"
										class="gallery image-popup img d-flex align-items-center"
										style="background-image: url(/Gather/images/gallery-6.jpg);">
										<div class="icon mb-4 d-flex align-items-center justify-content-center">
											<span class="icon-instagram"></span>
										</div>
									</a>
								</div>
							</div>
						</div>
					</section>

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
										<p>Far far away, behind the word mountains, far from the countries Vokalia and
											Consonantia.</p>
										<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
											<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a>
											</li>
											<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a>
											</li>
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
														Fake St. Mountain View, San Francisco, California, USA</span>
												</li>
												<li><a href="#"><span class="icon icon-phone"></span><span
															class="text">+2 392 3929 210</span></a></li>
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
										<script>document.write(new Date().getFullYear());</script> All rights reserved |
										This template is made with <i class="icon-heart color-danger"
											aria-hidden="true"></i> by <a href="https://colorlib.com"
											target="_blank">Colorlib</a>. Downloaded from <a
											href="https://themeslab.org/" target="_blank">Themeslab</a>
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									</p>
								</div>
							</div>
						</div>
					</footer>



					<!-- loader -->
					<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
							<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4"
								stroke="#eeeeee" />
							<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4"
								stroke-miterlimit="10" stroke="#F96D00" />
						</svg></div>


					<script src="/Gather/js/jquery.min.js"></script>
					<script src="/Gather/js/jquery-migrate-3.0.1.min.js"></script>
					<script src="/Gather/js/popper.min.js"></script>
					<script src="/Gather/js/bootstrap.min.js"></script>
					<script src="/Gather/js/jquery.easing.1.3.js"></script>
					<script src="/Gather/js/jquery.waypoints.min.js"></script>
					<script src="/Gather/js/jquery.stellar.min.js"></script>
					<script src="/Gather/js/owl.carousel.min.js"></script>
					<script src="/Gather/js/jquery.magnific-popup.min.js"></script>
					<script src="/Gather/js/aos.js"></script>
					<script src="/Gather/js/jquery.animateNumber.min.js"></script>
					<script src="/Gather/js/bootstrap-datepicker.js"></script>
					<script src="/Gather/js/scrollax.min.js"></script>
					<!-- <script src="/Gather/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
					<!-- <script src="/Gather/js/google-map.js"></script> -->
					<script src="/Gather/js/main.js"></script>


					<script>

						$("#searchBtn").click(function () {
							var search = $("#searchBar").val()
							location.href = "<spring:url value='/Project/ProjectSearch?search=" + search + "'/>"
						})

					</script>

					<script>

						function difference(date1, date2) {
							const date1utc = Date.UTC(date1.getFullYear(), date1.getMonth(), date1.getDate());
							const date2utc = Date.UTC(date2.getFullYear(), date2.getMonth(), date2.getDate());
							day = 1000 * 60 * 60 * 24;
							return (date2utc - date1utc) / day
						}

						$(document).ready(function () {

							var date = new Date();
							

							//今日日期涵式
							const formatDate = (date) => {
								let formatted_date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()
								return formatted_date;
							}

							$(".EDate").each(function () {
								var projectDate = $(this).text();//取得每一計畫日期
								var todate = formatDate(date);//今日日期

								projectDate = projectDate.replace(/-/g, "/");
								var projectDatetime = new Date(projectDate);

								todate = todate.replace(/-/g, "/");
								var todatetime = new Date(todate);

								var time = projectDatetime.getTime() - todatetime.getTime();
								var diffDay = parseInt(time / (1000 * 60 * 60 * 24));

								if (diffDay >= 0) {
									$(this).text("剩餘" + diffDay + "天")
								}
								else {
									$(this).text("已結束")
								}

							
								
							})

						})
					</script>
				</body>

				</html>
				