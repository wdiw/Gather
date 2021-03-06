<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
          <link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
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
            
          </div>
          <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container" id="navBarTop">
             <a href="/Gather"> <img style="margin-left:10px;" width="100px" height="90px"  src="/Gather/images/G.png"></a>
              
              
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
                      <li class="nav-item cta cta-colored"><a href="/Gather/myFav/${mBean.id}" class="nav-link"><i
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
                  <h1 class="mb-0 bread">????????????</h1>
                  <h1 class="mb-0 bread">Member Center</h1>
                </div>
              </div>
            </div>


            <section class="ftco-section contact-section bg-light">
              <div class="container">
                <div class="row d-flex mb-5 contact-info">
                  <!--???????????? ??????-->
                  <div class="col-md-3 d-flex" style="width: 20px;padding-right: 4%;">
                    <div class="carousel-testimony owl-carousel ftco-animate" style="padding: 0%;">
                      <div class="item">
                        <div class="testimony-wrap">
                          <a href="#changeUserPhoto" class="btn btn-inverse-success btn-fw " data-toggle="modal"
                            style="float: right; border: 3px gray solid;padding: 0;border-radius: 50%; ">
                            <div class="user-img"
                              style="background-image: url(/Gather/images/Members/${memberData.id}.jpg); border: 2px black solid;margin: 0;width: 150px;height: 150px;">
                            </div>
                          </a>
                        </div>
                        <!--??????-->
                      </div>
                      <!--??????-->
                    </div>
                    <!--??????-->
                  </div>
                  <!--??????-->
                  <!--
                      <a href="#addEmployeeModal"
															class="btn btn-inverse-success btn-fw" data-toggle="modal"
															style="float: right;">
															<span>??????</span>
														</a>
                    -->
                  <!--???????????? ??????-->
                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4" style="font-size: 26px;">
                      <h2><b>????????????</b></h2>
                      <p><span>??????:</span> ${memberData.name}</p>
                      <p><span>??????:</span> ${memberData.status}</p>
                    </div>
                  </div>

                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4" style="font-size: 26px;">
                      <h2><b>????????????</b></h2>
                      <a href="/Gather/memberactivitylogin" class="btn btn-inverse-success btn-fw" style="font-size: 26px;">
                        ????????????
                      </a><br>
                      <a href="/Gather/Project/userProjects" class="btn btn-inverse-success btn-fw"
                        style="font-size: 26px;">
                        ????????????
                      </a><br>
                      <a href="/Gather/sponsorshipInfo" class="btn btn-inverse-success btn-fw" style="font-size: 26px;">
                        ????????????
                      </a>

                    </div>
                  </div>
                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4" style="font-size: 30px;">
                      <h2><b>????????????</b></h2>
                      <a href="#changePassword" class="btn btn-inverse-success btn-fw" data-toggle="modal"
                        style="font-size: 26px;">
                        ????????????
                      </a><br>
                      <!--

                        <a href="#addEmployeeModal" class="btn btn-inverse-success btn-fw" data-toggle="modal"
                        style="font-size: 26px;">
                        ????????????
                      </a>
                    -->
                    </div>
                  </div>
                </div>
                <!--

          <h5>????????????</h5>
          <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex">
            <form action="#" class="bg-white p-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>

          </div>
            
            <div class="col-md-6 d-flex">
              <div id="map" class="bg-white"></div>
            </div>
          </div>
        -->
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>
                        <h4>????????????</h4>
                      </th>
                      <th>
                        <h4>??????</h4>
                      </th>
                      <th>
                        <h4>??????</h4>
                      </th>
                      <th>
                        <h4>??????</h4>
                      </th>
                      <th>
                        <h4>??????</h4>
                      </th>
                      <th>
                        <h4>????????????</h4>
                      </th>
                    </tr>
                  </thead>
                  <c:forEach items='${allproject}' var='project'>
                    <tr>
                      <!-- <td style="background-image: url(/Gather/${project.pImageCover} );
                                   background-size: cover;
                                   background-position: center;
                                   padding: 55px;"></td> -->
                      <td style="padding:0%;border:0px;"><img src="/Gather/${project.pImageCover}" style="width:239px; height: 200px;" alt=""></td>
                      <!-- <td>${project.pID}</td> -->
                      <td><a href="/Gather/showProject/${project.pID}"
                          style="font-size: larger;color: black;">${project.pName}</a></td>
                      <td>${project.pStatus}</td>
                      <td>$${project.pTarget}.NTD</td>
                      <td>
                        <div class="progress progress-md mx-4">
                          <div class="progress-bar bg-primary" role="progressbar"
                            style="width:${project.pAmountNow/project.pTarget*100}%" aria-valuenow="70"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                      </td>
                      <td>${project.pEDate}</td>
                      <td>
                      </td>

                    </tr>
                  </c:forEach>
                </table>
                <!--????????????-->


              </div>
            </section>
           
            <!----------------------------------------------------------------------->
            <!-- ??????????????? ??????-->
            <div id="changeUserPhoto" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content" style="padding: 15%;text-align: center;">
                  <h2><b>???????????????</b></h2>
                  <div class="form-group" style="margin-top:10px ;">
                    <img style="position: relative;border: 2px burlywood solid;border-radius: 50%;"
                      src="/Gather/images/Members/${memberData.id}.jpg" width="350" height="300" alt="???????????????"
                      id="showPic" class="img-rounded">
                  </div>
                  <form action="upload" method="post" enctype="multipart/form-data" class="pt-3">
                    <div class="form-group">
                      ????????????:
                      <input type="file" name="file" accept="image/*" class="form-control form-control-lg"
                        id="memberImage" />
                    </div>
                    <div class="mt-3">
                      <input type="submit" value="????????????"
                        class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
                        id="updatePhoto">
                    </div>
                  </form>


                </div>
              </div>
            </div>
            <!-- ??????????????? ??????-->

            <!-- ???????????? ??????-->
            <div id="changePassword" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content" style="padding: 15%;">
                  <h4>???????????? | Change Password</h4>
                  <div class="form-group">
                    Current Password<input type="password" id="text_old_password" class="form-control form-control-lg">
                  </div>
                  <div class="form-group">
                    New Password<input type="password" id="text_new_password" class="form-control form-control-lg">
                  </div>
                  <div class="form-group">
                    Retry Password<input type="password" id="text_check_password" class="form-control form-control-lg">
                  </div>
                  <div class="mt-3">
                    <input type="button" value="??????" id="change"
                      class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">
                  </div>
                </div>
              </div>
            </div>
            <!-- ???????????? ??????-->

            <!----------------------------------------------------------------------->
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
                          <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View,
                              San
                              Francisco, California, USA</span></li>
                          <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929
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
                      <script>document.write(new Date().getFullYear());</script> All rights reserved | Gahter
                      <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                  </div>
                </div>
              </div>
            </footer>



            <!-- loader -->
            <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
                <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
                <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                  stroke="#F96D00" />
              </svg></div>


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
            <script src="js/main.js"></script>
            <script src="/Gather/js/sweetalert2.all.min.js"></script>
            <script src="js/member-center.js"></script>
        </body>

        </html>