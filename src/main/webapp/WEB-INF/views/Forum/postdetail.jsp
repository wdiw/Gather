<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <head>
    <title>Minishop - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    
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
						    <span class="text"></span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text"></span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">3-5 Business days delivery &amp; Free Returns</span>
					    </div>
				    </div>
			    </div>
		    </div> -->
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
						id="ftco-navbar">
						<div class="container">
							<img style="margin-left:10px;" width="130px" height="100px"  src="/Gather/images/G.png">
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

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
<!--           	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span></p> -->
            <h1 class="mb-0 bread">Gather討論區</h1>
          </div>
        </div>
      </div>
    </div>

		<section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ">
            
            <!-- 內文 -->
            <h1 class="mb-3">[${forum.postCategory}] ${forum.name}</h1>
            
            <!-- 文章資訊 -->
            <div class="about-author d-flex p-4 bg-light">
              <div class="desc align-self-md-center">
<%--                 分類 : ${forum.postCategory}<br> --%>
                作者 : ${forum.poster}<br>
                時間 : ${forum.postTime}
              </div>
            </div>
            
            <!-- 文章編號只是給送出留言的按鈕抓所以設隱藏 -->
            <div class="form-group" style="display:none;">
            <label>文章編號</label>
            <input name="id" id="id" class="form-control" value="${forum.id}" disabled >
            </div>
            
            <p>${forum.post}</p>
            <div class="tag-widget post-tag-container mb-5 mt-5">
<!--               <div class="tagcloud"> -->
<!--                 <a href="#" class="tag-cloud-link">Life</a> -->
<!--                 <a href="#" class="tag-cloud-link">Sport</a> -->
<!--                 <a href="#" class="tag-cloud-link">Tech</a> -->
<!--                 <a href="#" class="tag-cloud-link">Travel</a> -->
<!--               </div> -->
            </div>
            
            <button type='button' id="updateButton" name='updateButton' 
            class="btn btn-primary mr-2" onclick="location.href='<c:url value='/postupdate?id=${forum.id}' />';">更新文章</button>
            
            <button type='button' id="deleteButton" name='deleteButton' 
            class="btn btn-danger" onclick="deleteButton(${forum.id})">刪除文章</button>
            
            <button type='button' id="returnButton" name='returnButton' 
            class="btn btn-primary mr-2" onclick='location.href="<c:url value='/allposts' />"'>回討論區</button>
            
            
            <br><br>            
            
            <!-- 作者 -->
<!--             <div class="about-author d-flex p-4 bg-light"> -->
<!--               <div class="bio align-self-md-center mr-4"> -->
<!--                 <img src="images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4"> -->
<!--               </div> -->
<!--               <div class="desc align-self-md-center"> -->
<%--                 <h3>Lance Smith${forum.poster}</h3> --%>
<!--                 <p>自介啦自介啦自介啦自介啦自介啦自介啦自介啦自介啦</p> -->
<!--               </div> -->
<!--             </div> -->


            <!-- 所有留言 -->
            <div class="pt-5 mt-5">
              <h1 class="mb-5">所有留言</h1>
              
              <ul class="comment-list">
              
              <c:forEach items='${AllForumComments}' var='forumcomments'>
              <li class="comment">
<!--                   <div class="vcard bio"> -->
<%--                   <a class="nav-link dropdown-toggle" href="/Gather/images/Members/${memberData.id}.jpg"  --%>
<!--                   data-toggle="dropdown" id="profileDropdown"> -->
<%--                   <img src="/Gather/images/Members/${memberData.id}.jpg" alt="profile"/> --%>
<!--                   </a> -->
<!--                     <img src="images/person_1.jpg" alt="Image placeholder"> -->
<!--                   </div> -->
                  <div class="comment-body">
                    <h3>${forumcomments.forumcommenter}</h3>
                    <div class="meta">${forumcomments.forumcommentTime}</div>
                    <p>${forumcomments.forumcomment}</p>
<!--                     <p><a href="#" class="reply">Reply</a></p> -->
                  </div>
                  <div class="comment-body delbtn">
              <button type='button' id="deleteCommentButton" name='deleteCommentButton' 
              class="btn btn-danger" onclick="deleteCommentButton(${forumcomments.forumcommentID})">刪除留言</button>
                  </div>              
              </li>
              </c:forEach>
              
              </ul>
              <!-- END comment-list -->
              
              <!-- 留言區 -->
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">新增留言</h3>
<%--                 <form action="#" class="p-5 bg-light"> --%>
<!--                   <div class="form-group"> -->
<!--                     <label for="name">Name *</label> -->
<!--                     <input type="text" class="form-control" id="name"> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <label for="email">Email *</label> -->
<!--                     <input type="email" class="form-control" id="email"> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <label for="website">Website</label> -->
<!--                     <input type="url" class="form-control" id="website"> -->
<!--                   </div> -->

