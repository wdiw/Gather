<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js">
</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Gather Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="../vendors/feather/feather.css">
  <link rel="stylesheet" href="../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="../vendors/select2/select2.min.css">
  <link rel="stylesheet" href="../vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="../../index.html"><img src="../images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="../../index.html"><img src="../images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-success">
                    <i class="ti-info-alt mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-warning">
                    <i class="ti-settings mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Settings</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Private message
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">New user registration</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="/Gather/images/Members/${memberData.id}.jpg"data-toggle="dropdown" id="profileDropdown">
              <img src="/Gather/images/Members/${memberData.id}.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="/Gather/showMemberCenter">
                <i class="ti-settings text-primary"></i>
                Settings
              </a>
              <a class="dropdown-item" href="/Gather/showLogout">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
          <li class="nav-item nav-settings d-none d-lg-flex">
            <a class="nav-link" href="#">
              <i class="icon-ellipsis"></i>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      <div id="right-sidebar" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
          </li>
        </ul>
        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <form class="form w-100">
                <div class="form-group d-flex">
                  <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                  <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                </div>
              </form>
            </div>
            <div class="list-wrapper px-3">
              <ul class="d-flex flex-column-reverse todo-list">
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Team review meeting at 3.00 PM
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Prepare for presentation
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Resolve all the low priority tickets due today
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      Schedule meeting for next week
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      Project review
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
              </ul>
            </div>
            <h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary mr-2"></i>
                <span>Feb 11 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
              <p class="text-gray mb-0">The total number of sessions</p>
            </div>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary mr-2"></i>
                <span>Feb 7 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
              <p class="text-gray mb-0 ">Call Sarah Graves</p>
            </div>
          </div>
          <!-- To do section tab ends -->
          <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
            <div class="d-flex align-items-center justify-content-between border-bottom">
              <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
              <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
            </div>
            <ul class="chat-list">
              <li class="list active">
                <div class="profile"><img src="../../images/faces/face1.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Thomas Douglas</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">19 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face2.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <div class="wrapper d-flex">
                    <p>Catherine</p>
                  </div>
                  <p>Away</p>
                </div>
                <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                <small class="text-muted my-auto">23 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face3.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Daniel Russell</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">14 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face4.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <p>James Richardson</p>
                  <p>Away</p>
                </div>
                <small class="text-muted my-auto">2 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face5.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Madeline Kennedy</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">5 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face6.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Sarah Graves</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">47 min</small>
              </li>
            </ul>
          </div>
          <!-- chat tab ends -->
        </div>
      </div>
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="/Gather/backend">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Member</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">會員管理</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Activity</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">全部活動</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">Sponsorship</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="orders">訂單管理</a></li>
                <li class="nav-item"> <a class="nav-link" href="addorder">新增訂單</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">Projects</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/tables/basic-table.html">專案管理</a></li>
              </ul>
            </div>
          </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="<spring:url value='/Forum/queryAll' />" aria-expanded="false" aria-controls="icons">
              <i class="icon-contract menu-icon"></i>
              <span class="menu-title">討論區</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<spring:url value='/Forum/queryAll' />">全部文章</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      
      
      
      <div class="table-responsive">
      <table class="table table-hover">
      
    	<thead>
    		<tr>
    			<th>文章編號</th>
				<th>文章標題</th>
				<th>文章內容</th>
				<th>發文時間</th>
				<th>最後修改時間</th>
				<th>回覆數</th>
			</tr>
		</thead>
		<c:forEach items='${AllForum}' var='forum' >
			<tr>
<!-- 			<tr onclick="test()" > -->
<%-- 			<tr onclick='location.href="<c:url value='/Forum/detail?id=${forum.id}' />"' > --%>
<%-- 			value='/Project/project?pID=${project.pID}' --%>
				<td>缺分類${forum.id}</td>
				<td style="">
<%-- 				<td onclick='location.href="<c:url value='/Forum/detail?id=${forum.id}' />"' > --%>
					<div style="width:100%;white-space:normal;word-wrap:break-word;word-break:break-all;cursor: pointer;">
<%-- 					${forum.name} --%>
						<a href="<c:url value='/Forum/detail?id=${forum.id}' />" style="color:black;" >${forum.name}</a>
					</div>
				</td>
				<td onMouseOver="this.style.backgroundColor='pink';" onMouseOut="this.style.backgroundColor='';">
					<div id="content" class="showcontent" style="width:100%;white-space:normal;word-wrap:break-word;word-break:break-all;cursor: pointer;" 
					onMouseOver="this.style.backgroundColor='orange';" 
					onMouseOut="this.style.backgroundColor='';">
					${forum.post}
<!-- 					<button onclick="init()">全文</button> -->
					</div>
				</td>
				<td>
				發文者:會員or管理員<br>
				${forum.postTime}
				</td>
				<td>${forum.postUpdateTime}</td>
				<td>回覆數123</td>
