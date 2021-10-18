var swiper = new Swiper('.swiper-container', {
  slidesPerView: 2,
  spaceBetween: 10,
  autoplay: {
    delay: 5000,
  },
  //init: true,
  // direction: 'horizontal',
  //loop: true,

  navigation: {
    nextEl: '.next-btn',
    prevEl: '.prev-btn',
  },
  breakpoints: {
    640: {
      slidesPerView: 2,
      spaceBetween: 10,
    },
    769: {
      slidesPerView: 3,
      spaceBetween: 10,
    },

    1024: {
      slidesPerView: 5,
      spaceBetween: 10,
    },

    1440: {
      slidesPerView: 4,
      spaceBetween: 10,
    },

  },


});
var swiper1 = new Swiper('.swiper-container1', {
  slidesPerView: 2,
  spaceBetween: 10,
  autoplay: {
    delay: 5000,
  },
  //init: true,
  // direction: 'horizontal',
  //loop: true,

  navigation: {
    nextEl: '.next-btn-1',
    prevEl: '.prev-btn-1',
  },
  breakpoints: {
    640: {
      slidesPerView: 2,
      spaceBetween: 10,
    },
    769: {
      slidesPerView: 3,
      spaceBetween: 10,
    },

    1024: {
      slidesPerView: 5,
      spaceBetween: 10,
    },

    1440: {
      slidesPerView: 4,
      spaceBetween: 10,
    },

  },


});

