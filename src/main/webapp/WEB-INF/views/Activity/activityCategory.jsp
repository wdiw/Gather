<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Gather募資—分享你我的好想法</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">

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
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

<style>
.img-fluid {
	max-width: 286px;
	height: 286px;
}

.cat span {
	color: rgb(14, 124, 236) !important
}

.collapsed{
 font-size: 20px !important;
}

#collapseFour a{
 font-size: 20px !important;
}
/* .progress {
							background-color: black
						} */
</style>
</head>

<body class="goto-here">
	<div class="py-1 bg-black">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">+ 1235 2355 98</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">Gather.WebService@gmail.com</span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
							<span class="text">3-5 Business days delivery &amp; Free
								Returns</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<img style="margin-left:10px;" width="130px" height="100px"  src="/Gather/images/G.png">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item dropdown active">

						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="shop.html">Shop</a> <a
								class="dropdown-item" href="product-single.html">Single
								Product</a> <a class="dropdown-item" href="cart.html">Cart</a> <a
								class="dropdown-item" href="checkout.html">Checkout</a>
						</div>
					</li>
					<li class="nav-item"><a href="/Gather/allposts"
						class="nav-link">Blog</a></li>


					
					
					<c:choose>
						<c:when test="${memberData!=null}">
							<li class="nav-item"><a href="/Gather/showMemberCenter"
								class="nav-link">會員中心</a></li>
							<li class="nav-item"><a href="/Gather/showLogout"
								class="nav-link">登出</a></li>
							<c:choose>
								<c:when test="${memberData.status eq '管理員'}">
									<li class="nav-item"><a href="/Gather/backend"
										class="nav-link">管理員後台</a></li>
								</c:when>
							</c:choose>
						</c:when>
						<c:otherwise>
						<li class="nav-item"><a href="/Gather/oneKeyloginMember"
								class="nav-link">一鍵登入會員</a></li>
					<li class="nav-item"><a href="/Gather/oneKeyloginAdmin"
								class="nav-link">一鍵登入管理員</a></li>
							<li class="nav-item"><a
								href="/Gather/pages/member/register.html" class="nav-link">註冊</a></li>
							<li class="nav-item"><a
								href="/Gather/pages/member/login.html" class="nav-link">登入</a></li>
						</c:otherwise>
					</c:choose>


					<!--我的最愛-->
					<c:choose>
						<c:when test="${mBean.id!=null}">
							<li class="nav-item cta cta-colored"><a
								href="/Gather/myFav/${mBean.id}" class="nav-link"><i
									class="fas fa-hand-holding-heart"></i>[${favCount}]</a></li>
						</c:when>

					</c:choose>
					<!--購物車-->


				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('/Gather/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<!-- <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Shop</span></p> -->
					<p class="breadcrumbs">
						<span>Activity</span>
					   </p>
					<h1 class="mb-0 bread">Gather活動頁面</h1>
				</div>
			</div>
		</div>
	</div>



	<section class="ftco-section bg-light">


		<div class="container">

			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12 ">

				<input class='search-bar' type='text' name='search' id='searchvalue'  placeholder='輸入活動名稱' style="width: 120px;">
				<button id='search' class="btn btn-primary ">搜尋</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-lg-10 order-md-last">
					<div class="row">




					
		    			<c:forEach items='${activities}' var='activity' >

		    			<div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
		    		
		    				<div class="product d-flex flex-column">
		    					<img class="img-fluid" src="<c:url value='/ActivitygetPicture/${activity.id}'/>"  width="350" height="300"  class="img-rounded">
		    						<!-- <span class="status">50% Off</span> -->
		    						<div class="overlay"></div>
		    					</a>
		    					<div class="text py-3 pb-4 px-3">
		    						<div class="d-flex">
		    							
				    						<span>開始日期:${activity.beginDate}<br>
											結束日期:${activity.endDate}</span>
			    				
			    					</div>

									
		    						<h3><a href="#">${activity.name}</a></h3>
		  							<div class="pricing" style="text-align: center;">
			    						<p class="price">
											<!-- <span class="mr-2 price-dc"></span> -->
									
															<a href="<spring:url value='/activitylogin?id=${activity.id}' />" 
								                                	class="btn btn-primary py-3 px-4">活動登錄
							                                             	</a>
			    					</div>
									<!-- 有需要加入我的最愛可以用 -->
			    					<!-- <p class="bottom-area d-flex px-3">
		    							<a href="#" class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
		    							<a href="#" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>
		    						</p> -->
		    					</div>
		    				</div>
		    			</div>
					</c:forEach>





					</div>
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								
							</div>
						</div>
					</div>
				</div>





				<div class="col-md-4 col-lg-2">
					<div class="sidebar">
						<div class="sidebar-box-2">
			
							<div class="fancy-collapse-panel">


								<div class="panel-group" id="accordion" role="tablist"
									aria-multiselectable="true">


									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingFour">
											<h4 class="panel-title">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#collapseFour"
													aria-expanded="false" aria-controls="collapseThree">活動分類
												</a>
											</h4>
										</div>
										<div id="collapseFour" class="panel-collapse collapse"
											role="tabpanel" aria-labelledby="headingFour">
											<div class="panel-body">
												
													<ul>
														<li><a href="<spring:url value='/userpage'/>">全部活動</a></li>
														<li><a href="<spring:url value='/activityCategory?category=課程講座'/>">課程講座</a></li>
														<li><a href="<spring:url value='/activityCategory?category=優惠活動'/>">優惠活動</a></li>
														<li><a href="<spring:url value='/activityCategory?category=提案競賽'/>">提案競賽</a></li>
														<li><a href="<spring:url value='/activityCategory?category=線上抽獎'/>">線上抽獎</a></li>
														<li><a href="<spring:url value='/lottery'/>">抽獎頁面</a></li>
														
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

	

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
					</a>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Gather</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
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
								<li><a href="#" class="py-2 d-block">Shipping
										Information</a></li>
								<li><a href="#" class="py-2 d-block">Returns &amp;
										Exchange</a></li>
								<li><a href="#" class="py-2 d-block">Terms &amp;
										Conditions</a></li>
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
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
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
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | Gather
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
							<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
							<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
						</svg>
	</div>


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
	   $('#search').click(function(){

		      var search=$('#searchvalue').val();
		   
		      
		      
		      location.href=  "<spring:url value='/search?search=" + search + "'/>"
			
		      
		      

			  


				}
				
				);


					</script>

</body>

</html>