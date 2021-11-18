<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <!-- note: 最新 -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Gather</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/Gather/vendors/feather/feather.css">
  <link rel="stylesheet" href="/Gather/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="/Gather/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/Gather/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/Gather/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="/Gather/images/logo.svg" alt="logo">
              </div>
              
              <h4>會員 "${memberData.name}" 歡迎回來!</h4>
              <h6 class="font-weight-light">讓我們重新設定密碼</h6>
              <form class="pt-3">
                <div class="form-group">
                  新密碼
                  <input type="text" class="form-control form-control-lg" id="new_password" placeholder="New Password">
                </div>
                <div class="form-group">
                  再次輸入
                  <input type="password" class="form-control form-control-lg" id="new_password_again" placeholder="New Password Again">
                </div>
                <div class="mt-3">
                  <!--登入按鈕在這-->
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="change">送出</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="/Gather/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->

  <script src="/Gather/js/off-canvas.js"></script>
  <script src="/Gather/js/hoverable-collapse.js"></script>
  <script src="/Gather/js/template.js"></script>
  <script src="/Gather/js/settings.js"></script>
  <script src="/Gather/js/todolist.js"></script>
  <script src="/Gather/js/jquery-3.6.0.js"></script>
  <script src="/Gather/js/login.js"></script>
  <script src="/Gather/js/sweetalert2.all.min.js"></script>
  <script src="/Gather/js/forgotPassword.js"></script>
  <!-- endinject -->
</body>

</html>
