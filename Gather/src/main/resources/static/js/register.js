$(function () {
    //新增
    $("#add").click(function () {
        let user_name = $('#text_name').val();
        let user_account = $("#text_account").val();
        let user_password = $("#text_password").val();

        console.log(
            user_name +
            user_account +
            user_password
            //ok
        )

        if ($.trim(user_name) == '' |
            $.trim(user_account) == '' |
            $.trim(user_password) == '') {
            alert('Can not be Empty');
            (this).focus;
            return;
        }


        var params = {
            "name": '' + user_name,
            "account": '' + user_account,
            "password": '' + user_password
        };

        $.ajax({
            type: 'post',
            url: 'http://localhost:8080/Gather/api/register',
            contentType: 'application/json',
            data: JSON.stringify(params),
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    position: 'center',
                    title: '成功註冊',
                })
                setTimeout(function(){
                	$("#div2").hide()
              	    $(location).attr('href', '../../');
               	}, 1500);
            },
            error: function (e) {
                console.log(e);
            }
        });
    });

})