<!--                   <div class="form-group"> -->
<!--                     <label for="message">Message</label> -->
<!--                     <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary"> -->
<!--                   </div> -->
                  <div class="p-5 bg-light">
                  
                  <div class="form-group" style="display: none;">
                  <label>留言ID</label>
                  <textarea id="forumcommentID" name="forumcommentID" 
                  class="form-control"></textarea>
                  </div>
                  
                  <div class="form-group">
<%--                   <a class="nav-link dropdown-toggle" href="/Gather/images/Members/${memberData.id}.jpg"  --%>
<!--                   data-toggle="dropdown" id="profileDropdown"> -->
<%--                   <img src="/Gather/images/Members/${memberData.id}.jpg" alt="profile"/> --%>
<!--                   </a> -->
                  <label for="message">留言</label>
                  <textarea id="forumcomment" name="forumcomment" cols="30" rows="10" 
                  class="form-control" placeholder="請輸入留言"></textarea>
                  </div>
                  
                  <div class="form-group">
                  <button type='submit' id="addcomment" name='addcomment'
                  class="btn py-3 px-4 btn-primary">送出留言</button>
                  </div>
                  
                  </div>
<%--                 </form> --%>
                
              </div> <!-- 留言區 -->
              
            </div> <!-- 全部留言 -->
          </div> <!-- 文章 -->
          
          <!-- 側邊列表 -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <a id="search" style="cursor: pointer;"><span class="icon ion-ios-search"></span></a>
                  <input type="text" class="form-control" id="searchvalue" placeholder="輸入文章標題">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
            	<h3 CLASS="heading">Categories</h3>
              <ul class="categories">
                <li><a href="<spring:url value='/allposts'/>">全部</a></li>
                <li><a href="<spring:url value='/postcategory?postCategory=公告'/>">公告</a></li>
                <li><a href="<spring:url value='/postcategory?postCategory=問題'/>">問題</a></li>
                <li><a href="<spring:url value='/postcategory?postCategory=討論'/>">討論</a></li>
                <li><a href="<spring:url value='/postcategory?postCategory=心得'/>">心得</a></li>
              </ul>
            </div>

<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3 CLASS="heading">Recent Blog</h3> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->

<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3 CLASS="heading">Tag Cloud</h3> -->
<!--               <div class="tagcloud"> -->
<!--                 <a href="#" class="tag-cloud-link">shop</a> -->
<!--                 <a href="#" class="tag-cloud-link">products</a> -->
<!--                 <a href="#" class="tag-cloud-link">shirt</a> -->
<!--                 <a href="#" class="tag-cloud-link">jeans</a> -->
<!--                 <a href="#" class="tag-cloud-link">shoes</a> -->
<!--                 <a href="#" class="tag-cloud-link">dress</a> -->
<!--                 <a href="#" class="tag-cloud-link">coats</a> -->
<!--                 <a href="#" class="tag-cloud-link">jumpsuits</a> -->
<!--               </div> -->
<!--             </div> -->

