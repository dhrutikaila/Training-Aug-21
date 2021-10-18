$(document).ready(function () {
  //button click event by botton type
  $("#button1").click(function () {
    //id selector
    $("#test").hide();
  });
  $("#button2").click(function () {
    //element selector
    $("h2").hide();
  });
  $("#button3").click(function () {
    //class selector
    $(".container").hide();
  });
  //current element using this
  $("#button4").click(function () {
    //class selector
    $(this).hide();
  });
  //double click event
  $("p").dblclick(function () {
    $(this).hide();
  });
  //mouse enter method
  $("#test").mouseenter(function () {
    console.log("You entered test!");
  });
  //mouse leave
  $("#test").mouseleave(function () {
    console.log("Bye! You now leave test!");
  });
  //mouse down(clicked) on element
  $("#test").mousedown(function () {
    console.log("Mouse down over test!");
  });
  //mouse up(released) on element
  $("#test").mouseup(function () {
    console.log("Mouse up over test!");
  });
  //mouse hover on element
  $("#test").hover(
    function () {
      console.log("Mouse hover over test!");
    },
    function () {
      console.log("Bye! You now leave test!");
    }
  );
  //focus input
  $("input").focus(function () {
    $(this).css("background-color", "yellow");
  });
  //input blur method
  $("input").blur(function () {
    $(this).css("background-color", "red");
  });
  //on method
  $("#p").on("click", function () {
    $(this).hide();
  });

  //jQuery Effects

  //we already used hide
  //show method
  $("#button5").click(function () {
    $("#test").show();
  });

  //hide with parameter
  $("#button6").click(function () {
    $("p").hide(1000);
  });

  //toggle
  $("#button7").click(function () {
    $("p").toggle(1000);
  });
  //fadein method
  $("#button8").click(function () {
    $("#button2").fadeIn();
    $("#button3").fadeIn("slow");
    $("#button4").fadeIn(3000);
  });

  //fadeout method
  $("#button9").click(function () {
    $("#button2").fadeOut();
    $("#button3").fadeOut("slow");
    $("#button4").fadeOut(3000);
  });

  //fadeToggle method
  $("#button10").click(function () {
    $("#button2").fadeToggle();
    $("#button3").fadeToggle("slow");
    $("#button4").fadeToggle(3000);
  });

  //fadeTo method
  $("#button11").click(function () {
    $("#button2").fadeTo();
    $("#button3").fadeTo("slow");
    $("#button4").fadeTo(3000);
  });

  //jQuery DOM Manipulation

  //text
  $("#button12").click(function () {
    console.log("Text: " + $("#test").text());
    $("#test").text("Hello world!");
    $("#test").text(function (i, origText) {
      return (
        "Old text: " + origText + " New text: Hello world! (index: " + i + ")"
      );
    });
  });

  //html
  $("#button13").click(function () {
    console.log("HTML: " + $("#test").html());
    $("#test").html("<b>Hello world!</b>");
    $("#test").text(function (i, origText) {
      return (
        "Old html: " +
        origText +
        " New html: Hello <b>world!</b> (index: " +
        i +
        ")"
      );
    });
  });

  //value
  $("#button14").click(function () {
    console.log("Value: " + $("#name").val());
    $("#name").val("hello dhruvit ");
  });

  //attr
  console.log("attribute is" + $("#button9").attr("class"));

  //append text
  $("#button15").click(function () {
    $("#appending").append(" <b>Appended text</b>.");
  });
  //prepend text
  $("#button16").click(function () {
    $("#prepending").prepend(" <b>Prepend text</b>.");
  });

  //after
  $("#button17").click(function () {
    var txt1 = "<b>Hello </b>"; // Create element with HTML
    var txt2 = $("<i></i>").text("World & "); // Create with jQuery
    var txt3 = document.createElement("b"); // Create with DOM
    txt3.innerHTML = "jQuery!";
    $("#after").after(txt1, txt2, txt3);
  });

  //before
  $("#button18").click(function () {
    var txt1 = "<b>Hello </b>"; // Create element with HTML
    var txt2 = $("<i></i>").text("World & "); // Create with jQuery
    var txt3 = document.createElement("b"); // Create with DOM
    txt3.innerHTML = "jQuery!";
    $("#before").before(txt1, txt2, txt3);
  });
  //remove
  $("#button19").click(function () {
    $("#remove").remove();
  });
  //empty
  $("#button20").click(function () {
    $("#empty").empty();
  });

  //css
  $("#button21").click(function () {
    $("#css").css({ "background-color": "yellow", "font-size": "200%" });
  });

  //example
  $("<button></button>")
    .text("getvalue")
    .click(function () {
      alert("Hello world");
    })
    .appendTo("body");
  $("h1").text("Greeting of the day");
  $("alist 11").each(function (index, element) {
    console.log(element);
  });

  // var jsondata = [
  //   { ID: 12, Name: "Dhruvit", LastName: "Diyora" },
  //   { ID: 22, Name: "Diyora", LastName: "Dhruvit" },
  // ];
  // $each(jsondata, function (index, value) {
  //   $("#tbldata").append(
  //     $("ctr></tr>")
  //       .append($("<td></td>").text(value.ID))
  //       .append($("<td></td>").text(value.Name))
  //   );
  // });
});

function myfun() {
  $("<button></button>")
    .text("secondbutton")
    .click(function () {
      alert("Hello world");
    })
    .appendTo("body");
  $("<p></p>").html("<b>welcome</b>").appendTo("body");

  $("h1").text("First");

  $("h2").text("2nd");
}