var swiper2 = new Swiper('.swiper-container2', {
  slidesPerView: 2,
  spaceBetween: 10,
  autoplay: {
    delay: 5000,
  },
  //init: true,
  // direction: 'horizontal',
  //loop: true,

  navigation: {
    nextEl: '.next-btn-2',
    prevEl: '.prev-btn-2',
  },
  breakpoints: {
    640: {
      slidesPerView: 4,
      spaceBetween: 10,
    },
    769: {
      slidesPerView: 6,
      spaceBetween: 10,
    },

    1024: {
      slidesPerView: 8,
      spaceBetween:5,
    },

    1440: {
      slidesPerView: 8,
      spaceBetween:5,
    },

  },


});
$(function () {

  $.getJSON("offers.json", function (result, status, xhr) {
    //console.log(status);
    $.each(result.offers, function (i, field) {
      console.log(result.offers);
      if (i == 0) {
        $("#sliderWrapper").append(`  <div class="swiper-slide active">
                        <div class="col">
                            <div class="card box-4 shadow-sm h-100 w-100">
                               
                                <div class="card-body row border-2 border-secondary text-dark">
                                    <img src="` + field.Image + `" class="d-inline col-sm-6 col-md-6 col-lg-4 me-0" height="70px" min-height="70px" width="70px" min-height="70px">
                                    <div class="col-sm-6 col-md-6 col-lg-8 ms-0 me-0">
                                    <div class="card-text text-dark fs-6 ms-0 d-inline mt-0 pt-0">
                                    <b>` + field.OfferName.substring(0, 40) + `...</b>
                                    </div>
                                    <p>Code: <span class="fs-6 card-text text-dark">` + field.Code + `</span></p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>`);
      } else {
        $("#sliderWrapper").append(`  <div class="swiper-slide">
                        <div class="col">
                            <div class="card box-4 shadow-sm">
                               
                                <div class="card-body row border-2 border-secondary text-dark">
                                    <img src="` + field.Image + `" class="d-inline col-6 col-sm-6 col-md-6 col-lg-4 me-0" height="70px" min-height="70px" width="70px" min-height="70px">
                                     <div class=" col-6 col-sm-6 col-md-6 col-lg-8 ms-0 me-0">
                                    <div class="card-text fs-6 ms-0 d-block mt-0 pt-0 text-dark">
                                    <b>` + field.OfferName.substring(0, 40) + `...</b>
                                    </div>
                                    <p>Code: <span class="fs-6 card-text text-dark">` + field.Code + `</span></p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>`);
      }

    });
    $.getJSON("brands.json", function (result, status, xhr) {
    //console.log(status);
    $.each(result.brands, function (i, field) {
      //console.log(result.offers);
        $("#sliderWrapperOfBrands").append(`<div class="swiper-slide swiper-slide-active d-inlne bg-white">
                        
                            <div class="card d-inline swiper-brand shadow-sm h-100 opacity-50">
                               
                                <div class="card-body row border-2 border-secondary text-dark opacity-100">
                                    <img src="` + field.Image + `" class="d-block card-image col-12 me-0">
                                    </div>

                              
                            </div>
                        
                    </div>`);
     
    });

  });

  });

  $.getJSON("recommended.json", function (result, status, xhr) {
    //console.log(status);
    $.each(result.brands, function (i, field) {
      //console.log(result.offers);
        $("#sliderWrapperOfRecommended").append(`<div class="swiper-slide swiper-slide-active d-inlne bg-white">
                        
                            <div class="card d-inline swiper-brand shadow-sm h-100 opacity-50">
                               
                                <div class="card-body row border-2 border-secondary text-dark opacity-100">
                                    <img src="` + field.Image + `" class="d-block card-image col-12 me-0">
                                </div>
                                <div>
                                </div>

                              
                            </div>
                        
                    </div>`);
     
    });

  });

  });

  
  $.getJSON("labTests.json", function (result, status, xhr) {
    $.each(result.labTests, function (i, field) {

        
        if(field.Offer!="Not Available" && i!=(result.labTests.length-1)){
        $("#labTest-Slider").append(`
                    <div class="swiper-slide swiper-card text-dark" style="margin-right: 20px;">
          <div class="_2z8Mm text-dark bg-white"><a href="" class="text-decoration-none text-dark p-3">
              <div class="_2AHc8"><img class="kRxXo _1xG27 pe-lazy" alt="Test"
                  src="https://assets.pharmeasy.in/web-assets/dist/909edb3f.svg" loading="lazy"
                  importance="low"><noscript></noscript>
                <div class="_3XrTI mt-3"><b>`+field.TestName+`</b></div>
                <div class="_38Q81 mt-1">`+field.Availability+`</div>
              </div>
              <div class="LMEaN mt-5">
                <div class="VFj6P d-inline mb-2 me-4"><span class="_3Wgoy"><b>`+field.Price+`</b></span><span class="lVBGa ms-2 me-1">Onwards</span></div>
                <button class=" d-inline float-left d-inline mb-2 btn btn-md btn-order ms-4"><b>Book Now > 

                </b></button>
              </div>
            </a>
             <div class="_2jHx3 text-white bg-danger z-index-5 opacity-75"><span class="_1LfDt">`+field.Offer+`</span></div>
        </div>
                    `);
        }
        if(i==(result.labTests.length-1)){
            $("#labTest-Slider").append(`
                    <div class="swiper-slide swiper-card text-dark" style="margin-right: 20px;">
          <div class="_2z8Mm text-dark bg-primary"><a href="" class="text-decoration-none text-dark p-3">
              <div class="_2AHc8"><img class="kRxXo _1xG27 pe-lazy" alt="Test"
                  src="https://assets.pharmeasy.in/web-assets/dist/909edb3f.svg" loading="lazy"
                  importance="low"><noscript></noscript>
                <div class="_3XrTI mt-3"><b>`+field.TestName+`</b></div>
                <div class="_38Q81 mt-1">`+field.Availability+`</div>
              </div>
              <div class="LMEaN mt-5 ms-5">
               <div class="VFj6P mb-2 me-4 d-none"><span class="_3Wgoy"><b>`+field.Price+`</b></span><span class="lVBGa ms-2 me-1">Onwards</span></div>
                
                <button class=" float-left d-inline mb-2 btn btn-md btn-order mb-0 ms-5" style="position:relative !important;right:0 important;"><b>Book Now > 

                </b></button>
              </div>
            </a>
             <div class="_2jHx3 text-white bg-danger z-index-5 opacity-75"><span class="_1LfDt">`+field.Offer+`</span></div>
        </div>
                    `);
        }
        else{
           $("#labTest-Slider").append(`
                    <div class="swiper-slide swiper-card text-dark" style="margin-right: 20px;">
          <div class="_2z8Mm  bg-white text-dark"><a href="" class="text-decoration-none text-dark p-3">
              <div class="_2AHc8"><img class="kRxXo _1xG27 pe-lazy" alt="Test"
                  src="https://assets.pharmeasy.in/web-assets/dist/909edb3f.svg" loading="lazy"
                  importance="low"><noscript></noscript>
                <div class="_3XrTI mt-3"><b>`+field.TestName+`</b></div>
                <div class="_38Q81 mt-1">`+field.Availability+`</div>
              </div>
              <div class="LMEaN mt-5">
                <div class="VFj6P d-inline mb-2 me-4"><span class="_3Wgoy"><b>`+field.Price+`</b></span><span class="lVBGa ms-2 me-1">Onwards</span></div>
                <button class=" d-inline float-left d-inline btn btn-md btn-order mb-2 ms-4"><b>Book Now > 

                </b></button>
              </div>
            </a>
              
           
          </div>
        </div>`);
        }
       
    });


  });
});