<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3 class="heading">Paragraph</h3> -->
<!--               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p> -->
<!--             </div> -->
          </div>

        </div>
      </div>
    </section> <!-- .section -->


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  
  <script>
	
  	//登入身分
    var mStatus = "${sessionScope.memberData.status}"//取得會員身分
    var mID = "${sessionScope.memberData.id}"//取得會員身分
    var form = document.getElementById("form") 
    
    if (mStatus !== "") {
    	//已登入
    	if ( mStatus == "管理員" ) {
    		//管理員
    		$("#updateButton").hide();
    		$("#deleteButton").show();
    		$(".delbtn").show();
    	} else {
    		
    		//會員
	    	if ( mID == "${forum.posterID}" ) {
	    		//是發文人
	    		$("#updateButton").show();
	    		$("#deleteButton").show();
	    		$(".delbtn").show();
	    		
	    	} else {
	    		//不是發文人
	    		$("#updateButton").hide();
	    		$("#deleteButton").hide();
	    		$(".delbtn").hide();
	    	}
    	}
    } else {
    	//未登入
    	$("#updateButton").hide();
    	$("#deleteButton").hide();
    	$(".delbtn").hide();
    }
    
    
    //留言輸入框
    $(document).ready(function(){
  
      $('#forumcomment').summernote({
        placeholder: '請輸入留言',
        tabsize: 2,
        height: 100,
      });
      
    });
    
    
    //搜尋
    $('#search').click(function() {
        var searchvalue = $('#searchvalue').val(); //用變數searchvalue放輸入的東西
  //	    alert(searchvalue); //測試是否抓到輸入的東西
        location.href=  "<spring:url value='/searchresults?searchvalue=" + searchvalue + "'/>" //跳轉進@GetMapping對應的方法，也是網址
                         //@GetMapping對應網址 ? 方法的@RequestParam對應的參數，這裡就是@RequestParam("searchvalue")
                             
    })
    
    
    
          
    //刪除文章按鈕
    function deleteButton(id) {
    	Swal.fire({
    		
    		title: '確定刪除?', 
    		text: "你將刪除此文章!",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonText: '刪除!',
              cancelButtonText: '取消!',
  // 						reverseButtons: true
            }).then((result) => {
              if (result.isConfirmed) {
  
                var url = "<spring:url value='/postdetail/" + id + "'/>";
  
                $.ajax({
                  url: url,
                  type: 'DELETE',
                  data: {},
                  
                  success: function (data) {
                    Swal.fire({
                      position: 'center',
                      icon: 'success',
                      title: '刪除成功',
                      timerProgressBar: true,
                      showConfirmButton: false,
                    })
                    location.href = "<spring:url value='/allposts'/>";
                  },
                  error: function (xhr, text) {
  // 									swalWithBootstrapButtons.fire(
                    Swal.fire(
                      '失敗', 
                      '刪除失敗，請確認 ', 
                      'error'
                    )
                  }
                })
              
              } else if (
                result.dismiss === Swal.DismissReason.cancel
              ) {
                Swal.fire(
                  '取消',
                  '已取消刪除 ',
                  'success'
                )
              }
            })
          } //function deletebtn(id)  
    
    
    
          
    //刪除留言按鈕
    function deleteCommentButton(forumcommentID) {
    	
    	Swal.fire({
    		
    		title: '確定刪除?', 
    		text: "你將刪除此留言!",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonText: '刪除!',
              cancelButtonText: '取消!',
            }).then((result) => {
              if (result.isConfirmed) {
  
                var url = "<spring:url value='/Forum/deleteforumcomment/" + forumcommentID + "'/>";
                
                $.ajax({
                  url: url,
                  type: 'delete',
                  data: {},
                  
                  success: function (data) {
                    Swal.fire({
                      position: 'center',
                      icon: 'success',
                      title: '刪除成功',
//                       timerProgressBar: true,
                      showConfirmButton: false,
                    })
                    location.href = "<spring:url value='/postdetail?id=" + ${forum.id} + "'/>";
                  },
                  error: function (xhr, text) {
  // 									swalWithBootstrapButtons.fire(
                    Swal.fire(
                      '失敗', 
                      '刪除失敗，請確認 ', 
                      'error'
                    )
                  }
                })
              
              } else if (
                result.dismiss === Swal.DismissReason.cancel
              ) {
                Swal.fire(
                  '取消',
                  '已取消刪除 ',
                  'success'
                )
              }
            }) //then((result) 
          } //function deleteCommentButton(id)  
    
    
    
            //送出留言
            $("#addcomment").click(function() { //對應button的id屬性值addcomment
  // 						alert("!!!");
              var forumcomment = $('#forumcomment').val(); //抓id屬性值為forumcomment的value屬性值
              var id = $('#id').val(); //抓id屬性值為id的value屬性值
              
              if (mStatus == "") {
            	  //未登入
            	  Swal.fire({
            		  title: '請先登入會員',
            		  text: "即將跳轉至登入頁面!",
            		  icon: 'warning',
            	  }).then((result) => {
            		  location.href= "<spring:url value='/pages/member/login.html'/>";
            	  })
            	  
            	  
              } else {
            	  //已登入
                    Swal.fire({
                        title: '您確定要送出嗎？',
  // 							text:forumcomment, //測試是否抓到輸入的東西
                        icon: 'question',
                        showCancelButton: true,
  //			                 closeOnConfirm: true,
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                type:"post", //對應@PostMapping
                                url:"<spring:url value='/Forum/addforumcomment'/>", //對應@PostMapping
                                data:{forumcomment:forumcomment,id:id},	//?		                       
                    
                                success: function(data){
                                    Swal.fire({
                                      title: '已新增成功！',
                                      icon: 'success',
                                    }).then((result)=>{
                                      if (result.isConfirmed) {
  // 			                            		location.href= "<spring:url value='/Forum/detail/" + id + "'/>";
                                        location.href= "<spring:url value='/postdetail?id=" + ${forum.id} + "'/>";
                                      }
                                    })
                                    
                                },
                                error: function(e, text){
                                  
                                  Swal.fire({
                                      title: '新增失敗！請先登入會員!',
                                      icon: 'error',
                                    })
                                  
                                    console.log(e.status);
                                    console.log(text);
                                }
                            })
                        } else if (result.dismiss === Swal.DismissReason.cancel) {
                            Swal.fire({
                                icon: 'error',
                                title: '已取消送出請求',
                                text: '您的變更將不會被儲存!'
                            })
                        }
                    })
              }   
             }) //$("#addbtn").click(function
            
        </script>
    
  
  
    
  </body>
</html>