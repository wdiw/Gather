<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <link rel="stylesheet" type="text/css" href="/Gather/style.css">
        <meta charset="UTF-8">
        <title>會員設定</title>
        <style>
            .btn-outline-light {
                color: #5B4B00;
                background-color: #cebfa0;
                border-color: #5B4B00;
            }

            .btn-outline-light:hover,
            .btn-outline-light:focus,
            .btn-outline-light:active:hover {
                color: #4b4b2a;
                background-color: #caca92;
                border-color: #c9c969;
            }

            body {
                background-color: rgba(214, 204, 191, 0.767);
                line-height: 50px;
            }

            h2 {
                background-color: whitesmoke;
                color: rgb(110, 104, 96);
            }

            tr {
                text-align: center;
            }

            td {
                background-color: whitesmoke;
                ;
            }
        </style>
    </head>

    <body>
        <h1>修改密碼</h1>

        舊密碼:<input type="password" id="text_old_password"><br>
        新密碼:<input type="password" id="text_new_password"><br>
        確認新密碼:<input type="password" id="text_check_password"><br>
        <input type="button" value="提交" id="change">
        <a href="./"><input type="button" value="回到首頁"></a>
        


        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script>
            $(function () {

                //修改
                $('#change').click(function () {
                    var params = {
                        "password": '' + $('#text_new_password').val()
                    };

                    $.ajax({
                        type: "PUT",
                        url: "http://localhost:8080/Gather/api/members/changePassword",
                        contentType: 'application/json',
                        data: JSON.stringify(params),
                        success: function (data) {
                            alert('已成功修改')
                        }

                    })
                })
            })
        </script>
    </body>

    </html>