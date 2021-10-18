$(document).ready(function () {
  //jQuery Traversing - Ancestors
  //parent()
  $("#span").parent().css({ color: "red", border: "2px solid red" });

  //parents()
  $(".span").parents().css({ color: "green", border: "2px solid green" });
  $(".span").parents("ul").css({ color: "blue", border: "2px solid blue" });

  //parentsUntil()
  $("#until")
    .parentsUntil("div")
    .css({ color: "black", border: "2px solid black" });
  $("#until")
    .parentsUntil("#util")
    .css({ color: "black", border: "2px solid black" });

  //Descendants
  //children()

  $("div").children("p.first").css({ color: "red", border: "2px solid red" });

  //find()
  $("div").find("span").css({ color: "red", border: "2px solid red" });

  //filtering
  //first
  $("div").first().css("background-color", "yellow");

  //last
  $("div").last().css("background-color", "blue");

  //eq()
  $("p").eq(1).css("background-color", "red");

  //filter
  $("p").filter(".second").css("background-color", "violet");

  //not
  $("p").not("#span").css("background-color", "blue");

  //jQuery - AJAX
  //load
});
