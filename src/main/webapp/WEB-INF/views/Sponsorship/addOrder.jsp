<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js">
</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
fieldset {
	border: 1px solid rgb(110, 104, 96);
	width: 800px;
	margin: auto;
	background-color: ivory;
	text-align: center;
}

* {
	text-align: center;
}

body {
	line-height: 50px;
}

h2 {
	color: rgb(110, 104, 96);
}

label, img {
	font-size: 20px;
	text-align: center;
	color: rgb(110, 104, 96);
}
</style>
<title>Add Orders</title>
</head>
<body>

	<section>
		<div class="container">
			<h2 style="position: relative">
				新增訂單資料 <a href="<c:url value='/' />"><button
						style="position: relative; left: 465px; width: 80px; height: 25px; font-size: 15px">回首頁</button>
				</a>
			</h2>
		</div>
		<hr>

		<form id="form" class='form-horizontal' enctype="multipart/form-data">
			<fieldset>

				<div class="form-group">
					<label class="control-label col-sm-2" for='sName'> 贊助者 </label>
					<div class="col-sm-10">
						<input id="sName" name="sName" type='text' class='st1'
							placeholder="請輸入贊助者名稱" />
					</div>
				</div>



				<div class="form-group">
					<label class="control-label col-sm-2" for="sPID"> 專案編號 </label>
					<div class="col-sm-10">
						<input id="sPID" name="sPID" type='text' class='st1'
							placeholder="請輸入專案編號" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="sPName"> 專案名稱 </label>
					<div class="col-sm-10">
						<input id="sPName" name="sPName" type='text' class='st1'
							placeholder="請輸入專案名稱" />
					</div>
				</div>



				<div class="form-group">
					<label class="control-label col-sm-2" for="sAmount"> 贊助金額 </label>
					<div class="col-sm-10">
						<input id="sAmount" name="sAmount" type='text' class='st1'
							placeholder="請輸入贊助金額" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="projectImage">
						上傳圖片 </label>
					<div class="col-sm-10">
						<input id="projectImage" name="projectImage" type='file'
							class='st1' />
					</div>
				</div>
				<div class="form-group">
					<div class="control-label col-sm-2">
						<img style="position: relative; left: 250px;src=" " width="350"
							height="300" alt="請選擇照片" id="showPic" class="img-rounded">
					</div>

					<div class="form-group">

						<div class="col-sm-offset-2 col-sm-10">
							<button id="btnAdd" type='submit' class='btn btn-primary'
								name="submit" style="position: relative; right: 50px">送出</button>
						</div>

					</div>
			</fieldset>
		</form>
	</section>
	<!-- 	<script > -->
	<!-- 	</script> -->
	<script>
	var pic;
		$('#projectImage').change(function() {
			var projectImage = $("#projectImage")[0].files[0];
			var reader = new FileReader;	
			reader.onload = function(e) {
				$('#showPic').attr('src', e.target.result);
				pic=e.target.result;
// 				console.log(e.target.result);
			}
			reader.readAsDataURL(projectImage);
			console.log(projectImage);
		})
//         var x = new FileReader;
//         var src;
//         document.forms[0].elements[5].onchange = function() {
//             x.readAsDataURL(this.files[0]);
//         }
//         x.onloadend = function() {
//             src = this.result;
//             document.images[0].src = src;
//         }

        var form = document.getElementById("form");
        $("#form").on("submit", function(e){
            /* =====for formData&MultipartFile =====*/
            var formData = new FormData(form);
            
            /* =====for JSON =====*/
            
            var html = "";
            var inputData = $(".st1").slice(0, 5);
            // html += + "name" + $("#name").val() + "<br/>";
            for (let i = 0; i < inputData.length; i++) {
                let name = inputData.eq(i).attr("name");
                let value = (inputData.eq(i).val() != "") ? inputData.eq(i).val() : "無";
                html += name+": "+value+"</br>";
            }
            console.log(html);
            
            //改用ajax傳送 棄用原本的form傳送
            e.preventDefault();
            
       	
           
            Swal.fire({
                title: '您確定要送出嗎？',
                icon: 'question',
                html: html,
                imageUrl: pic,
                imageWidth: 400,
                imageHeight: 200,
                showCancelButton: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type:"post",
                        url:"orders",
                        data: formData,
        //                 data: json,
        //                 dataType:"json",
        //                 contentType: "application/json; charset=utf-8",
                        contentType: false, //required
                        processData: false, // required
                        /*一定要加*/
                        mimeType: 'multipart/form-data', //有圖片就要加這行
                        /*一定要加*/
                        success: function(data){
                            var jsonData = JSON.parse(data);
                            console.log("Success:" + "\sID:" +jsonData.sID + "\sName:" +jsonData.sName) ;

                            var html1 = "";
                            for (const key in jsonData) {
                                let val = (jsonData[key] != "") ? jsonData[key] : "無";
                                if (!(key == "image" || key == "base64String")) {
//                                 console.log(key);
//                                 console.log(jsonData[key]);
                                    html1 += key+": "+val;
                                    html1 += "<br/>";
                                } 
//                                 else if (key == "base64String"){
//                                     html += "<img src='data:image;base64,"+jsonData.base64String+"'/>";
//                                 }
                            };
                            // console.log(html);

                            Swal.fire({
                                title: '已新增成功！',
                                icon: 'success',
                            })
                                    
                        },
                        error: function(e, text){
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
        })
    </script>
</body>
</html>