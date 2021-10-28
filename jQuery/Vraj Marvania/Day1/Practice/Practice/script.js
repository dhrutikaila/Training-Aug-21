// jQuery Selectors
// The element Selector
$(document).ready(function () {
  console.log($("p").text());
});
// The #id Selector
$(document).ready(function () {
  console.log($("#h1").text());
});
// The class Selector
$(document).ready(function () {
  console.log($(".h2").text());
});

$(document).ready(function () {
  // Selects all elements
  console.log($("*"));

  //this
  console.log($(this).text());

  // Selects the first <p> element
  console.log($("p:first").text());

  // Selects the first <li> element of the first <ul>
  console.log($("ul li:first").text());

  //Selects the first <li> element of every <ul>
  console.log($("ul li:first-child").text());

  console.log($("[href]"));

  console.log($(":button").text());
  // Selects all <button> elements and <input> elements of type="button"

  // Selects all even <tr> elements

  console.log($("tr:even").text());
  // Selects all odd <tr> elements

  console.log($("tr:odd").text());
});

// tag.class
$(document).ready(function () {
  $("#button").click(function () {
    $("p.intro").hide();
  });
});

// jQuery Event Methods---------------------------->
$(document).ready(function () {
  $("#btn").click(function () {
    console.log("onclick");
  });
});

$(document).ready(function () {
  $("#btn1").dblclick(function () {
    console.log("dblclick");
  });
});

$(document).ready(function () {
  $("#btn2").mouseleave(function () {
    console.log("mouseleave");
  });
});

$(document).ready(function () {
  $("#btn3").mousedown(function () {
    console.log("mousedown");
  });
});

// hover()
$(document).ready(function () {
  $("#btn4").hover(function () {
    console.log("hover");
  });
});
// focus()
// blur()
$(document).ready(function () {
  $("input").focus(function () {
    $(this).css("background-color", "yellow");
  });
  $("input").blur(function () {
    $(this).css("background-color", "green");
  });
});

// The on() Method

// $(document).ready(function(){
//     $("p").on("click", function(){
//       $(this).hide();
//     });
//   });

//   jQuery Effects - Hide and Show

$(document).ready(function () {
  $("#hide").click(function () {
    $("p").hide(1000);
  });
  $("#show").click(function () {
    $("p").show(500);
  });
});

//   toggle
//   $(document).ready(function(){
//     $("button").click(function(){
//       $("p").toggle();
//     });
//   });

//   jQuery Effects - Fading
$(document).ready(function () {
  $("#out").click(function () {
    $("#div1").fadeIn();
    $("#div2").fadeIn("slow");
    $("#div3").fadeIn(3000);
  });
});

$(document).ready(function () {
  $("#in").click(function () {
    $("#div1").fadeOut();
    $("#div2").fadeOut("slow");
    $("#div3").fadeOut(3000);
  });
});

$(document).ready(function () {
  $("#toggle").click(function () {
    $("#div1").fadeToggle();
    $("#div2").fadeToggle("slow");
    $("#div3").fadeToggle(3000);
  });
});
//   jQuery Effects - Sliding
$(document).ready(function () {
  $("#flip").click(function () {
    $("#panel").slideDown("slow");
  });
});

$(document).ready(function () {
  $("#flipup").click(function () {
    $("#panel").slideUp("slow");
  });
});

$(document).ready(function () {
  $("#fliptoggle").click(function () {
    $("#panel").slideToggle("slow");
  });
});

//   jQuery DOM Manipulation

// Get Content - text(), html(), and val()

$(document).ready(function () {
  console.log($("p").text());
  console.log($("#check").html());
  console.log($("#test").val());
});

//   Get Attributes - attr()
// $(document).ready(function(){
//     $("button").click(function(){
//     console.log($("#w3s").attr());
//     });
//   });

// set Content - text(), html(), and val()
$(document).ready(function () {
  $("#demo1").text("add text");
  $("#demo2").html("<b>add html</b>");
  $("#demo3").val("add val");
});

//   Set Attributes - attr()
$(document).ready(function () {
  $("#demo2").attr({});
});

$(document).ready(function () {
  $("#w3ss").attr({
    href: "https://www.w3schools.com/jquery/",
    title: "W3Schools jQuery Tutorial",
  });
});

//   jQuery - Add Elements
// prepend & append
$(document).ready(function () {
  $("ol").append("<li>hello</li>");
  $("ol").prepend("<li>pre</li>");
});

// after & before
$(document).ready(function () {
  $("ol").before("<h1>before</h1>");
  $("ol").after("<h1>after</h1>");
});

//    jQuery - Remove Elements
$(document).ready(function () {
  $("#emp").click(function () {
    $("#div11").empty();
  });
});
$(document).ready(function () {
  $("#rem").click(function () {
    console.log("inn");
    $("#div22").remove();
  });
});

//   jQuery - Get and Set CSS Classes
// removeclass
// addclass
// Toggleclass

$(document).ready(function () {
  $("#removeclass").click(function () {
    console.log("in");

    $("h1, h2, p").removeClass("blue");
  });
  $("#addclass").click(function () {
    $("h1, h2, p").addClass("blue");
    console.log("in");
  });
  $("#Toggleclass").click(function () {
    $("h1, h2, p").toggleClass("blue");
    console.log("in");
  });
});

//   jQuery - css() Method

// Return a CSS Property
$(document).ready(function () {
  console.log($("#Toggleclass").css("color"));
  $("#Toggleclass").css("background-color", "blue");
  $("#addclass").css({"background-color": "yellow", "font-size": "200%"});


});



// jQuery Misc each() Method
$(document).ready(function(){
    $("li").each(function(){
        console.log(this)
      });
});