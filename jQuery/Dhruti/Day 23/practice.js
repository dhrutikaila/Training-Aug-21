//eq look like index applye
$(document).ready(function(){
    $("p").eq(0).css("background-color", "yellow");
  });

  //last
  $(document).ready(function(){
    $("div").last().css("background-color","#ff8080");
  });

    //first
    $(document).ready(function(){
        $("div").first().css("background-color","lightgreen");
      });

  //filter to class
  $(document).ready(function(){
    $("p").filter(".intro").css("background-color", "#ffcccc");
  });

  //not to filter
  $(document).ready(function(){
    $("p").not(".intro");
  });