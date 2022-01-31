$(document).ready(function(){

    $("#searchBodyButton").focus(function(){
        $("#searchBodyId").addClass("border border-primary");
    });
    $("#searchBodyButton").focusout(function(){
        $("#searchBodyId").removeClass("border border-primary");
    });
});