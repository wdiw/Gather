$(function() {
	var wait = function() {
		if (condition) {
			// run when condition is met 
		}
		else {
			setTimeout(check, 1000); // check again in a second 
		}
	}

	$(document).ready(function() {
		$("#login").click(function() {
			var useraccount = $("#account").val();
			var userpassword = $("#password").val();
			console.log(useraccount + userpassword)
			if ($.trim(useraccount) == '') {
				alert('不得為空');
				(this).focus;
				return;
			}
			var params = {
				"account": '' + useraccount,
				"password": '' + userpassword
			};
			console.log('debug1:params' + params[0]);

			$.ajax({
				type: 'post',
				url: 'http://localhost:8080/Gather/api/login/',
				contentType: 'application/json',
				data: JSON.stringify(params),
				success: function(data) {
					console.log("Success:" + data);
					if (data == 'Y') {
						//$("#accountsp").html('登入成功');
						Swal.fire({
							position: 'center',
							title: '登入成功',
							text: '歡迎蒞臨',
							icon: 'success',
							showConfirmButton: false
						})
						setTimeout(function() {
							$("#div2").hide()
							$(location).attr('href', '../../');
						}, 1500);


					}

					if (data == 'N') {
						$("#accountsp").html('帳號或密碼輸入錯誤，請重新輸入');
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
		});
	})
})