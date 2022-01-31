$(document).ready(function () {
    $(".p1").css("background-color", "blue");

    $("#helpText").mouseenter(function () {
        $(this).hide();
    });

    $("#helpText").mouseleave(function () {
        $(this).show();
    });

    $("input[type=radio]").click(
        function () {
            var tech = $('input[type="radio"]:checked').val();
            $(".result").html("Selected Technology is: " +tech);
        }
    );
});