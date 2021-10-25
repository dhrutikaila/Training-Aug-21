// * jQuery
// * Called when DOC is ready - Shorthand for $(document).ready(function(){});
$(function () {
  // * syntax: $(selector).action()

  // * 1: Selectors
  // TODO: https://www.w3schools.com/jquery/trysel.asp

  https: $("*").css({ fontSize: "20px", color: "grey" });
  $("#title").css("color", "blue");
  $("#subTitle").css("color", "lightgreen");

  // *  2: Events
  // * 3: Hide, show, Toggle, fadeIn, fadeout
  $(".btnClick").on("click", function () {
    $(".btnHide, .btnShow").toggle("slow", () => $(this).css("color", "blue"));
  });

  // ? Syntax: $(selector).hide(speed, callback);
  // ? Syntax: $(selector).show(speed, callback);
  $(".btnHide").on("dblclick", function () {
    $(this).hide(1000);
  });
  $(".btnShow").on("click", () => {
    $("button:hidden").show(1000);
  });

  // ? syntax: $(selector).fadeIn(speed,callback);
  $(".fadeToggle").on("click", function () {
    $(".fadeOut, .fadeIn").fadeToggle("slow", () =>
      $(this).css("color", "blue")
    );
  });
  $(".fadeOut").on("dblclick", function () {
    $(this).fadeOut("slow");
  });
  $(".fadeIn").on("dblclick", function () {
    $("button:hidden").fadeIn("slow");
  });
  $(".fadeTo").on("click", function () {
    $(this).fadeTo("fast", 0.3, () => $(this).css("color", "blue"));
  });

  // ? $(selector).slideUp(speed,callback);
  $(".slideToggle").on("click", function () {
    $("#slider").slideToggle("slow", () => $(this).css("color", "blue"));
  });
  // * Method Chaining
  $(".slideUp").on("click", function () {
    $("#slider").slideUp("slow").slideDown("fast");
  });

  // * 4 jQuery DOM Manipulation - text(), html(), val(), attr()
  $("#dom").text($("#subTitle").text());
  $("#dom").html("<h3>DOM Manipualtion</h3>");
  $("#dom1").html($("#dom").attr("hidden"));
  $("#dom1").html($("#dom").prop("hidden"));

  // * 5 jQuery Add Elements - append(), prepend(), after(), before(), remove(), empty()
  $("#addElement").append("sagar");
  $("#addElement").prepend("bhatt");
  $("#addElement").before("----------");
  $("#addElement").after("----------");
  $("#empty")
    .css({
      border: "1px solid black",
      width: "50px",
      height: "50px",
      padding: "10px",
      margin: "10px",
    })
    .empty();
  $("#remove")
    .css({ border: "1px solid black", width: "50px", height: "50px" })
    .remove();

  // * 6 setting CSS -css()
  $("empty").css({ color: "red" });
  console.log($("#empty").height());
  console.log($("#empty").innerHeight());
  console.log($("#empty").outerHeight());

  // * 7 iterate - $.each()
  // ? map(arr, function(elem, index) {});
  // ? each(arr, function(index, elem) {});
  const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  let str = "";
  str = "map(): <br />";
  $.map(arr, function (val, i) {
    if (val % 2 == 0) {
      str += val + `<br />`;
    }
  });
  // $("#iterate").html(str);
  str += "each():";
  $.each(arr, function (i, val) {
    str += val;
  });
  $("#iterate").html(str);
});
