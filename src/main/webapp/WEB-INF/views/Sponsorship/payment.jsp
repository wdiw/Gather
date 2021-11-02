<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Payment</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">

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
							<span class="text">youremail@email.com</span>
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
			<a class="navbar-brand" href="index.html">Minishop</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Catalog</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="shop.html">Shop</a> <a
								class="dropdown-item" href="product-single.html">Single
								Product</a> <a class="dropdown-item" href="cart.html">Cart</a> <a
								class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
					<li class="nav-item cta cta-colored"><a href="cart.html"
						class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p>
					<h1 class="mb-0 bread">贊助確認</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
					<form id="form" action="#" class="billing-form">
						<h3 class="mb-4 billing-heading">贊助明細</h3>
						<div class="row align-items-end" style="position: relative">
							<div class="col-md-6" align="center">
								<div class="form-group">
									<div class="col-lg-6 mb-5 ftco-animate">
										<a
											href="./images/Project/走走化妝桌椅｜與你一起變美的夥伴，獻給認真愛美的你/走走化妝桌椅｜與你一起變美的夥伴，獻給認真愛美的你_Cover.jpg"
											class="image-popup prod-img-bg">
											<img
											src="./images/Project/走走化妝桌椅｜與你一起變美的夥伴，獻給認真愛美的你/走走化妝桌椅｜與你一起變美的夥伴，獻給認真愛美的你_Cover.jpg"
											class="img-fluid" alt="Colorlib Template" id="projectImage"></a>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="lastname">${pBean.pName}</label>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-6"
								style="position: absolute; top: 0; right: 0">
								<div class="form-group">
									<label for="postcodezip">贊助者</label> <input type="text"
										class="form-control" placeholder="" value="${mBean.name}" name="sName" id="sName">
								</div>
								<div class="form-group">
									<label for="postcodezip">連絡電話</label> <input type="text"
										class="form-control" placeholder="" value="0935623709" name="sPhone" id="sPhone">
								</div>
							</div>

							<div class="w-100"></div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="streetaddress">加碼贊助</label>
									<div style="position: relative;">
										<i class="fas fa-dollar-sign"
											style="position: absolute; left: 10px; top: 18px; font-size: 22px; text-align: center;"></i>
										<input type="number" class="form-control" placeholder="0"
											style="padding-left: 32PX; font-size: 20px; padding-bottom: 8px" name="sBonus" id="sBonus">
									</div>
								</div>
							</div>


							<div class="col-md-6">
								<div class="form-group">
									<label for="streetaddress">電子信箱</label> <input type="text"
										class="form-control" placeholder="" value="${mBean.account}">
								</div>
							</div>


							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">回饋優惠</label> <input type="text"
										class="form-control" placeholder="" name="sDiscount" id="sDiscount">
								</div>
							</div>


							<div class="col-md-6">
								<div class="form-group" >
									<label for="towncity">地址</label> <input type="text"
										class="form-control" placeholder="" value="桃園市中壢區中央路300號" name="sAddress" id="sAddress">
								</div>
							</div>
							</div>
							<div class="row mt-5 pt-3 d-flex" align="center">
						<div class="col-md-6 d-flex" >
							<div class="cart-detail cart-total bg-light p-3 p-md-4" style="width:450px">
								<h3 class="billing-heading mb-4">贊助總額</h3>
								<p class="d-flex">
									<span>方案金額</span> <span>$20.60</span>
								</p>
								<p class="d-flex">
									<span>加碼贊助</span> <span>$0.00</span>
								</p>
								<p class="d-flex">
									<span>回饋金折抵</span> <span>$3.00</span>
								</p>
								<hr>
								<p class="d-flex total-price">
									<span>總金額</span> <span>$17.60</span>
								</p>
							</div>
						</div>
						<div class="col-md-6" style="width:450px" >
							<div class="cart-detail bg-light p-3 p-md-4">
								<h3 class="billing-heading mb-4">付款方式</h3>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="paymentMethod"
												class="mr-2">銀行轉帳</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="paymentMethod"
												class="mr-2">信用卡</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="paymentMethod"
												class="mr-2">Line Pay</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="checkbox">
											<label><input type="checkbox" value="" class="mr-2">
												我已閱讀並接受條款和條件</label>
										</div>
									</div>
								</div>
								<p>
									<button class="btn btn-primary py-3 px-4" type="submit" >立刻贊助</button>
								</p>
							</div>
						</div>
			
					</form>
				</div>
				<!-- .col-md-8 -->
			</div>
		</div>
	</section>
	<!-- .section -->


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
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

	<script>
		$(document).ready(function() {

			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);

				// Increment

			});

			$('.quantity-left-minus').click(function(e) {
				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				// Increment
				if (quantity > 0) {
					$('#quantity').val(quantity - 1);
				}
			});
			
			
// 				var form = document.getElementById("form");
       			 $("#form").on("submit", function(e){
		 		var data = {
		        	  sPID:${pBean.pID},
		        	  sPName:${pBean.pName},
		        	  projectImage:$('#projectImage').attr("src"),
		        	  mID:${mBean.id}
		        	  sName:${mBean.name},
		        	  sPhone:$('#sPhone').val(),
		        	  sBonus:$('#sBonus').val(),
		        	  sAddress:$('#sAddress').val(),
		        	  sEmail:${mBean.account}
		        	  sAmount:"300",
		        	  sDiscount:$('#sDiscount').val(),
		        	  paymentMethod:$('.radio').val()
		         };
				 var formData = new FormData(form);
				 $.ajax({
		               url: "<spring:url value='/newOrder'>",
		              type: 'POST',
		               contentType: "application/json; charset=utf-8",
		              data: formData,
		             contentType: false, //required
		              processData: false, // required
		              mimeType: 'multipart/form-data',
		              success: function (data) {
		                Swal.fire({
		                  title: '訂單成立',
		                  icon: 'success',
		                  text: "已經新增贊助！",
		                  position: 'center',

		                }).then((result) => {
		                    if (result.isConfirmed) {
		                      location.href= "<c:url value='/'/>";
		                    }
		                  })
		                },
		                  error: function (xhr, text) {
		                    console.log("status code: " + xhr.status);
		                    console.log("error message: " + text);
		                    Swal.fire({
		                      title: '新增失敗',
		                      icon: 'error',
		                      text: "此筆ID" + $("#id").val() + "不存在，請檢查後重試！",
		                    })
//		                     .then((result) => {
//		                         if (result.isConfirmed) {
//		                             location.href= "<c:url value='/order/" + updateId +"'/>";
//		                           }
//		                         })
		                  }
		            });
				};
	</script>

</body>
</html>