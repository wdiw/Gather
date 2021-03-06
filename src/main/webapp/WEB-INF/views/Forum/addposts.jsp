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
    		<!-- <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">3-5 Business days delivery &amp; Free Returns</span>
					    </div>
				    </div>
			    </div>
		    </div> -->
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
			<img style="margin-left:10px;" width="130px" height="100px"  src="/Gather/images/G.png">
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="/Gather/allposts" class="nav-link">Blog</a></li>
				
				<c:choose>
                    <c:when test="${memberData!=null}">
                      <li class="nav-item"><a href="/Gather/showMemberCenter" class="nav-link">????????????</a></li>
                      <li class="nav-item"><a href="/Gather/showLogout" class="nav-link">??????</a></li>
                      <c:choose>
                        <c:when test="${memberData.status eq '?????????'}">
                          <li class="nav-item"><a href="/Gather/backend" class="nav-link">???????????????</a></li>
                        </c:when>
                      </c:choose>
                    </c:when>
                    <c:otherwise>
                      <li class="nav-item"><a href="/Gather/pages/member/register.html" class="nav-link">??????</a></li>
                      <li class="nav-item"><a href="/Gather/pages/member/login.html" class="nav-link">??????</a></li>
                    </c:otherwise>
                  </c:choose>


													<!--????????????-->
													<c:choose>
														<c:when test="${mBean.id!=null}">
															<li class="nav-item cta cta-colored"><a
																	href="/Gather/myFav/${mBean.id}" class="nav-link"><i
																		class="fas fa-hand-holding-heart"></i>[${favCount}]</a>
															</li>
														</c:when>

													</c:choose>
													<!--?????????-->

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
	
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span></p>
            <h1 class="mb-0 bread">Blog</h1>
          </div>
        </div>
      </div>
    </div>

      <div class="container">
        <div class="row">
          <div class="col-lg-8 order-lg-last">
						<div class="row">
					
					<br>
<%-- 					<form id="form" class="billing-form"> --%>
					<form id="form">
						<h3 class="mb-4 billing-heading">????????????</h3>
						<div class="row align-items-end">
							
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label>????????????</label>
									<div class="select-wrap">
<!-- 										<div class="icon"><span class="ion-ios-arrow-down"></span></div> -->
										<select name="postCategory" class="form-control">
											<option id="notice">??????</option>
											<option selected>??????</option>
											<option>??????</option>
											<option>??????</option>
										</select>
									</div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label>????????????</label>
									<input type="text" id="name" name="name" class="form-control" placeholder="?????????????????????">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label>????????????</label>
									<textarea id="post" name="post" cols="200" rows="15" class="form-control" ></textarea>
								</div>
								<button type='submit' id="addbtn" name="submit" class="btn btn-primary mr-2">??????</button>
							</div>
							
						</div>
					</form>
		          
						</div>
							<br><br>
							<br><br>
          </div> <!-- .col-md-8 -->
          
          <!-- ???????????? -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <a id="search" style="cursor: pointer;"><span class="icon ion-ios-search"></span></a>
                  <input type="text" class="form-control" id="searchvalue" placeholder="??????????????????">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
            	<h3 CLASS="heading">Categories</h3>
              <ul class="categories">
                <li><a href="<spring:url value='/allposts'/>">??????</a></li>
                <li><a href="<spring:url value='/postcategory?postCategory=??????'/>">??????</a></li>
                <li><a href="<spring:url value='/postcategory?postCategory=??????'/>">??????</a></li>
                <li><a href="<spring:url value='/postcategory?postCategory=??????'/>">??????</a></li>
                <li><a href="<spring:url value='/postcategory?postCategory=??????'/>">??????</a></li>
              </ul>
            </div>
            
            
          </div>
        </div> <!-- ??????row -->
      </div> <!-- container -->
    </section> <!-- .section -->

    <section class="ftco-gallery">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-8 heading-section text-center mb-4 ftco-animate">
            <h2 class="mb-4">Follow Us On Instagram</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
          </div>
    		</div>
    	</div>
    	<div class="container-fluid px-0">
    		<div class="row no-gutters">
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-1.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-2.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-3.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-4.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-5.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-6.jpg);">
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
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Gather <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>. Downloaded from <a href="https://themeslab.org/" target="_blank">Themeslab</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="js/google-map.js"></script> -->
  <script src="js/main.js"></script>
  
  <!-- ??????Swal.fire???????????????????????? -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <!-- ???????????? IE11???????????? Promise Polyfill-->
  <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  
  
	<script>
	
	
	var mStatus = "${sessionScope.memberData.status}"//??????????????????
	var mID = "${sessionScope.memberData.id}"//????????????id

	if (mStatus == "") {
		
		//???????????????
// 		$("#passButton").show();
// 		$("#NotPassButton").show();
// 		$("#sendButton").hide();
		$("#addbtn").hide();

	} else {
		
		if ( mStatus == "?????????" ) {
			$("#notice").show();
		} else {
			$("#notice").hide();
		}
		//????????????
// 		if ( mID ==  ) {
			
// 		}

// 		$("#sendButton").show();
// 		$("#passButton").hide();
// 		$("#NotPassButton").hide();
// 		$(".form-control").attr("disabled", true)
// 		$("#pDescribe").attr("disabled", false);
// 		$("#pContent").attr("disabled", false);
		$("#addbtn").show();
	}	
	
	
	
	$('#post').summernote({  //#?????????id?????????
		placeholder: '?????????????????????',
		tabsize: 2,
		height: 100,
	});
	
	
	$('#search').click(function() {
	    var searchvalue = $('#searchvalue').val(); //?????????searchvalue??????????????????
// 	    alert(searchvalue); //?????????????????????????????????
	    location.href=  "<spring:url value='/searchresults?searchvalue=" + searchvalue + "'/>" //?????????@GetMapping??????????????????????????????
										   //@GetMapping???????????? ? ?????????@RequestParam??????????????????????????????@RequestParam("searchvalue")
	})
	
	
	var form = document.getElementById("form");

$("#addbtn").click(function() { //??????button???id?????????????????????addbtn
	$("#form").on("submit", function(e) { //??????button?????????????????????????name?????????
    /* =====for formData&MultipartFile =====*/
    e.preventDefault(); //??????????????????????????????
//     var form = document.getElementById("form");
	var formData = new FormData(form); //????????????????????????data
	var url = "<spring:url value='/addposts'/>"
    
    Swal.fire({
        title: '????????????????????????',
        icon: 'question',
        showCancelButton: true,
//         closeOnConfirm: true,
    }).then((result) => {
        if (result.isConfirmed) {
        	
            $.ajax({
                type:"post",
                url:"<spring:url value='/addposts'/>", //??????@PostMapping???????????????
                data: formData,
                contentType: false, //required
                processData: false, // required
                success: function(data){
                    
                    Swal.fire({
                    	title: '??????????????????',
                    	icon: 'success',
                    }).then((result)=>{
                    	if (result.isConfirmed) {
                    		location.href= "<spring:url value='/allposts'/>";
                    	}
                    })
                    
                },
                error: function(e, text){
                	
                	Swal.fire({
                    	title: '?????????????????????????????????',
                    	icon: 'error',
                    })
                	
                    console.log(e.status);
                    console.log(text);
                }
            }) //$.ajax({
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            Swal.fire({
                icon: 'error',
                title: '?????????????????????',
                text: '??????????????????????????????!'
            })
        }
    }) //then((result) => {
}) //$("#form").on("submit", function(e){

 }) //$("#addbtn").click(function
	
	</script>

</body>
</html>