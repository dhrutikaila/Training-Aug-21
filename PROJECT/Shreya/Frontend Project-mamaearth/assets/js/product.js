$(document).ready(function(){
    $.getJSON("../assets/json/product.json", function(json){
        if(!localStorage.card){
            localStorage.setItem('card',JSON.stringify(json))
        }
    })
 
    var data = JSON.parse(localStorage.card);
    //console.log(data)
    $.each(data.Product, function(i){
        if(data.Product[i].type == "best seller"){
            $("#card").append(
                ` <div class="card mt-3 ms-2 cardimage" style="width:230px;height: 340px;border: dotted 1px #6DA523;margin-left: 100px;">
                    <div class="badge border border-top bg-danger position-absolute top-0 start-0"
                        style="width: 75px; height: 20px;margin-top: -1px;">
                        <p class="text-start" style="font-size: 10px;">BEST SELLER</p>
                    </div>
                    <img src="`+data.Product[i].cardimg+`" class="card-img-top" alt="..." width="100px" height="180px">
                    <div class="card-body">
                        <p class="card-text" style="font-size: 9px;padding: 0px 0.8em;margin: 0.8em 0px 0.6em">
                           `+ data.Product[i].Description +`</p>
                        <div class="mb-1">
                            <span class="badge mb-1"
                                style="margin-left:80px;background-color: #6DA523;width: 43px;height: 20px;">
                                <p class="text-center fw-normal">`+data.Product[i].Rate+`
                                    <i class="fa fa-star" aria-hidden="true" style="width: 10px;"></i>
                                </p>
                            </span>
                        </div>
                        <div class="mb-2">
                            <span class="fw-bold mt-1" style="font-size: 10px;margin-left:90px;">
                            ₹ `+data.Product[i].Price+`
                            </span>
                        </div>
                        <div>
                            <button class="fade-button">
                                ADD TO CART
                            </button>
                        </div>
                    </div>
                    </div>
                 `)
            }
            if(data.Product[i].type == "item"){
                $('#imgcard').append(
                    `<div style="margin-top: 40px;">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                                    data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="false"></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                                    data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                </button>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="`+data.Product[i].carouselimag+`" alt="" class="img-fluid" style="margin-top: 10px;">
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                                `
                            )
                        } 
        if (data.Product[i].type == "best Deals") {
            $('#bestdeals').append(
                ` <div class="d-flex flex-wrap justify-content-around">
                <div class="card mt-3 ms-2 cardimage" style="width:230px;height: 340px;border: dotted 1px #6DA523;">
                    <div class="badge border border-top bg-danger position-absolute top-0 start-0"
                        style="width: 75px; height: 20px;margin-top: -1px;">
                        <p class="text-start" style="font-size: 10px;">BEST SELLER</p>
                    </div>
                    <img src="`+data.Product[i].cardimg+`" class="card-img-top" alt="..." width="100px" height="180px">
                    <div class="card-body">
                        <p class="card-text" style="font-size: 10px;font-family: lato;margin-left: 50px;">
                        `+ data.Product[i].Description +`</p>
                        <div class="mb-1"> <span class="badge mb-1"
                                style="margin-left:80px;background-color: #6DA523;width: 43px;height: 20px;">
                                <p class="text-center fw-normal">`+data.Product[i].Rate+`
                                    <i class="fa fa-star" aria-hidden="true" style="width: 10px;"></i>
                                </p>
                            </span>
                        </div>
                        <div class="mb-2">
                            <span class="fw-bold mt-1" style="font-size: 10px;margin-left:70px;">
                                <strike class="text-muted">₹`+data.Product[i].actualPrice+`</strike>
                                ₹`+data.Product[i].Price+`</span>
                        </div>
                        <div>
                            <button class="fade-button">ADD TO CART</button>
                        </div>
                    </div>
                </div>
             `
            )}      
            if (data.Product[i].type == "Onion Range") {
                $('#onionrange').append(
                    ` <div class="card mt-3 ms-2 cardimage" style="width:230px;height: 340px;border: dotted 1px #6DA523;margin-left: 100px;">
                    <div class="badge border border-top bg-danger position-absolute top-0 start-0"
                        style="width: 75px; height: 20px;margin-top: -1px;">
                        <p class="text-start" style="font-size: 10px;">BEST SELLER</p>
                    </div>
                    <img src="`+data.Product[i].cardimg+`" class="card-img-top" alt="..." width="100px" height="180px">
                    <div class="card-body">
                        <p class="card-text" style="font-size: 9px;padding: 0px 0.8em;margin: 0.8em 0px 0.6em">
                           `+ data.Product[i].Description +`</p>
                        <div class="mb-1">
                            <span class="badge mb-1"
                                style="margin-left:80px;background-color: #6DA523;width: 43px;height: 20px;">
                                <p class="text-center fw-normal">`+data.Product[i].Rate+`
                                    <i class="fa fa-star" aria-hidden="true" style="width: 10px;"></i>
                                </p>
                            </span>
                        </div>
                        <div class="mb-2">
                            <span class="fw-bold mt-1" style="font-size: 10px;margin-left:90px;">
                            ₹ `+data.Product[i].Price+`
                            </span>
                        </div>
                        <div>
                            <button class="fade-button">
                                ADD TO CART
                            </button>
                        </div>
                    </div>
                    </div>
                 `
                )}      
                if (data.Product[i].type == "Vitamin C Range") {
                    $('#vitaminc').append(
                        ` <div class="card mt-3 ms-2 cardimage" style="width:230px;height: 340px;border: dotted 1px #6DA523;margin-left: 100px;">
                        <div class="badge border border-top bg-danger position-absolute top-0 start-0"
                            style="width: 75px; height: 20px;margin-top: -1px;">
                            <p class="text-start" style="font-size: 10px;">BEST SELLER</p>
                        </div>
                        <img src="`+data.Product[i].cardimg+`" class="card-img-top" alt="..." width="100px" height="180px">
                        <div class="card-body">
                            <p class="card-text" style="font-size: 9px;padding: 0px 0.8em;margin: 0.8em 0px 0.6em">
                               `+ data.Product[i].Description +`</p>
                            <div class="mb-1">
                                <span class="badge mb-1"
                                    style="margin-left:80px;background-color: #6DA523;width: 43px;height: 20px;">
                                    <p class="text-center fw-normal">`+data.Product[i].Rate+`
                                        <i class="fa fa-star" aria-hidden="true" style="width: 10px;"></i>
                                    </p>
                                </span>
                            </div>
                            <div class="mb-2">
                                <span class="fw-bold mt-1" style="font-size: 10px;margin-left:90px;">
                                ₹ `+data.Product[i].Price+`
                                </span>
                            </div>
                            <div>
                                <button class="fade-button">
                                    ADD TO CART
                                </button>
                            </div>
                        </div>
                        </div>
                     `
                    )}      
                    if (data.Product[i].type == "Ubtan Range") {
                        $('#ubtanrange').append(
                            ` <div class="card mt-3 ms-2 cardimage" style="width:230px;height: 340px;border: dotted 1px #6DA523;margin-left: 100px;">
                            <div class="badge border border-top bg-danger position-absolute top-0 start-0"
                                style="width: 75px; height: 20px;margin-top: -1px;">
                                <p class="text-start" style="font-size: 10px;">BEST SELLER</p>
                            </div>
                            <img src="`+data.Product[i].cardimg+`" class="card-img-top" alt="..." width="100px" height="180px">
                            <div class="card-body">
                                <p class="card-text" style="font-size: 9px;padding: 0px 0.8em;margin: 0.8em 0px 0.6em">
                                   `+ data.Product[i].Description +`</p>
                                <div class="mb-1">
                                    <span class="badge mb-1"
                                        style="margin-left:80px;background-color: #6DA523;width: 43px;height: 20px;">
                                        <p class="text-center fw-normal">`+data.Product[i].Rate+`
                                            <i class="fa fa-star" aria-hidden="true" style="width: 10px;"></i>
                                        </p>
                                    </span>
                                </div>
                                <div class="mb-2">
                                    <span class="fw-bold mt-1" style="font-size: 10px;margin-left:90px;">
                                    ₹ `+data.Product[i].Price+`
                                    </span>
                                </div>
                                <div>
                                    <button class="fade-button">
                                        ADD TO CART
                                    </button>
                                </div>
                            </div>
                            </div>
                         `
                  )}       
        })
});
            