$(document).ready(function () {
    $('.col-md-3').hover(function () {
      $(this).animate({
        marginTop: "-1%"
      }, 200);
    },
      function () {
        $(this).animate({
          marginTop: "0"
        }, 200);
      })
  })