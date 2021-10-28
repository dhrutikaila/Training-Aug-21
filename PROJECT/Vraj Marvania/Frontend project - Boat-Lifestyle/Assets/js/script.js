
//   open nav
  function openNav() {
    document.getElementById("vnav").style.width = "82%";
    document.getElementById("closenav").style.width = "100%";
    document.getElementById("closenav").style.height = "100%";

}

function funclose()
{
    $("#moredrop").removeClass("show");
}

$(document).ready(function () {

    // footer
    $("h5#shoptogg").click(function (event) {
        $('ul#shoptoggdata').toggle();
          console.log("open close");
      
        }) 
        $("h5#helptogg").click(function (event) {
            $('ul#helptoggdata').toggle();
              console.log("1open close");
          
            })
            $("h5#COMPANYtogg").click(function (event) {
                $('ul#COMPANYtoggdata').toggle();
                  console.log(" 2open close");
              
                })
 

    $("div#closenav").click(function (event) {
      // If the target is not the container or a child of the container, then process
      // the click event for outside of the container.
      if ($(event.target).closest("#vnav").length === 0) {
        console.log("You clicked outside of the container element");
        //   $('#closenav').addClass('d-none');
        document.getElementById("vnav").style.width = "0";
        document.getElementById("closenav").style.width = "0";
        document.getElementById("closenav").style.height = "0";
      }
    });
     

    $('#shopin').click(function(){
        console.log("colin");
        // document.getElementById("imgshow").style.display = "block";
        $(".imgshow").slideToggle();
    });

    $('#moredatab').click(function(){
        console.log("colin");
        // document.getElementById("imgshow").style.display = "block";
        $(".moredata").slideToggle();
    });

    // #morea:hover .dropdown-menu.show {
    //     display: block;
    // }

    $('#moredrop').hover(function(){
      console.log("mmoreee");
        // document.getElementById("imgshow").style.display = "block";
        $("#moredrop").toggle(300).addClass("show");
    });;
        

    $('#moredrop').hover(function(){
    
          $("#moredrop").stop(function(){
            $("#moredrop").show();
          });
      });
      

    //   $('.slider3').slick({
    //     infinite: false,
    //     slidesToShow: 3,
    //     slidesToScroll: 1,
    //     prevArrow: '<i class="fa fa-chevron-left d-flex align-items-center"></i>',
    //     nextArrow: '<i class="fa fa-chevron-right d-flex align-items-center"></i>',
    //     // arrows: true,
    //     responsive: [
    //         {
    //             breakpoint: 768,
    //             settings: {
    //                 arrows: false,
    //                 slidesToShow: 2
    //             }
    //         },
    //         {
    //             breakpoint: 480,
    //             settings: {
    //                 arrows: false,
    //                 slidesToShow: 1
    //             }
    //         }
    //     ]
    // });

      

      
    $('.slider1').slick({
        infinite: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        prevArrow: '<i class="fa fa-chevron-left d-flex align-items-center"></i>',
        nextArrow: '<i class="fa fa-chevron-right d-flex align-items-center"></i>',
        // arrows: true,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    arrows: false,
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    arrows: false,
                    slidesToShow: 1
                }
            }
        ]
    });
    $('.slider2').slick({
        infinite: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        centerMode: true,

        // prevArrow: '<i class="fa fa-chevron-left d-flex align-items-center"></i>',
        // nextArrow: '<i class="fa fa-chevron-right d-flex align-items-center"></i>',
        // arrows: true,

        centerPadding: '60px',
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2,


                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 1,
                }
            }
        ]
    });

    $(".imgcon").hover(function(){
      console.log("this")
    });


});





