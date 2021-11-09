<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Project</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="../https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">


<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">

<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">

<link rel="stylesheet" href="../css/aos.css">

<link rel="stylesheet" href="../css/ionicons.min.css">

<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">


<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
<link rel="stylesheet" href="../css/style.css">
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
					<li class="nav-item cta cta-colored"><a
						href="/Gather/myFav/${mBean.id}" class="nav-link"><span
							class="icon-shopping_cart"></span>${favCount}</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('../images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Shop</span>
					</p>
					<h1 class="mb-0 bread">Shop</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a
						href="../${pBean.pImageCover}"
						class="image-popup prod-img-bg"><img
						src="../${pBean.pImageCover}"
						class="img-fluid" alt="Colorlib Template"></a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${pBean.pName}</h3>
					<div class="rating d-flex">
						<p class="text-left mr-4">
							<a href="#" class="mr-2">5.0</a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a>
						</p>
						<p class="text-left mr-4">
							<a href="#" class="mr-2" style="color: #000;">100 <span
								style="color: #bbb;">Rating</span></a>
						</p>
						<p class="text-left">
							<a href="#" class="mr-2" style="color: #000;">500 <span
								style="color: #bbb;">Sold</span></a>
						</p>
					</div>
					<p class="price">
						<span>$${pBean.pTarget}</span>
					</p>

					<p>${pBean.pDescribe}</p>
					<div class="row mt-4">
						<div class="col-md-6">
							<div class="form-group d-flex">
								<div class="select-wrap">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>
									<select name="" id="" class="form-control">
										<option value="">方案一</option>
										<option value="">方案二</option>
										<option value="">方案三</option>
										<option value="">方案四</option>
									</select>
								</div>
							</div>
						</div>
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span> <input type="text" id="quantity" name="quantity"
								class="quantity form-control input-number" value="1" min="1"
								max="100"> <span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span>
						</div>
						<div class="w-100"></div>
						<div class="col-md-12">
							<p style="color: #000;">80 piece available</p>
						</div>
					</div>
					<p>
						<c:choose>
							<c:when test="${favoriteBean==null}">
								<button onclick="addFav(${pBean.pID})"
									class="btn btn-black py-3 px-5 mr-2">
									<i class="far fa-heart"></i>
								</button>
							</c:when>
							<c:otherwise>
								<button onclick="delFav(${pBean.pID})"
									class="btn btn-black py-3 px-5 mr-2">
									<i class="fas fa-heart"></i>
								</button>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
			</div>

<div class="row mt-5">
          <div class="col-md-12 nav-link-wrap">
            <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
              <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Description</a>

              <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Manufacturer</a>

              <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Reviews</a>

            </div>
          </div>

          <div class="col-md-12 tab-wrap">
            
            <div class="tab-content bg-light" id="v-pills-tabContent">

              <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
               <div class="p-4">
     <h3 class="mb-4">贊助內容</h3>
     <div class="row" id="ProjectContentText">
       <div class="col-sm-10"><p>${pBean.pContent}</p></div>
   </div>
     
     

    
 <c:forEach items='${projectPlanList}' var='projectPlan'>
  <div class="card" style="width: 18rem;">
    <div class="card-body">
     <img src="../${projectPlan.projectPlanImage}" class="card-img-top" alt="...">
   <h5 class="card-title">${projectPlan.ETA}</h5>
   <p class="card-text">${projectPlan.projectPlanContent}</p>
   <a href="../payment?pPID=${projectPlan.projectPlanID}" class="btn btn-primary">贊助方案</a>
    </div>
  </div>
 </c:forEach>


     
               </div>
              </div>

              <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
               <div class="p-4">
                <h3 class="mb-4">Manufactured By Nike</h3>
                <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.</p>
               </div>
              </div>
              <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
               <div class="row p-4">
           <div class="col-md-7">
            <h3 class="mb-4">23 Reviews</h3>
            <div class="review">
             <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
             <div class="desc">
              <h4>
               <span class="text-left">Jacob Webb</span>
               <span class="text-right">14 March 2018</span>
              </h4>
              <p class="star">
               <span>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
               </span>
               <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
              </p>
              <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
             </div>
            </div>
            <div class="review">
             <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
             <div class="desc">
              <h4>
               <span class="text-left">Jacob Webb</span>
               <span class="text-right">14 March 2018</span>
              </h4>
              <p class="star">
               <span>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
               </span>
               <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
              </p>
              <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
             </div>
            </div>
            <div class="review">
             <div class="user-img" style="background-image: url(images/person_3.jpg)"></div>
             <div class="desc">
              <h4>
               <span class="text-left">Jacob Webb</span>
               <span class="text-right">14 March 2018</span>
              </h4>
              <p class="star">
               <span>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
                <i class="ion-ios-star-outline"></i>
               </span>
               <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
              </p>
              <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
             </div>
            </div>
           </div>
           <div class="col-md-4">
            <div class="rating-wrap">
             <h3 class="mb-4">Give a Review</h3>
             <p class="star">
              <span>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               (98%)
              </span>
              <span>20 Reviews</span>
             </p>
             <p class="star">
              <span>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               (85%)
              </span>
              <span>10 Reviews</span>
             </p>
             <p class="star">
              <span>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               (98%)
              </span>
              <span>5 Reviews</span>
             </p>
             <p class="star">
              <span>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               (98%)
              </span>
              <span>0 Reviews</span>
             </p>
             <p class="star">
              <span>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               <i class="ion-ios-star-outline"></i>
               (98%)
              </span>
              <span>0 Reviews</span>
             </p>
            </div>
           </div>
          </div>
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
       <div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
      </a>
     </div>
       </div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Minishop</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
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
                 <li><a href="#" class="py-2 d-block">Privacy


			


	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/scrollax.min.js"></script>
	<script
		src="../https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../js/google-map.js"></script>
	<script src="../js/main.js"></script>

	<script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
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
		    
		});
		
		function addFav(pID) {
            $.ajax({
              url: "<c:url value='/favorite/" + pID +"'/>",
              //url: "<c:url value='/favorite/131'/>",
              type: 'get',
              contentType: "application/json; charset=utf-8",
              data: {},
              success: function (data) {
//                location.href= "<c:url value='/favorite/" + pID +"'/>";
               location.reload();

					

                },
                  
            });

          };
          function delFav(pID) {
              $.ajax({
                url: "<c:url value='/delFavorite/" + pID +"'/>",
                // url: "<c:url value='/delFavorite/131'/>",
                type: 'get',
                contentType: "application/json; charset=utf-8",
                data: {},
                success: function (data) {
//                  location.href= "<c:url value='/favorite/" + pID +"'/>";
                 location.reload();

  					

                  },
                    
              });

            };
	</script>

</body>
</html>