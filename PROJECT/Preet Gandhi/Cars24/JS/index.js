//Select City in modal
$(document).ready(function(){
  $(document).on("click",".city",function(){
    var selectCity = $("#selectedCity");
    selectCity.text($(this).attr("value"));
    console.log($(this).attr("value"))
  })
})
// Other Cities (Modal)
$(document).ready(function () {
  $.getJSON("http://127.0.0.1:5500/cities.json", function (result) {
      console.log(result.cities);
      $.each(result.cities, function (index, value) {
          $(".otherCities").append($(`<li class="p-2 m-2 border border-secondary rounded city" data-bs-dismiss="modal"
          value=${value}>${value}
      </li>`));
      })
  })
})


// slick slider
$(document).ready(function(){
    $('.slick-slider').slick({
        dots: false,
        arrows: true,
        speed: 600,
        slidesToShow: 4,
        slidesToScroll: 1,
        infinite: true,
        prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
        nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>",
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 1,
              infinite: true,
              dots: false
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
        ]
    });
    $('.slick-slider2').slick({
      dots: false,
      arrows: true,
      speed: 600,
      slidesToShow: 2.5,
      slidesToScroll: 1,
      infinite: false,
      prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
      nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>",
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1,
            infinite: true,
            dots: false
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
  });
  });


// onload function
function loading() {
  console.log (JSON.parse(localStorage.getItem("login")));
  if(JSON.parse(localStorage.getItem("login"))){
    console.log (JSON.parse(localStorage.getItem("login")));
    $("#loginButton").text("LogOut");
  }
}

