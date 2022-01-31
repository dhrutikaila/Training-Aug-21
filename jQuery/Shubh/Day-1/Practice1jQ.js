$(document).ready(function()
{
    $("#para").css("background-color","skyblue"); //Exercise-1

    //Exercise-2
    $( "#helpText" ).mouseover(function() {
    $("span").hide( "slow", function() {
        // Use arguments.callee so we don't need a named function
        $( this ).prev().hide( "slow", arguments.callee );
    });
    });
    $("#helpText").mouseout(function() {
    $("span").show(2000);
    });

    //Exercise-3
    $( "input" ).on( "click", function() {
    $( "#log" ).html( $( "input:checked" ).val());
    });

});