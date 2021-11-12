$(function () {
    //立即顯示上傳大頭貼
    $('#memberImage').change(function() {
        console.log('heyyyy')
        var memberImage = $("#memberImage")[0].files[0];
        var reader = new FileReader;
        reader.onload = function(e) {
            $('#showPic').attr('src', e.target.result);
        }
        reader.readAsDataURL(memberImage);
    })

    //修改密碼
    $('#change').click(function () {
        var params = {
            "password": '' + $('#text_new_password').val()
        };

        $.ajax({
            type: "PUT",
            url: "/Gather/api/members/changePassword",
            contentType: 'application/json',
            data: JSON.stringify(params),
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    position: 'center',
                    title: '成功修改，請使用新密碼重新登入'
                })
                setTimeout(function () {
                    $("#div2").hide();
                    $(location).attr('href', '/Gather/pages/member/login.html');
                }, 2000);
            }
            

        })
    })
})