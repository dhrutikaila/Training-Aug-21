

$(document).ready(function () {
    $('#name,#class,#country').focus(function () {
        $(this).css('background-color', 'gray')
    })

    $('#name,#class,#country').blur(function () {
        $(this).css('background-color', '')
    })

    $('#country').change(function () {
        $(this).css('background-color', 'red')
    })

    $('#country').change(function () {
        var a = $(this).val();
        $('#demo').html(a)
    })

    $('#name,#class').select(function () {
        $(this).css('background-color', 'blue')
    })

    $('#form1').submit(function(){
        alert("form submited")
    })

    $('#name').val("piyush")
    $('#class').val("12th")


})