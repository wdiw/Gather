$(function () {
    //新增
    $("#add").click(function () {
        let user_name = $('#text_name').val();
        let user_account = $("#text_account").val();
        let user_password = $("#text_password").val();
        let user_birthday = $("#text_birthday").val();
        let user_address = $("#text_address").val();
        if(document.getElementsByName('sex')[0].checked){
            var user_sexual = '男';
        }else{
            var user_sexual = '女';
        }

        console.log(
            "姓名"+
            user_name +"帳號"+
            user_account +"密碼"+
            user_password +"生日"+
            user_birthday +"地址"+
            user_address+"性別"+user_sexual
            //ok
        )

        if ($.trim(user_name) == '' |
            $.trim(user_account) == '' |
            $.trim(user_password) == ''|
            $.trim(user_address) == ''|
            $.trim(user_birthday) == '') {
            alert('全為必填，不得空白!!');
            (this).focus;
            return;
        }


        var params = {
            "name": '' + user_name,
            "account": '' + user_account,
            "password": '' + user_password,
            "address": '' + user_address,
            "sexual": '' + user_sexual,
            "birthday": '' + user_birthday
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