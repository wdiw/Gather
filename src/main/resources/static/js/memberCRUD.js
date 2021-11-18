	//新增開始
    $("#add").click(function () {
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
            $.trim(user_password) == '' |
            $.trim(user_address) == '' |
            $.trim(user_birthday) == ''|
            $.trim(user_phone) == '') {
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
            url: '/Gather/api/members',
            contentType: 'application/json',
            data: JSON.stringify(params),
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    position: 'center',
                    title: '成功新增',
                })
                setTimeout(function () {
                    $("#div2").hide()
                    $(location).attr('href', '/Gather/showAllMember');
                }, 1500);
            },
            error: function (e) {
                console.log(e);
            }
        });
    });
    //新增結束

    //一鍵填入開始
    var data = {
        "name": "許效舜",
        "sex": "男",
        "email": "SmileEveryDay0212@gmail.com",
        "pwd": "ZA399sa",
        "phone": "0913730380",
        "birthday": "1946-05-20",
        "address": "台北市內湖區舊宗路一段159號",
    }

    $("#auto").bind("click", function () {
        $("#f").autofill(data, {
            restrict: false
        });
    });

    //一鍵填入結束


    //停權
    function suspended(suspendedId) {
        $.ajax({
            url: "/Gather/api/suspended/" + suspendedId ,
            type: 'GET',
            contentType: "application/json; charset=utf-8",
            data: {},
            success: function (data) {
                Swal.fire({
                    title: '成功',
                    icon: 'success',
                    text: "已經停權該名會員！",
                    position: 'center',

                })
                setTimeout(function () {
                    window.location.reload();
                }, 1200);
                /*
                ).then((result) => {
                     if (result.isConfirmed) {
                       location.href= "<c:url value='/members'/>";
                     }
                  })
                  */
            },
            error: function (xhr, text) {
                console.log(url);
                console.log("status code: " + xhr.status);
                console.log("error message: " + text);
                Swal.fire({
                    title: '刪除失敗',
                    icon: 'error',
                    text: "此筆ID" + $("#id").val() + "不存在，請檢查後重試！",
                })
            }
        });

    };

    //恢復
    function recovery(recoverId) {
        $.ajax({
            url: "/Gather/api/recovery/" + recoverId ,
            type: 'GET',
            contentType: "application/json; charset=utf-8",
            data: {},
            success: function (data) {
                Swal.fire({
                    title: '成功',
                    icon: 'success',
                    text: "已經復權該名會員！",
                    position: 'center',

                })
                setTimeout(function () {
                    window.location.reload();
                }, 1200);
                /*
                ).then((result) => {
                     if (result.isConfirmed) {
                       location.href= "<c:url value='/members'/>";
                     }
                  })
                  */
            },
            error: function (xhr, text) {
                console.log(url);
                console.log("status code: " + xhr.status);
                console.log("error message: " + text);
                Swal.fire({
                    title: '刪除失敗',
                    icon: 'error',
                    text: "此筆ID" + $("#id").val() + "不存在，請檢查後重試！",
                })
            }
        });

    };





