$(function(){
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