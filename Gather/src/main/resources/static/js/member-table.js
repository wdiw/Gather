$(function () {
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
                    "<tr>"+
                    "<td class=py-1>"+
                    `<img src='../../images/Members/${String(data[each].id)}.jpg'`+"</td>"+
                    "<td>"+ data[each].id + "</td>"+
                    "<td>"+ data[each].name + "</td>"+
                    "<td>"+ data[each].status + "</td>"+
                    "<td>"+ data[each].account + "</td>"+
                    "<td>"+ data[each].password + "</td>"+
                    "</tr>"
                )
            }
        }

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