$(document).ready(function () {

    $.getJSON("assets/json/data.json", function(json){
        if (typeof (Storage) !== "undefined") {
            if (!localStorage.content) {
                localStorage.setItem('content', JSON.stringify(json));
            }
        }
    });
    var date = new Date();
    var today = date.toISOString().slice(0,10).replace(/-/g,"/");
    // var today = "2021/10/15";
    console.log(today);
    
    var data = JSON.parse(localStorage.content)
        $.each(data.element, function (j) {
            if(data.element[j].startdate <= today && data.element[j].enddate >= today)
            {
            if (data.element[j].type == "offer-static") {
                $("#offer-content")
                    .append($('<div></div>').addClass('offer p-2')
                        .append('<img src='+data.element[j].img+'>')
                    );
            }
            if (data.element[j].type == "offer-carousel") {
                $("#offer-content")
                    .append($('<div id="bank_offer_carousel' + j + '" data-bs-ride="carousel"></div>').addClass('carousel slide offer')
                        .append($('<div id="indicator' + j + '"></div>').addClass('carousel-indicators'))
                        .append($('<div id="item' + j + '"></div>').addClass('carousel-inner'))
                    )
                $.each(data.element[j].carouselimg, function (i) {
                    $('#indicator' + j)
                        .append('<button id="btn' + j + '00' + i + '" type="button" data-bs-target="#bank_offer_carousel' + j + '" data-bs-slide-to=' + i + ' aria-current="true" aria-label="Slide ' + i + '"></button>')
                    $('#item' + j)
                        .append($('<div id="carousel-item' + j + '00' + i + '"></div>').addClass('carousel-item')
                            .append($('<img src=' + data.element[j].carouselimg[i].img + '>').addClass('d-block w-100'))
                        );
                    if (i == 0) {
                        $('#btn' + j + '00' + i).addClass('active')
                        $('#carousel-item' + j + '00' + i).addClass('active')
                    }
                });
            }

            if (data.element[j].type == "category") {
                // To check length for card images in each category.
                if (data.element[j].cardimg.length < 5) {
                    var col_no = data.element[j].cardimg.length;
                }
                else {
                    var col_no = 5;
                }

                // To create category element card with title image and its row container. 
                $("#category-content")
                    .append($('<div></div>').addClass('category')
                        .append($('<div></div>').addClass('p-2')
                            .append('<img src=' + data.element[j].titleimg + '>'))
                        .append($('<div id="row' + j + '"></div>').addClass('row row-cols-lg-' + col_no + ' row-cols-3 d-flex flex-nowrap overflow-scroll mx-3'))
                    );

                // To add columns to the row for each card image.
                $.each(data.element[j].cardimg, function (i) {
                    $("#row" + j)
                        .append($('<div></div>').addClass('col')
                            .append('<img src=' + data.element[j].cardimg[i].img + '>'))
                });
            }
        }
        });

        
            
    });

    function checkLogin(){
    if(localStorage.getItem("user") === null && localStorage.getItem("admin")=== null){
        window.location.assign("login.html")
    }
    else if(localStorage.admin){
        window.location.assign("admin.html")
    }
    else if(localStorage.user){
        window.location.assign("index.html")
    }
}    
        