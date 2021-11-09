$(function () {

    var data = {
        "name": "簡慕槐",
        "sex": "男",
        "email": "ChillSeph0729@gmail.com",
        "pwd": "0729ChillSeph",
        "phone": "09123456789",
        "birthday": "1996-05-20",
        "address": "桃園市中壢區中大路520號14樓",
        "checkbox_checked": 1,
    }

    $("#auto").bind("click", function () {
        $("#f").autofill(data, {
            restrict: false
        });
    });




})