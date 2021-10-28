// jQuery Traversing

$(document).ready(function(){
    // parent()
    $("span").parent().css({"color": "red", "border": "2px solid red"});
    // parents
    $("span").parents("ul").css({"color": "red", "border": "2px solid red"}); //for all parent
    // parentsUntil
    $("li").parentsUntil("body").css({"color": "red", "border": "2px solid red"});

});


// jQuery Traversing - Descendants

$(document).ready(function(){
    // children
    $("div").children().css({"color": "red", "border": "2px solid red"});
    // find
    $("div").find("span").css({"color": "red", "border": "2px solid red"});

});


// jQuery Traversing - Siblings
$(document).ready(function(){
        // siblings
        $("h2").siblings().css({"color": "red", "border": "2px solid red"});
        //  next
         $("h2").next().css({"color": "red", "border": "2px solid red"});
        //  nextAll
         $("h2").nextAll().css({"color": "red", "border": "2px solid red"});
        //  nextUntil
         $("h2").nextUntil("p").css({"color": "red", "border": "2px solid red"});
        //  prev
         $("h2").prev().css({"color": "red", "border": "2px solid red"});
        //  prevAll
         $("h2").prevAll().css({"color": "red", "border": "2px solid red"});
        //  prevUntil
         $("h2").prevUntil("div").css({"color": "red", "border": "2px solid red"});

});


// jQuery Traversing - Filtering
$(document).ready(function(){
         // first()
         $("p").first().css({"color": "red", "border": "2px solid red"});
        //  last()
         $("p").last().css({"color": "red", "border": "2px solid red"});
        //  eq()
         $("p").eq("1").css({"color": "red", "border": "2px solid red"});
        //  filter()
         $("p").filter(".p4").css({"color": "red", "border": "2px solid red"});
        //  not()
         $("p").not(".p4").css({"color": "red", "border": "2px solid red"});

});