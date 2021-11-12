$(function() {
    $("#change").click(function() {
			console.log('mail')
    })            

	var wait = function() {
		if (condition) {
			// run when condition is met 
		}
		else {
			setTimeout(check, 1000); // check again in a second 
		}
	}
	$(document).ready(function() {
		$("#send").click(function() {
			var mail = $("#mail").val();
			console.log(mail)

			if ($.trim(mail) == '') {
				alert('不得為空');
				(this).focus;
				return;
			}
			var params = {
				"account": '' + mail
			};
			console.log('debug1:params' + params[0]);

			$.ajax({
				type: 'post',
				url: 'http://localhost:8080/Gather/api/forgotPassword',
				contentType: 'application/json',
				data: JSON.stringify(params),
				success: function(data) {
					console.log("Success:" + data);
					if (data == 'Y') {
						//$("#accountsp").html('登入成功');
						Swal.fire({
							position: 'center',
							title: '成功寄出',
							text: '請前往您的信箱收信',
							icon: 'success',
							showConfirmButton: false
						})
						setTimeout(function() {
							$("#div2").hide()
							$(location).attr('href', '/Gather/');
						}, 1500);


					}

					if (data == 'N') {
						Swal.fire({
							position: 'center',
							title: '寄出失敗',
							text: '請確認信箱是否正確',
							icon: 'error',
							showConfirmButton: true
						})
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
		});
	})

    $(document).ready(function() {
		$("#change").click(function() {
			var new_password = $("#new_password").val();
            var new_password_again = $("#new_password_again").val();
			

			if ($.trim(new_password) == ''|
               $.trim(new_password_again) == '' ) {
				alert('不得為空');
				(this).focus;
				return;
			}

            if ($.trim(new_password) != $.trim(new_password_again)) {
                console.log('')
                alert('必須相同!!')
                (this).focus
				return
            }

			var params = {
				"password": '' + new_password
			};

			$.ajax({
				type: 'PUT',
				url: '/Gather/api/members/changePassword',
				contentType: 'application/json',
				data: JSON.stringify(params),
				success: function(data) {
					console.log("Success:" + data);
					if (data == 'Y') {
						//$("#accountsp").html('登入成功');
						Swal.fire({
							position: 'center',
							title: '修改成功',
							text: '請使用新密碼登入',
							icon: 'success',
							showConfirmButton: false
						})
						setTimeout(function() {
							$("#div2").hide()
							$(location).attr('href', '/Gather/pages/member/login.html');
						}, 1500);


					}

					if (data == 'N') {
						Swal.fire({
							position: 'center',
							title: '修改失敗',
							text: 'Something Wrong ..?!',
							icon: 'error',
							showConfirmButton: true
						})
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
		});
	})
})