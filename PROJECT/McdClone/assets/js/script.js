$(".owl-carousel").owlCarousel({
    autoplay: false,
    autoplayhoverpause: false,
    items: 3.25,
    loop:false,
    margin: 4,
    padding: 5,
    responsive: {
        0 :{
            items: 1,
            dots: false
        },

        485:{
            items: 2,
            dots: false
        },

        728 :{
            items: 3,
            dots: false
        },

        1200 :{
            items:3.25,
            dots: false
        }
    }
})

$(document).ready(function(){



})



let jsondata;    
fetch('js/data.json').then(
        function(u){ return u.json();}
      ).then(
        function(json){
          
          console.log(json);


          
localStorage.setItem('added-items', JSON.stringify(json));

var retrievedObject = localStorage.getItem('added-items');

var parsedObject = JSON.parse(retrievedObject);

console.log(parsedObject.item[0].img);



                  for (item in parsedObject){
                for (var i in item){
                          var row = `
                     <div class="row  g-4 py-2 " >
                    <div class="col-12 pr-4 ">
                      <div class="card border rounded-2 d-flex flex-row justify-content-around  " >
                        <img id="img_1" src="${parsedObject.item[i].img}" class="card-img-top ms-3 mt-2 " style="height: 90px;width:110px;" alt="...">
                        <div class="d-flex align-self-start mt-2"  >
                          <img id="img_cat_1" src="${parsedObject.item[i].img_cat}" alt="">
                       </div>
                        <div class="card-body">
                          <h5 class="card-title" id="title_1">${parsedObject.item[i].title}</h5>
                          <p class="card-text">${parsedObject.item[i].desc}</p>
                          </div>
                          <div class="p-2 align-self-center">
                            <div class="d-flex justify-content-center">
                             <h6 ><span>&#8377</span>200</h6>
                           </div>
                            <div>
                            <button  type="button" class="btn btn-warning text-center pt-1" style="height: 30px;width: 88px;">Add<span class="badge badge-warning text-dark">  +</span></button>
                            </div>
                            <div class="mt-1 align-self-center d-flex justify-content-center"><small class="fw-lighter" style="font-size: 11px;">Costumizable</small></div>
                      </div>
                    </div>
                    </div>
                  </div> `


                         
          var table = $("#products")
          table.append(row)


                }}


        }
      )


         




