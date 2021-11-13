<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Minishop - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
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
							<span class="text"></span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text"></span>
						</div>
						<div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
							<span class="text">3-5 Business days delivery &amp; Free Returns</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Gather</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item dropdown active">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown04" 
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Catalog</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="shop.html">Shop</a> 
							<a class="dropdown-item" href="product-single.html">Single Product</a>
							<a class="dropdown-item" href="cart.html">Cart</a>
							<a class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item">
						<a href="<spring:url value='/memberactivitylogin' />" class="nav-link">會員中心</a>
					</li>
					<li class="nav-item"><a href="contact.html" class="nav-link"></a></li>
					<li class="nav-item cta cta-colored">
						<a href="cart.html" class="nav-link">
							<span class="icon-shopping_cart"></span>[0]
						</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap hero-bread" style="background-image: url('../images/bg_6.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html"></a></span> <span>Gather</span>
					</p>
					<h1 class="mb-0 bread">Gather論壇</h1>
					<p>
						<input class='search-bar' type='text' name='search' 
								id='searchvalue' placeholder='輸入文章標題'>
						<button id='search' class="btn btn-primary py-3 px-4">搜尋</button>
					</p>
				</div>
			</div>
		</div>
	</div>



	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-10 order-md-last">
					<div class="row">



						<table class="table table-hover">

							<thead>
								<tr width="">
<!-- 									<th>文章編號</th> -->
									<th width="10%">文章分類</th>
									<th width="55%">文章標題</th>
<!-- 									<th>文章內容</th> -->
									<th width="35%">發文資訊</th>
<!-- 									<th>最後修改時間</th> -->
<!-- 									<th>回覆數</th> -->
								</tr>
							</thead>
							<c:forEach items='${AllForum}' var='forum'>
								<tr onclick='location.href="<c:url value='/postdetail?id=${forum.id}' />"' style="cursor: pointer;" >
<!-- 									<td> -->
<%-- 										<a href="<c:url value='/Forum/detail?id=${forum.id}' />" --%>
<%-- 										style="color: black;">${forum.id}</a> --%>
<!-- 									</td> -->
									<td>
										<a href="<c:url value='/Forum/detail?id=${forum.id}' />"
										style="color: black;">${forum.postCategory}</a>
									</td>
									<td style="">
										<div style="width: 100%; white-space: normal; word-wrap: break-word; 
										word-break: break-all; cursor: pointer;">
											<a href="<c:url value='/Forum/detail?id=${forum.id}' />"
											style="color: black;">${forum.name}</a>
										</div>
									</td>
<!-- 									<td onMouseOver="this.style.backgroundColor='pink';" -->
<!-- 										onMouseOut="this.style.backgroundColor='';"> -->
<!-- 										<div id="post" name="post" class="showcontent" -->
<!-- 											style="width: 100%; white-space: normal; word-wrap: break-word; word-break: break-all; cursor: pointer;" -->
<!-- 											onMouseOver="this.style.backgroundColor='orange';" -->
<!-- 											onMouseOut="this.style.backgroundColor='';"> -->
<%-- 											${forum.post} --%>
<!-- 										</div> -->
<!-- 									</td> -->
									<td>
										${forum.poster}<br> 
										${forum.postTime}<br>
										最後修改時間<br>
										${forum.postUpdateTime}
									</td>

<!-- 									<td> -->
<!-- 										<br> -->
<%-- 										${forum.postUpdateTime} --%>
<!-- 									</td> -->
<!-- 									<td>回覆數123</td> -->
								</tr>
							</c:forEach>
						</table>

					</div>
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27"></div>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-lg-2">
					<div class="sidebar">
						<div class="sidebar-box-2">
							<h2 class="heading">Categories</h2>
							<div class="fancy-collapse-panel">
								<div class="panel-group" id="accordion" role="tablist"
									aria-multiselectable="true">
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingOne">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseOne" aria-expanded="true"
													aria-controls="collapseOne">文章分類 </a>
											</h4>
										</div>
										<div id="collapseOne" class="panel-collapse collapse"
											role="tabpanel" aria-labelledby="headingOne">
											<div class="panel-body">
												<ul>
													<li><a href="<spring:url value='/Forum/queryAll'/>">全部</a></li>
													<li><a href="<spring:url value='/Forum/category?postCategory=公告'/>">公告</a></li>
													<li><a href="<spring:url value='/Forum/category?postCategory=閒聊'/>">閒聊</a></li>
													<li><a href="<spring:url value='/Forum/category?postCategory=討論'/>">討論</a></li>
													<li><a href="<spring:url value='/Forum/category?postCategory=心得'/>">心得</a></li>
												</ul>
											</div>
										</div>
									</div>

								</div>
							</div>
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
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in</p>
				</div>
			</div>
		</div>
		<div class="container-fluid px-0">
			<div class="row no-gutters">
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-1.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(../images/gallery-1.jpg);">
						<div class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-2.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(../images/gallery-2.jpg);">
						<div class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-3.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(../images/gallery-3.jpg);">
						<div class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-4.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(../images/gallery-4.jpg);">
						<div class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-5.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(../images/gallery-5.jpg);">
						<div class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-lg-2 ftco-animate">
					<a href="images/gallery-6.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(../images/gallery-6.jpg);">
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
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
					</a>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Minishop</h2>
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
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>.
						Downloaded from <a href="https://themeslab.org/" target="_blank">Themeslab</a>
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
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/scrollax.min.js"></script>
	<!-- <script src="../https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<!-- <script src="../js/google-map.js"></script> -->
	<script src="js/main.js"></script>
	<script>
	
	$('#search').click(function() {
	    var searchvalue = $('#searchvalue').val(); //用變數searchvalue放輸入的東西
	    alert(searchvalue); //測試是否抓到輸入的東西
	    location.href=  "<spring:url value='/Forum/searchresult?searchvalue=" + searchvalue + "'/>" //跳轉進@GetMapping對應的方法，也是網址
										   //@GetMapping對應網址 ? 方法的@RequestParam對應的參數，這裡就是@RequestParam("searchvalue")
	})
	
	</script>

</body>
</html>