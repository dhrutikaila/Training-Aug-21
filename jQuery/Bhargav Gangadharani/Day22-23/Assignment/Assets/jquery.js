$(document).ready(function () {
    var arr = ["India", "USA", "UK", "Russia", "UAE"];

    $.each(arr, function (item) {
        console.log(arr[item])
        $("select").append($("<option Value='" + arr[item] + "'></option>").text(arr[item]));

    })


    $("#countryName").click(function () {
        if ($("#countryName").val() == "blank") {
            $("#result").html("<ul type = none><li>India</li><li>USA</li><li>UK</li><li>Russia</li><li>UAE</li></ul>")
        }
        else {
            $("li").hide();
            $("#result").html("Your Selected Country is: "+$(this).val());
        }
    });
});

