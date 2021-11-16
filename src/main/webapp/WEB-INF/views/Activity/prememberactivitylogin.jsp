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
                 <li class="nav-item"><a href="/Gather/userpage" class="nav-link">活動</a></li>




<%--                 <% Member memberData=(Member)session.getAttribute("memberData"); if --%>
<%--                   (memberData==null) {%> --%>
<!--                   <li class="nav-item"><a href="/Gather/pages/member/register.html" -->
<!--                       class="nav-link">註冊</a></li> -->
<!--                   <li class="nav-item"><a href="/Gather/pages/member/login.html" -->
<!--                       class="nav-link">登入</a></li> -->
<%--                   <%} else { if(!memberData.getStatus().equals("管理員")){ %> --%>
<!--                     <li class="nav-item"><a href="/Gather/showMemberCenter" -->
<!--                         class="nav-link">會員中心</a></li> -->
<!--                     <li class="nav-item"><a href="/Gather/showLogout" class="nav-link">登出</a> -->
<!--                     </li> -->
<%--                     <% } else{ %> --%>
<!--                       <li class="nav-item"><a href="/Gather/showMemberCenter" -->
<!--                           class="nav-link">會員中心</a></li> -->
<!--                       <li class="nav-item"><a href="/Gather/showLogout" -->
<!--                           class="nav-link">登出</a></li> -->
<!--                       <li class="nav-item"><a href="/Gather/backend" -->
<!--                           class="nav-link">管理員後台</a></li> -->

<%--                       <% }} %> --%>


<!--                         我的最愛 -->
<%--                         <c:choose> --%>
<%--                           <c:when test="${mBean.id!=null}"> --%>
<!--                             <li class="nav-item cta cta-colored"><a -->
<%--                                 href="/Gather/myFav/${mBean.id}" class="nav-link"><i --%>
<%--                                   class="fas fa-hand-holding-heart"></i>[${favCount}]</a> --%>
<!--                             </li> -->
<%--                           </c:when> --%>

<%--                         </c:choose> --%>
<!--                         購物車 -->


              </ul>
            </div>
          </div>
        </nav>
          <!-- END nav -->

          <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
            <div class="container">
              <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                  <h1 class="mb-0 bread">會員中心</h1>
                  <h1 class="mb-0 bread">Member Center</h1>
                </div>
              </div>
            </div>


            <section class="ftco-section contact-section bg-light">
              <div class="container">

                <div class="row d-flex mb-5 contact-info">
                  <div class="w-100"></div>
                  <div class="col-md-3 d-flex">
                    <!--照片顯示 開頭-->
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
                    <!--照片顯示 結尾-->
                  </div>
                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                      <h5><b>基本資料</b></h5>
                      <p><span>姓名:</span> ${memberData.name}</p>
                      <p><span>身分:</span> ${memberData.status}</p>
                    </div>
                  </div>

                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                      <h5><b>會員功能</b></h5>
                      <p><span>我的提案(#)</span> </p>
                      <p><span>贊助紀錄(#)</span> </p>
                      <p><span>活動登錄(#)</span> </p>
                    </div>
                  </div>
                  <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                      <h5><b>會員設定</b></h5>
                      <p><span>修改密碼(#)</span></p>
                      <p><span>帳號綁定(#)</span></p>
                    </div>
                  </div>
                </div>
                <!--

          <h5>意見反應</h5>
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
                <H2>我的活動登錄</H2>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>活動編號</th>
                      <th>活動名稱</th>
                      <!-- <th>計畫圖片</th> -->
                      <th>登錄時間</th>

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
                          onclick=" deleteActivityLogin(${activitylogin.activityParticipationid})">取消活動登錄</button>
                         


                        <a href="/Gather/activitylogindetail?id=${activitylogin.activityid}" class="btn btn-primary py-2 px-3">活動詳情</a>
                      </td>

                    </tr>
                  </c:forEach>
                </table>
                <!--提案結尾-->


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
                  title: '確定取消活動登錄?',
                  icon: 'question',
                  showCancelButton: true,
                }).then((result) => {

                  if (result.isConfirmed) {

                    $.ajax({
                      url: "<spring:url value='/Activity/theActivityLogin/" + deleteId+ "'/>",
                      type: "DELETE",
                      // data: { pID: pID },//前面是標籤，後面是值
                      data: {id:deleteId},//前面是標籤，後面是值
                      success: function (data) {
                        Swal.fire({
                          icon: 'success',
                          title: '取消活動登錄成功'

                        }).then((result) => {
                          if (result.isConfirmed) {
                            location.href = "<spring:url value='/memberactivitylogin'/>"
                          }

                        })
                      },
                      error: function (jqXHR, textStatus, errorThrown) {
                        alert("刪除失敗");
                      }
                    })
                  }





                  else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire({
                      icon: 'error',
                      title: '已取消刪除活動登錄'

                    })
                  }















                })














              }

            </script>

        </body>

        </html>