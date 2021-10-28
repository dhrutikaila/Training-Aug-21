$(document).ready(()=>{

if(localStorage.Restaurant){
    var Result= JSON.parse(localStorage.getItem("Restaurant"))
    console.log(Result);
    $.each(Result,(index,element)=>{
        $('#Restaurant_Card').append(` <div class="col"><div class="card  h-100">
        <img class="card__image " src=${element.imgSrc} alt="/" id=${element.id}>
        <div class="card__info ">
            <div class="d-flex w-100 mt-2" style="justify-content:space-between">
                <p class="card__title">${element.title}</p>
                <div class="card__rating">${element.rating}</div>
            </div>
            <hr>
            <div class="d-flex w-100" style="justify-content:space-between">
                <p class="card__disc">${element.description}</p>
                <p class="card__price">Starting at ${element.price} </p>
            </div>
        </div>
    </div>
    </div>`)
    })
}
else{


    $.getJSON("http://127.0.0.1:5500/PROJECT/Raj%20Thakkar/JSON/Restaurant.json",(res)=>{
        
        $.each(res.restaurant,(index,element)=>{
            $('#Restaurant_Card').append(` <div class="col"><div class="card  h-100">
            <img class="card__image " src=${element.imgSrc} alt="/" id=${element.id}>
            <div class="card__info ">
                <div class="d-flex w-100 mt-2" style="justify-content:space-between">
                    <p class="card__title">${element.title}</p>
                    <div class="card__rating">${element.rating}</div>
                </div>
                <hr>
                <div class="d-flex w-100" style="justify-content:space-between">
                    <p class="card__disc">${element.description}</p>
                    <p class="card__price">Starting at ${element.price} </p>
                </div>
            </div>
        </div>
        </div>`)
        })
     localStorage.setItem("Restaurant",JSON.stringify(res.restaurant))   

    })
}
   
   
})

function search(){
    var searchInput = $("#search_value").val();
    console.log(searchInput)
    $.getJSON("http://127.0.0.1:5500/PROJECT/Raj%20Thakkar/JSON/Restaurant.json",(res)=>{
        
            $(res.restaurant).filter((index,element)=>{
             //   console.log($.contains(searchInput,element.title))
              if((element.title).indexOf(searchInput)>=0){
                  console.log(element.title);
              }  
            })
      
    })
}

function addRestaurant(Restaurant_Name,Description,src,Rating,price)
{
    var Restaurant={        
        "title": Restaurant_Name,
        "imgSrc": src,
        "rating": Rating,
        "description": Description,
        "price": price
    }

    var res_arr=JSON.parse(localStorage.getItem("Restaurant"));
    res_arr.push(Restaurant);
    localStorage.setItem("Restaurant",JSON.stringify(res_arr));

 
        $('#Restaurant_Card').append(` <div class="col"><div class="card  h-100">
        <img class="card__image " src=${Restaurant.imgSrc} alt="/" id=${res_arr.length+1}>
        <div class="card__info ">
            <div class="d-flex w-100 mt-2" style="justify-content:space-between">
                <p class="card__title">${Restaurant.title}</p>
                <div class="card__rating">${Restaurant.rating}</div>
            </div>
            <hr>
            <div class="d-flex w-100" style="justify-content:space-between">
                <p class="card__disc">${Restaurant.description}</p>
                <p class="card__price">Starting at ${Restaurant.price} </p>
            </div>
        </div>
    </div>
    </div>`)

}