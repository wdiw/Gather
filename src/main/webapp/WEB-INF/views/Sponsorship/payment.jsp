
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<style>
*{
font-size: 15px;
}

.billing-form label {
    color: #000000;
    font-size: 22px !important;
}
.billing-form .form-control {
    font-size: 16px !important;
}
#navBarTop {
    max-width: 1850px;
}

.nav-link{
 font-size: 16px !important;
}
</style>
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
 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
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
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container" id="navBarTop">
							<a href="/Gather">
			<img style="margin-left:10px;" width="130px" height="100px"  src="/Gather/images/G.png"></a>
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
								aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
								<span class="oi oi-menu"></span> Menu
							</button>

							<div class="collapse navbar-collapse" id="ftco-nav">
								<ul class="navbar-nav ml-auto">

									<li class="nav-item dropdown active">
										
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
                      <li class="nav-item"><a href="/Gather/showMemberCenter" class="nav-link">會員中心</a></li>
                      <li class="nav-item"><a href="/Gather/showLogout" class="nav-link">登出</a></li>
                      <c:choose>
                        <c:when test="${memberData.status eq '管理員'}">
                          <li class="nav-item"><a href="/Gather/backend" class="nav-link">管理員後台</a></li>
                        </c:when>
                      </c:choose>
                    </c:when>
                    <c:otherwise>
                      <li class="nav-item"><a href="/Gather/pages/member/register.html" class="nav-link">註冊</a></li>
                      <li class="nav-item"><a href="/Gather/pages/member/login.html" class="nav-link">登入</a></li>
                    </c:otherwise>
                  </c:choose>


													<!--我的最愛-->
													<c:choose>
														<c:when test="${mBean.id!=null}">
															<li class="nav-item cta cta-colored"><a
																	href="/Gather/myFav/${mBean.id}" class="nav-link"><i
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

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Sponsorship</a></span> <span>Confirm</span>
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
					<form id="form" action="./goECPay" class="billing-form" method="POST">
						<p style="font-size:30px;color:black" class="mb-4 billing-heading">贊助明細</p>
						<div class="row align-items-end" style="position: relative">
							<div class="col-md-6" align="center">
								<div class="form-group">
<!-- 									<div class="col-lg-6 mb-5 ftco-animate"> -->
										<a
											href="./${pPBean.projectPlanImage}"
											class="image-popup prod-img-bg"> <img
											src="./${pPBean.projectPlanImage}"
											class="img-fluid" alt="Colorlib Template" id="projectImage" ></a>
											<input type="hidden" name="projectImage" value="./${pPBean.projectPlanImage}">
										<div class="col-md-12" style="padding:0px">
											<div class="form-group">
											<input type="hidden" name="sPName" value="${pBean.pName}">
												<p for="lastname" style="padding:0;
  text-align: left">${pPBean.projectPlanContent}</p>
											</div>
										</div>
<!-- 									</div> -->
								</div>
							</div>
							<input type="hidden" value="${mBean.id}" name="mID">
							<input type="hidden" value="${pBean.pID}" name="sPID">
							<input type="hidden" value="${pBean.mID}" name="proposerID">
							<input type="hidden" value="${pPBean.projectPlanID}" name="projectPlanID"> 
							<input type="hidden" value="${pPBean.projectPlanPrice}" name="sAmount">
							
							

							<div class="col-md-6"
								style="position: absolute; top: 0; right: 0">
								<div class="form-group">
									<label for="postcodezip">贊助者</label> <input type="text"
										class="form-control" placeholder="" value="${mBean.name}"
										name="sName" id="sName" required="required">
								</div>
								<div class="form-group">
									<label for="postcodezip">連絡電話</label> <input type="text"
										class="form-control" placeholder="" value="${mBean.phone}"
										name="sPhone" id="sPhone" required="required">
								</div>
							</div>

							<div class="w-100"></div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="streetaddress">加碼贊助</label>
									<div style="position: relative;">
									
										<i class="fas fa-dollar-sign"
											style="position: absolute; left: 10px; top: 18px; font-size: 22px; text-align: center;"></i>
										<input type="number" class="form-control" placeholder="0" min="0" 
											style="padding-left: 32PX; font-size: 20px; padding-bottom: 8px"
											name="sBonus" id="sBonus" onchange="getBonus();getTotal()" required="required">
									</div>
								</div>
							</div>


							<div class="col-md-6">
								<div class="form-group">
									<label for="streetaddress">電子信箱</label> <input type="text"
										class="form-control" placeholder="" value="${mBean.account}" name="sEmail" required="required">
								</div>
							</div>


							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">回饋優惠</label> <input type="text"
										class="form-control" placeholder="" name="sDiscount"
										id="sDiscount" onchange="getDiscount();getTotal()" required="required" value="${discount}">
								</div>
							</div>


							<div class="col-md-6">
								<div class="form-group">
									<label for="towncity">地址</label> <input type="text"
										class="form-control" placeholder="" value="${mBean.address}"
										name="sAddress" id="sAddress" required="required">
								</div>
							</div>
						</div>
						<div class="row mt-5 pt-3 d-flex" align="center">
							<div class="col-md-6 d-flex">
								<div class="cart-detail cart-total bg-light p-3 p-md-4"
									style="width: 450px">
									<h3 class="billing-heading mb-4">贊助總額</h3>
									<p class="d-flex">
										<span>方案金額</span> <span>$${pPBean.projectPlanPrice}</span>
									</p>
									<p class="d-flex">
										<span>加碼贊助</span> <span><input style="outline: none;border:0;background-color: rgba(0, 0, 0, 0);text-align: center;" id="sBonus_confirm" value=""/></span>
									</p>
									<p class="d-flex">
										<span>回饋金折抵</span> <span><input style="outline: none;border:0;background-color: rgba(0, 0, 0, 0);text-align: center;" id="sDiscount_confirm" value="$${discount}" /></span>
									</p>
									<hr>
									<p class="d-flex total-price">
										<span>總金額</span> <span><input style="outline: none;border:0;background-color: rgba(0, 0, 0, 0);text-align: center;" id="sTotal_confirm" value=""/></span>
									</p>
								</div>
							</div>
							<div class="col-md-6" style="width: 450px">
								<div class="cart-detail bg-light p-3 p-md-4">
									<h3 class="billing-heading mb-4">付款方式</h3>
									
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<p><input type="radio" name="paymentMethod"
													class="mr-2" value="網路ATM">ECPay</p>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<p><input type="radio" name="paymentMethod"
													class="mr-2" value="Line Pay">Line Pay</p>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="checkbox">
												<p><input type="checkbox" value="" class="mr-2">
													我已閱讀並接受條款和條件</p>
											</div>
										</div>
									</div>
									<p>
										<button class="btn btn-primary py-3 px-4" type="submit"
											name="submit" id="submit" >立刻贊助</button>
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

			 $('.quantity-left-minus').click(function(e){
			        // Stop acting like a button
			        e.preventDefault();
			        // Get the field name
			        var quantity = parseInt($('#quantity').val());
			        
			        // If is not undefined
			      
			            // Increment
			            if(quantity>0){
			            $('#quantity').val(quantity - 1);
			            }
			    });
			    
