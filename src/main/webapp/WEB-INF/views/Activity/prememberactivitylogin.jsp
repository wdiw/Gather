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
          <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        </head>

        <body class="goto-here">
          <div class="py-1 bg-black">
            <div class="container">
              <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
                <div class="col-lg-12 d-block">
                  <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                      <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                          class="icon-phone2"></span></div>
                      <span class="text"></span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center">
                      <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                          class="icon-paper-plane"></span></div>
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
                <li class="nav-item"><a href="/Gather/allposts" class="nav-link">Blog</a></li>
                 <li class="nav-item"><a href="/Gather/userpage" class="nav-link">??????</a></li>




<%--                 <% Member memberData=(Member)session.getAttribute("memberData"); if --%>
<%--                   (memberData==null) {%> --%>
<!--                   <li class="nav-item"><a href="/Gather/pages/member/register.html" -->
<!--                       class="nav-link">??????</a></li> -->
<!--                   <li class="nav-item"><a href="/Gather/pages/member/login.html" -->
<!--                       class="nav-link">??????</a></li> -->
<%--                   <%} else { if(!memberData.getStatus().equals("?????????")){ %> --%>
<!--                     <li class="nav-item"><a href="/Gather/showMemberCenter" -->
<!--                         class="nav-link">????????????</a></li> -->
<!--                     <li class="nav-item"><a href="/Gather/showLogout" class="nav-link">??????</a> -->
<!--                     </li> -->
<%--                     <% } else{ %> --%>
<!--                       <li class="nav-item"><a href="/Gather/showMemberCenter" -->
<!--                           class="nav-link">????????????</a></li> -->
<!--                       <li class="nav-item"><a href="/Gather/showLogout" -->
<!--                           class="nav-link">??????</a></li> -->
<!--                       <li class="nav-item"><a href="/Gather/backend" -->
<!--                           class="nav-link">???????????????</a></li> -->

<%--                       <% }} %> --%>


<!--                         ???????????? -->
<%--                         <c:choose> --%>
<%--                           <c:when test="${mBean.id!=null}"> --%>
<!--                             <li class="nav-item cta cta-colored"><a -->
<%--                                 href="/Gather/myFav/${mBean.id}" class="nav-link"><i --%>
<%--                                   class="fas fa-hand-holding-heart"></i>[${favCount}]</a> --%>
<!--                             </li> -->
<%--                           </c:when> --%>

<%--                         </c:choose> --%>
<!--                         ????????? -->


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
                  <div class="w-100"></div>
                  <div class="col-md-3 d-flex">
                    <!--???????????? ??????-->
                    <div class="carousel-testimony owl-carousel ftco-animate">
                      <div class="item">
                        <div class="testimony-wrap">
                          <div class="user-img mb-4"
                            style="background-image: url(/Gather/images/Members/${memberData.id}.jpg)">
                            <span class="quote d-flex align-items-center justify-content-center">
                              <i class="icon-quote-left"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!--???????????? ??????-->
                  </div>
                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                      <h5><b>????????????</b></h5>
                      <p><span>??????:</span> ${memberData.name}</p>
                      <p><span>??????:</span> ${memberData.status}</p>
                    </div>
                  </div>

                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                      <h5><b>????????????</b></h5>
                      <p><span>????????????(#)</span> </p>
                      <p><span>????????????(#)</span> </p>
                      <p><span>????????????(#)</span> </p>
                    </div>
                  </div>
                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                      <h5><b>????????????</b></h5>
                      <p><span>????????????(#)</span></p>
                      <p><span>????????????(#)</span></p>
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
                <H2>??????????????????</H2>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>????????????</th>
                      <th>????????????</th>
                      <!-- <th>????????????</th> -->
                      <th>????????????</th>

                    </tr>
                  </thead>
                  <c:forEach items='${activitylogins}' var='activitylogin'>
                    <tr>
                      <td>${activitylogin.activityid}</td>
                      <td>${activitylogin.activityname}</td>
                      <!-- <td><img width='50' height='50'
                    src="../${project.pImageCover}"
                    class="img-rounded" /></td> -->
                      <td>${activitylogin.logintime}</td>


                      <td>
                        <button id="deleteActivityLogin" class="btn btn-primary py-2 px-3"
                          onclick=" deleteActivityLogin(${activitylogin.activityParticipationid})">??????????????????</button>
                         


                        <a href="/Gather/activitylogindetail?id=${activitylogin.activityid}" class="btn btn-primary py-2 px-3">????????????</a>
                      </td>

                    </tr>
                  </c:forEach>
                </table>
                <!--????????????-->


              </div>
            </section>
            <section class="ftco-gallery ftco-section ftco-no-pb">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-8 heading-section text-center mb-4 ftco-animate">
                    <h2 class="mb-4">Follow Us On Instagram</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there
                      live the
                      blind texts. Separated they live in</p>
                  </div>
                </div>
              </div>
              <div class="container-fluid px-0">
                <div class="row no-gutters">
                  <div class="col-md-4 col-lg-2 ftco-animate">
                    <a href="images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center"
                      style="background-image: url(images/gallery-1.jpg);">
                      <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                      </div>
                    </a>
                  </div>
                  <div class="col-md-4 col-lg-2 ftco-animate">
                    <a href="images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center"
                      style="background-image: url(images/gallery-2.jpg);">
                      <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                      </div>
                    </a>
                  </div>
                  <div class="col-md-4 col-lg-2 ftco-animate">
                    <a href="images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center"
                      style="background-image: url(images/gallery-3.jpg);">
                      <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                      </div>
                    </a>
                  </div>
                  <div class="col-md-4 col-lg-2 ftco-animate">
                    <a href="images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center"
                      style="background-image: url(images/gallery-4.jpg);">
                      <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                      </div>
                    </a>
                  </div>
                  <div class="col-md-4 col-lg-2 ftco-animate">
                    <a href="images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center"
                      style="background-image: url(images/gallery-5.jpg);">
                      <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                      </div>
                    </a>
                  </div>
                  <div class="col-md-4 col-lg-2 ftco-animate">
                    <a href="images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center"
                      style="background-image: url(images/gallery-6.jpg);">
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

            <script>

              function deleteActivityLogin(deleteId) {

           


                Swal.fire({
                  title: '?????????????????????????',
                  icon: 'question',
                  showCancelButton: true,
                }).then((result) => {

                  if (result.isConfirmed) {

                    $.ajax({
                      url: "<spring:url value='/Activity/theActivityLogin/" + deleteId+ "'/>",
                      type: "DELETE",
                      // data: { pID: pID },//??????????????????????????????
                      data: {id:deleteId},//??????????????????????????????
                      success: function (data) {
                        Swal.fire({
                          icon: 'success',
                          title: '????????????????????????'

                        }).then((result) => {
                          if (result.isConfirmed) {
                            location.href = "<spring:url value='/memberactivitylogin'/>"
                          }

                        })
                      },
                      error: function (jqXHR, textStatus, errorThrown) {
                        alert("????????????");
                      }
                    })
                  }





                  else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire({
                      icon: 'error',
                      title: '???????????????????????????'

                    })
                  }















                })














              }

            </script>

        </body>

        </html>