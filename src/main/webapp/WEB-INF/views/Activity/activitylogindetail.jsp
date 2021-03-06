<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Payment</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
<style>


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
							<span class="text"></span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text"></span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container" id="navBarTop">
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
								class="nav-link">????????????</a></li>
							<li class="nav-item"><a href="/Gather/showLogout"
								class="nav-link">??????</a></li>
							<c:choose>
								<c:when test="${memberData.status eq '?????????'}">
									<li class="nav-item"><a href="/Gather/backend"
										class="nav-link">???????????????</a></li>
								</c:when>
							</c:choose>
						</c:when>
						<c:otherwise>
						<li class="nav-item"><a href="/Gather/oneKeyloginMember"
								class="nav-link">??????????????????</a></li>
					<li class="nav-item"><a href="/Gather/oneKeyloginAdmin"
								class="nav-link">?????????????????????</a></li>
							<li class="nav-item"><a
								href="/Gather/pages/member/register.html" class="nav-link">??????</a></li>
							<li class="nav-item"><a
								href="/Gather/pages/member/login.html" class="nav-link">??????</a></li>
						</c:otherwise>
					</c:choose>


					<!--????????????-->
					<c:choose>
						<c:when test="${mBean.id!=null}">
							<li class="nav-item cta cta-colored"><a
								href="/Gather/myFav/${mBean.id}" class="nav-link"><i
									class="fas fa-hand-holding-heart"></i>[${favCount}]</a></li>
						</c:when>

					</c:choose>
					<!--?????????-->

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
						<span>Activity</span>
					   </p>
					<h1 class="mb-0 bread">????????????</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
					<form id="form" action="#" class="billing-form">
						<h3 class="mb-4 billing-heading">????????????</h3>
						<div class="row align-items-end" style="position: relative">
							<div class="col-md-6" textalign="center">
								<div class="form-group">
									<div class="col-lg-6 mb-5 ftco-animate">
									
											<img src="<c:url value='/ActivitygetPicture/${activity.id}'/>"  width="350" height="300" id="projectImage">
									


					
									<div class="col-md-6">
										<div class="form-group">
											<label for="lastname"></label>
										</div>
									</div>
									</div>
								</div>
							</div>

							<div class="col-md-6"
								style="position: absolute; top: 0; right: 0">
								<div class="form-group">
									<label for="postcodezip">????????????</label> <input type="text"
										class="form-control" placeholder="" value="${activity.name}"
										name="name" id="name">
								</div>
								<div class="form-group">
									<label for="postcodezip">??????????????????</label> <input type="text"
										class="form-control" placeholder="" value="${activity.beginDate}"
										name="beginDate" id="beginDate">
										<div class="form-group">
											<label for="streetaddress">??????????????????</label> <input type="text"
												class="form-control" placeholder="" value="${activity.endDate}">
										</div>
                                       
										<div class="form-group">
											<label for="streetaddress">??????????????????</label>
												<input type="text" class="form-control" placeholder="0" value="${activityParticipationCount}"
													name="activityParticipationCount" id="activityParticipationCount">
											</div>
								</div>
							</div>

							<div class="w-100"></div>

						


						


							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">????????????</label> 
									 <textarea name="description" id="description" disabled="disabled" cols="100" rows="6" >${activity.description}</textarea>
								</div>
							</div>

                         









							
						</div>
					
							</div>
							
								
									 
                                      <p>
					                <a href="<spring:url value='/memberactivitylogin' />" class="btn btn-primary py-3 px-4" >??????</a>
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
	$("#activitylogin").click(function () {
		
		$("#activitylogin").hide();
	
		var id= '${activity.id}';
		var memberid='${memberData.id}';
		var memberlogin='${activitylogin}';
    var m_id="${activitylogin.m_id}";
    var logintime="${activitylogin.logintime}";
    var activityloginbean='${activitylogin.activityBean}'
    var activitybean='${activity}'
    

    
		
		if(activityloginbean!=activitybean){
		
			$.ajax({
			url: "<spring:url value='/Activity/login/" + id + "'/>",
			type: "Put",
			
			data: {id:id,memberid:memberid},//??????????????????????????????
			success: function (data) {
				 Swal.fire({
                     title: '?????????????????????',
                     icon: 'success',
                     imageUrl: "<c:url value='/ActivitygetPicture/${activity.id}'/>",
                     imageWidth: 400,
                     imageHeight: 200,
                 })
                 
                 location.href= "<spring:url value='/userpage'/>";

			},
			error: function (jqXHR, textStatus, errorThrown) {
				alert("??????????????????");
			}
		})
		
		
	}else{

    Swal.fire({
                     title: '??????????????????????????????????????????!',
                     icon: 'success',
                     imageUrl: "<c:url value='/ActivitygetPicture/${activity.id}'/>",
                     imageWidth: 400,
                     imageHeight: 200,
                 })
                 
                 location.href= "<spring:url value='/userpage'/>";


  }
		
		
		
		
		
	

	});
	
	
	
	
	
	
	
	
		
	</script>

</body>
</html>