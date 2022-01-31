$(document).ready(function()
{
    //filtering with class
    $("p").filter(".intro").css("background-color", "yellow");

    //child element
    $("button").click(function(){
        $("div").contents().filter("em").wrap("<b/>");
      });
    
    //parent offset
    $("#click").click(function(){
        $("#click").offsetParent().css("background-color", "forestgreen");
      });

    //siblings
    $("li.start").siblings().css({"color": "forestgreen", "border": "2px solid red"});

    //ancestors
    $("span").parent().css({"color": "red", "border": "2px solid red"});

    //descendants
    $("div").find("span").css({"color": "blue", "border": "2px solid green"});

    //filtering
    $("#last").first().css("background-color", "skyblue");


});