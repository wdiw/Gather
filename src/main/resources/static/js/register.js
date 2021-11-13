$(function () {
    //驗證
    //  $("button").mousedown(function () {
    //     $("p").slideToggle();
    // });
    $('#f').validate({
        /* 常用檢測屬性
       required:必填
       noSpace:空白
       minlength:最小長度
       maxlength:最大長度
       email:信箱格式
       number:數字格式
       url:網址格式https://www.minwt.com
       */
        onkeyup: function (element, event) {
            //去除左側空白
            var value = this.elementValue(element).replace(/^\s+/g, "");
            $(element).val(value);
        },
        rules: {
            name: {
                required: true
            },
            sex: 'required',
            email: {
                required: true,
                email: true
            },
            pwd: {
                required: true,
                minlength: 6
            },
            phone: {
                required: true,
                minlength: 8,
                number: true
            },
            address: 'required',
            birthday: 'required',
            checkbox_checked: 'required',
            url: {
                url: true
            }

        },
        messages: {
            name: {
                required: '必填'
            },
            sex:'必填',
            birthday:'必填',
            checkbox_checked:'請閱讀',
            email: {
                required: '必填',
                email: 'Email格式不正確'
            },
            pwd: {
                required: '必填',
                minlength: '不得少於6位數'
            },
            phone: {
                required: '必填',
                minlength: '不得少於8位',
                number: '電話需為數字'
            },
            address: '必填',

            url: '網址格式不正確'
        },
        submitHandler: function (f) {

            let user_name = $('#text_name').val();
            let user_account = $("#text_account").val();
            let user_password = $("#text_password").val();
            let user_birthday = $("#text_birthday").val();
            let user_address = $("#text_address").val();
            let user_phone = $("#text_phone").val();
            if (document.getElementsByName('sex')[0].checked) {
                var user_sexual = '男';
            } else {
                var user_sexual = '女';
            }

            console.log(
                "姓名" +
                user_name + "帳號" +
                user_account + "密碼" +
                user_password + "生日" +
                user_birthday + "地址" +
                user_address + "性別" +
                user_sexual + "電話" +
                user_phone
                //ok
            )

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
                url: 'http://localhost:8080/Gather/api/register',
                contentType: 'application/json',
                data: JSON.stringify(params),
                success: function (data) {
                    Swal.fire({
                        icon: 'success',
                        position: 'center',
                        title: '認證信已寄出',
                    })
                    setTimeout(function () {
                        $("#div2").hide();
                        //跳轉到信箱認證頁面
                        $(location).attr('href', './mail.html');
                    }, 1500);
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }
    });

   
})