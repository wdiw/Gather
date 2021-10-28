<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>CRUD一次滿足</title>
		</head>

		<body>
			<h1 style="text-align: center">Gather</h1>
			<ul id="orders"></ul>
			<input type="button" value="顯示全部會員" id="viewAll">
			<input type="button" value="清除" id="clear">

			<br>新增會員:<br>
			編號:<input type="text" id="text_id"><br>
			姓名:<input type="text" id="text_name"><br>
			身分:<input type="text" id="text_status"><br>
			帳號:<input type="text" id="text_account"><br>
			密碼:<input type="text" id="text_password"><br>
			<br><input type="button" value="新增" id="add">
			<input type="button" value="用編號找會員，修改" id="change">
			<br><input type="button" value="用編號找會員，刪除" id="delete">


			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script>
				$(function () {
					//清除
					$('#clear').click(()=>$('#orders').empty());

					//查詢
					$('#viewAll').click(function () {
						$.ajax({
							type: "GET",
							url: "http://localhost:8080/Gather/api/members/",
							dataType: "json",
							success: function (data) {
								//console.log('success', response); 顯示的是array
								//為了要顯示，所以使用each拉出來
								console.log(data);
								for (var each in data) {
									$('#orders').append(
										String(data[each].mId) + "<br>"
										+ data[each].mName + "<br>"
										+ data[each].mStatus + "<br>"
										+ data[each].mAccount + "<br>"
										+ data[each].mPassword + "<br>"
									)
								}
							}
						})
					})

					//新增
					$("#add").click(function () {
						let user_name = $('#text_name').val();
						let user_status = $("#text_status").val();
						let user_account = $("#text_account").val();
						let user_password = $("#text_password").val();

						console.log(
							user_name +
							user_status +
							user_account +
							user_password
							//ok
						)

						if ($.trim(user_name) == '' |
							$.trim(user_status) == '' |
							$.trim(user_account) == '' |
							$.trim(user_password) == '') {
							alert('Can not be Empty');
							(this).focus;
							return;
						}


						var params = {
							"mName":'' + user_name,
							"mStatus" : '' +user_status,
							"mAccount": '' + user_account,
							"mPassword": '' + user_password
						};

						$.ajax({
							type: 'post',
							url: 'http://localhost:8080/Gather/api/members',
							contentType: 'application/json',
							data: JSON.stringify(params),
							success: function (data) {
								alert('成功新增')
							},
							error: function (e) {
								console.log(e);
							}
						});
					});
					
					//刪除
					$('#delete').click(function(){
						
						let id = $('#text_id').val();
						$.ajax({
							type: "DELETE",
							url: "http://localhost:8080/Gather/api/members/"+id,
							success:function(){
								alert('成功刪除');
							}
						})

					})
					
					
					//修改
					$('#change').click(function(){
						var params = {
							"mId":'' + $('#text_id').val(),
							"mName":'' + $('#text_name').val(),
							"mStatus" : '' +$('#text_status').val(),
							"mAccount": '' + $('#text_account').val(),
							"mPassword": '' + $('#text_password').val()
						};
						
						$.ajax({
							type: "PUT",
							url: "http://localhost:8080/Gather/api/members/",
							contentType: 'application/json',
							data: JSON.stringify(params),
							success: function (data) {
								alert('已成功修改')
							}

						})
					})
				})
			</script>
		</body>

		</html>