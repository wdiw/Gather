<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.Gather.member.entity.Member" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="images/favicon.png" />
    <title>會員中心</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/templatemo-digimedia-v2.css">
    <!--
  -->
    
<!--

TemplateMo 568 DigiMedia

https://templatemo.com/tm-568-digimedia

-->
  </head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- Pre-header Starts -->
  <!--
    
    <div class="pre-header">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-sm-8 col-7">
            <ul class="info">
              <li><a href="#"><i class="fa fa-envelope"></i>digimedia@company.com</a></li>
              <li><a href="#"><i class="fa fa-phone"></i>010-020-0340</a></li>
            </ul>
          </div>
          <div class="col-lg-4 col-sm-4 col-5">
            <ul class="social-media">
              <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-behance"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
-->
  <!-- Pre-header End -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="./" class="logo">
              <img src="assets/images/logo-v2.svg" alt="">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
              <li class="scroll-to-section"><a href="#about">About</a></li>
              <li class="scroll-to-section"><a href="#portfolio">Projects</a></li>
              <li class="scroll-to-section"><a href="#Blog">Forum</a></li>
              <%
					Member memberData= (Member)session.getAttribute("memberData");
					if (memberData == null) {
					%>
              	  <li class="scroll-to-section"><a href="pages/member/register.html">Register</a></li> 
            	  <li class="scroll-to-section"><div class="border-first-button"><a href="pages/member/login.html">Login</a></div></li> 
            	  					<%
					} else {
						
						if(!memberData.getStatus().equals("管理員")){%>
							<li class="scroll-to-section"><a href="showMemberCenter">MemberCenter</a></li>
							<a href="showLogout"><button class="btn btn-outline-danger" type="button">Logout</button></a>
						<%}else%>
							<li class="scroll-to-section"><a href="showMemberCenter">MemberCenter</a></li>
							<a href="showLogout"><button class="btn btn-outline-danger" type="button">Logout</button></a>
						<a href="backend">
						<button class="btn btn-outline-warning" type="button">Admin</button>
						</a>
							
					<%
					}
					%>
            </ul>        
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->
  <!-- 網頁內容開始，要改的地方-->
  
  <div id="services" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h6>Member Center</h6>
            <h4>會員中心</h4>
            <img src="/Gather/images/Members/${memberData.id}.jpg" style="width: 15%;border-radius: 20%;"><br><br>

            <h6>
              <em>
              您:${memberData.name}
              身分為${memberData.status}
              </em>
            </h6>
            <div class="line-dec">


            </div>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="naccs">
            <div class="grid">
              <div class="row">
                <div class="col-lg-12">
                  <div class="menu">
                    <div class="first-thumb active">
                      <div class="thumb">
                        <span class="icon"><img src="assets/images/service-icon-01.png" alt=""></span>
                        我的提案
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/service-icon-02.png" alt=""></span>
                        上傳大頭貼&amp;
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/service-icon-03.png" alt=""></span>
                        修改會員資料
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/service-icon-04.png" alt=""></span>
                        我的贊助
                      </div>
                    </div>
                    <div class="last-thumb">
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/service-icon-01.png" alt=""></span>
                        討論區
                      </div>
                    </div>
                  </div>
                </div> 
                <div class="col-lg-12">
                  <ul class="nacc">
                    <li class="active">
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>文章區塊</h4>
                                <p>這邊可以輸入一段文章</p>
                                <div class="ticks-list"><span><i class="fa fa-check"></i> Optimized Template</span> <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span>
                                  <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span> <span><i class="fa fa-check"></i> Optimized Template</span></div>
                                <p>這裡輸入另外一段文字</p>
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/services-image.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Healthy Food &amp; Life</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedr do eiusmod deis tempor incididunt ut labore et dolore kengan darwin doerski token.
                                  dover lipsum lorem and the others.</p>
                                <div class="ticks-list"><span><i class="fa fa-check"></i> Optimized Template</span> <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span>
                                  <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span> <span><i class="fa fa-check"></i> Optimized Template</span></div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedr do eiusmod deis tempor incididunt.</p>
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/services-image-02.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Car Re-search &amp; Transport</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedr do eiusmod deis tempor incididunt ut labore et dolore kengan darwin doerski token.
                                  dover lipsum lorem and the others.</p>
                                <div class="ticks-list"><span><i class="fa fa-check"></i> Optimized Template</span> <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span>
                                  <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span> <span><i class="fa fa-check"></i> Optimized Template</span></div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedr do eiusmod deis tempor incididunt.</p>
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/services-image-03.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Online Shopping &amp; Tracking ID</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedr do eiusmod deis tempor incididunt ut labore et dolore kengan darwin doerski token.
                                  dover lipsum lorem and the others.</p>
                                <div class="ticks-list"><span><i class="fa fa-check"></i> Optimized Template</span> <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span>
                                  <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span> <span><i class="fa fa-check"></i> Optimized Template</span></div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedr do eiusmod deis tempor incididunt.</p>
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/services-image-04.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-6 align-self-center">
                              <div class="left-text">
                                <h4>Enjoy &amp; Travel</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedr do eiusmod deis tempor incididunt ut labore et dolore kengan darwin doerski token.
                                  dover lipsum lorem and the others.</p>
                                <div class="ticks-list"><span><i class="fa fa-check"></i> Optimized Template</span> <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span>
                                  <span><i class="fa fa-check"></i> Data Info</span> <span><i class="fa fa-check"></i> SEO Analysis</span> <span><i class="fa fa-check"></i> Optimized Template</span></div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedr do eiusmod deis tempor incididunt.</p>
                              </div>
                            </div>
                            <div class="col-lg-6 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/services-image.jpg" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>          
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2022 DigiMedia Co., Ltd. All Rights Reserved. 
          <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a>
          <br>Distributed By: <a href="https://themewagon.com" target="_blank" title="free css templates">ThemeWagon</a>
        </p>
        </div>
      </div>
    </div>
  </footer>


  <!-- Scripts -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/custom.js"></script>

</body>
</html>