// 				$("#submit").click(function(){
				
					
// 						let sPID=${pBean.pID};
// 						let sPName="${pBean.pName}";
// 						let projectImage=$('#projectImage').attr("src");
// 						let mID="${sessionScope.memberData.id}";
// 						let sName="${sessionScope.memberData.name}"
// 						let sPhone=$('#sPhone').val();
// 						let sBonus=$('#sBonus').val();
// 						let sAddress=$('#sAddress').val();
// 						let sEmail="${sessionScope.memberData.account}";
// 						let sAmount="300";
// 						let sDiscount=$('#sDiscount').val();
// 						let radio=document.getElementsByName("paymentMethod");
// 						let proposerID=${pBean.mID};
// 						 var radioLength = radio.length;
// 						   for(var i =0;i < radioLength;i++){
// 						    if(radio[i].checked)
// 						     var paymentMethod = radio[i].value;
							  
// 						   }
						   
					


// 					var data = {
// 		        	  sPID:sPID,
// 		        	  sPName:sPName,
// 		        	  projectImage:projectImage,
// 		        	  mID:mID,
// 		        	  sName:sName,
// 		        	  sPhone:sPhone,
// 		        	  sBonus:sBonus,
// 		        	  sAddress:sAddress,
// 		        	  sEmail:sEmail,
// 		        	  sAmount:sAmount,
// 		        	  sDiscount:sDiscount,
// 		        	  paymentMethod:paymentMethod,
// 		        	  proposerID:proposerID
// 		         	};
// 					 $.ajax({
// 						 url: "./newOrder",
// 		              type: 'POST',
// 					  data:data,
// 					   success: function (data) {
// 						   alert(data)
// 						   Swal.fire({
// 				                  title: '訂單成立',
// 				                  icon: 'success',
// 				                  text: "已經新增贊助！",
// 				                  position: 'center',
				            

// 				                }).then((result) => {
// 				                	console.log("yes!!!!!!!!!!!!!!!!!!")
// 				                    if (result.isConfirmed) {
// 				                    $.ajax({
// 				                    	url: "./goECPay",
// 				   		              	type: 'POST',
// 				   					  	data:{
// 				   							sAmount:sAmount,
// 				  		        	  		sDiscount:sDiscount,
// 				  		        	  		sID:data,
// 				  		        			sBonus:sBonus
// 				   					  	},
// 				                    })
				                     
// 				                    }
// 				                  })
// 					   },error: function (xhr, text) {
// 						   console.log("status code: " + xhr.status);
// 		                    console.log("error message: " + text);
// 		                    Swal.fire({
// 		                      title: '新增失敗',
// 		                      icon: 'error',
// 		                      text: "失敗",
// 		                    })
// 					   }
// 					 })
// 				})




       			
				    
			});
		
	        
	    function getBonus(){
	        var sBonus = document.getElementById('sBonus').value; 
	        document.getElementById('sBonus_confirm').value ="$"+sBonus;
	        
	    }
	    
	        
	    function getDiscount(){
	        var sDiscount = document.getElementById('sDiscount').value; 
	        document.getElementById('sDiscount_confirm').value ="$"+sDiscount;
	        
	    }
	    
	    function getTotal(){
	    	var planPrice_string=${pPBean.projectPlanPrice};
	    	var planPrice=parseInt(planPrice_string);
	    	var sDiscount = document.getElementById('sDiscount').value; 
	    	var sBonus = document.getElementById('sBonus').value; 
	    	var sTotal_confirm=planPrice+(sBonus-sDiscount);
	    	document.getElementById('sTotal_confirm').value ="$"+sTotal_confirm;
	    		
	    }
	 
			
			
		
	</script>

</body>
</html>