<!-- 				<td> -->
<%-- 					<a href="<c:url value='/Forum/adDelete' />" class="btn btn-primary">編輯</a> --%>
<%-- 					<a href="<c:url value='/Forum/adDelete' />" class="btn btn-primary">文章刪除</a> --%>
<!-- 					<button type="button" id="update" class="btn btn-inverse-warning btn-fw" -->
<%-- 					onclick='location.href="<c:url value='/Forum/detail?id=${forum.id}' />"'>詳細資料</button> --%>
<%-- 					<a href="<c:url value='/Forum/adUpdate' />" class="btn btn-primary">文章修改</a><br><br> --%>
<!-- 				</td> -->
			</tr>
		</c:forEach>
	</table>
	</div>
	
    <div align='center'>
    	<br>
<%--     	<a href="<c:url value='/Forum/add1' />" class="btn btn-primary">測試</a><br><br> --%>
<%--     	<a href="<c:url value='/Forum/adMain' />" class="btn btn-primary">發表文章</a><br><br> --%>
    	<a href="<c:url value='/Forum/add' />" class="btn btn-primary">發表文章add</a><br><br>
    	<a href="<c:url value='/Forum/adDelete' />" class="btn btn-primary">文章刪除</a><br><br>
    	<a href="<c:url value='/Forum/adUpdate' />" class="btn btn-primary">文章修改</a><br><br>
    	<a href="<c:url value='/Forum/queryAll' />" class="btn btn-primary">回討論區</a><br><br>
    	<a href="<c:url value='/' />" class="btn btn-primary">回首頁</a><br><br>
    </div>
    
    <script>
    	function test() {
    		alert("Hello world");
    	}
//     	$(document).ready(function(){
    		
    	function init(){
            var len = 20; //預設要顯示的字數
//             var ctn = document.getElementById("content");  //获取div对象
//             var ctn = null;
            var ctn = document.getElementsByClassName("showcontent"); //获取div对象
//             for (i=0;i<ctn.length;i++){
            	
//             ctn = document.getElementsByClassName("showcontent")[i];  //获取div对象
            ctn = document.getElementsByClassName("showcontent")[0];  //获取div对象
//             var ctn = document.getElementsByClassName("showcontent").getElementsByTagName("p");  //获取div对象
            var content = ctn.innerHTML;                   //获取div里的内容
            //alert(content);
            var span = document.createElement("span");     //创建<span>元素
            var a = document.createElement("a");           //创建<a>元素
            span.innerHTML = content.substring(0,len);     //span里的内容为content的前len个字符
            a.innerHTML = content.length>len?" 展開全文":"";  //判断显示的字数是否大于默认显示的字数 来设置a的显示
            a.href = "javascript:void(0)"; //让a链接点击不跳转
            a.onclick = function(){
                if(a.innerHTML.indexOf("全文")>0){      //如果a中含有"全文"则显示"收起"
                  a.innerHTML = "收起";
                  span.innerHTML = content;
                }else{
                    a.innerHTML = " 展開全文";
                    span.innerHTML = content.substring(0,len);
                }
            }
            // 设置div内容为空，span元素 a元素加入到div中
            ctn.innerHTML = "";
            ctn.appendChild(span);
            ctn.appendChild(a);
//             } //for
         }
    	init();
    		
    	function init2(){
            var len = 20; //預設要顯示的字數
//             var ctn = document.getElementById("content");  //获取div对象
//             var ctn = null;
            var ctn = document.getElementsByClassName("showcontent"); //获取div对象
//             for (i=0;i<ctn.length;i++){
            	
//             ctn = document.getElementsByClassName("showcontent")[i];  //获取div对象
            ctn = document.getElementsByClassName("showcontent")[1];  //获取div对象
//             var ctn = document.getElementsByClassName("showcontent").getElementsByTagName("p");  //获取div对象
            var content = ctn.innerHTML;                   //获取div里的内容
            //alert(content);
            var span = document.createElement("span");     //创建<span>元素
            var a = document.createElement("a");           //创建<a>元素
            span.innerHTML = content.substring(0,len);     //span里的内容为content的前len个字符
            a.innerHTML = content.length>len?" 展開全文":"";  //判断显示的字数是否大于默认显示的字数 来设置a的显示
            a.href = "javascript:void(0)"; //让a链接点击不跳转
            a.onclick = function(){
                if(a.innerHTML.indexOf("全文")>0){      //如果a中含有"全文"则显示"收起"
                  a.innerHTML = "收起";
                  span.innerHTML = content;
                }else{
                    a.innerHTML = " 展開全文";
                    span.innerHTML = content.substring(0,len);
                }
            }
            // 设置div内容为空，span元素 a元素加入到div中
            ctn.innerHTML = "";
            ctn.appendChild(span);
            ctn.appendChild(a);
//             } //for
         }
    	init2();
    	
//     	}) //$(document).ready(function(){
    </script>
    
</body>
</html>
    