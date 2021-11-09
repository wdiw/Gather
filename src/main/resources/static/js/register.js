$(function () {


   
    /*
    setTimeout(function(){
        $("#div2").hide()
        //跳轉到信箱認證頁面
          $(location).attr('./mail.html');
       }, 1500)
       setTimeout();
       */
    //新增
    $("#add").click(function () {
        let user_name = $('#text_name').val();
        let user_account = $("#text_account").val();
        let user_password = $("#text_password").val();
        let user_birthday = $("#text_birthday").val();
        let user_address = $("#text_address").val();
        let user_phone = $("#text_phone").val();
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
            user_address+"性別"+
            user_sexual+"電話"+
            user_phone
            //ok
        )

        if ($.trim(user_name) == '' |
            $.trim(user_account) == '' |
            $.trim(user_password) == ''|
            $.trim(user_address) == ''|
            $.trim(user_birthday) == ''|
            $.trim(user_phone) == ''
            ) {
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
            "birthday": '' + user_birthday,
            "phone": '' + user_phone
        };

        $.ajax({
            type: 'post',
            url: '/Gather/api/register',
            contentType: 'application/json',
            data: JSON.stringify(params),
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    position: 'center',
                    title: '認證信已寄出',
                })
                setTimeout(function(){
                	$("#div2").hide();
                    //跳轉到信箱認證頁面
                    $(location).attr('href', './mail.html');
               	}, 1500);
            },
            error: function (e) {
                console.log(e);
            }
        });
    });
    


  
    $("#valid").click(function (){
        let code = $('#six_digit_code').val();
        console.log(code) // ok

        if ($.trim(code) == '' ){
            alert('不得空白!!');
            (this).focus;
            return;
        }


        $.ajax({
            type: 'get',
            url: '/Gather/api/register/'+code,
            success: function (data) {
                if(data == "Y"){
                    Swal.fire({
                        icon: 'success',
                        position: 'center',
                        title: '驗證碼正確，成功註冊!!',
                    })
                    setTimeout(function(){
                        $("#div2").hide();
                        //跳轉到信箱認證頁面
                        $(location).attr('href', '/Gather');
                       }, 1500);
                }else{
                    Swal.fire({
                        icon: 'error',
                        position: 'center',
                        title: '驗證碼錯誤',
                    })
                }


            },
            error:function () {
                alert("連線失敗失敗")
            }
        })

    })
})