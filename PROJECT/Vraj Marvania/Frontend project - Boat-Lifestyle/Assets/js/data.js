
$(document).ready(function () {
    
 //   for create & add card in slider------------------------------------------------------->
    function dispalydata(key, id) {
        console.log(key,id);

        var jdata2 = localStorage.getItem(key);
        console.log(jdata2);

        var result = (JSON.parse(jdata2));
        for (i = 0; i < result.data.length; i++) {
            var temp = "";
            for (j = 0; j < result.data[i].dis.length; j++) {
                temp = (temp + "<li>" + result.data[i].dis[j] + "</li>");
            }
            var card = $("<div class='mx-2 d-flex justify-content-center'> <div class='card rounded-5 a' style=' border: 0px; width: 365px; font-size: 16px;border-radius: 10px; '> <div class=' d-flex justify-content-center' style='background-color: silver; border-top-left-radius: 10px; border-top-right-radius: 10px;'> <img src='" + result.data[i].img + "' height='255px' width='255px' class='' alt='...'> </div> <div class='card-body' style=' height: 180px; flex: 1 1 auto; padding-inline:10px; padding-top:5px ; padding-bottom: 0px; border-radius: 10px;font-size: 10px; background-color: #f1f1f1; '> <div class='text-danger'> <i class='fas fa-star active'></i> <i class='fas fa-star active'></i> <i class='fas fa-star active'></i> <i class='fas fa-star active'></i> <i class='fas fa-star d-inline'></i> <h6 class='d-inline text-secondary'>14 reviews</h6> </div> <h5 class='card-title ' style=' margin-bottom: 5px; font-size: 14px;'>" + result.data[i].name + "BOAT Airdopes 121 v2</h5> <h5 class='card-title text-danger fw-bold d-inline' style='font-size:14px'>" + result.data[i].price + "</h5> <h5 class='card-text text-secondary text-decoration-line-through d-inline' style='font-size: 12px;'>" + result.data[i].oldprice + "</h5> <ul class='card-text text-decoration-square' style='font-size: 12px; padding-left: 13px; list-style-type: square;'> " + temp + " </ul> <a href='http://127.0.0.1:5500/product.html?type="+JSON.stringify(result.type)+"&id="+JSON.stringify(i)+"' class='btn btn-dark rounded-pill px-4' style=' background-color: #000000; '>Shop Now</a> </div> </div> </div>")

            $(id).append(card);
        }
    }

    // dispalydata("Top_Wireless", "#Top_Wireless");
    
//  for create div slider from localstorage-------------------------------------------------->
    function setslider(id,title,setid="ifram") {
        console.log(id,title,setid);

      var divap = $(
        "<div class='container-fluid  mt-5' style='margin-top: 60px;'><div class='container'><h2 class='text-white text-center hed' style='line-height: 1.2em;font-weight: bolder; margin-bottom: 20px;'>"+title+"</h2></div><div class='slider1' id='" +
          id +"'></div></div>"
      );
      console.log(divap);

      $("#"+setid).after(divap);
      console.log(id);
      dispalydata(id, "#" + id);    //call dispalydata function
    }

    // setslider("Best_Sellers","Upto 75% Off On Best Sellers","ifram");
  

// fetch data of slidercategory and dispaly-data--------------------------------------------->
    var cat=(JSON.parse(localStorage.getItem("slidercat"))[0].data)
    console.log(cat)
    console.log("____")
    // for(i=0;i<cat.length;i++)
    // {
    //     console.log(cat[i].id,cat[i].title,cat[i].setid);
    //     setslider(cat[i].id,cat[i].title,cat[i].setid);     // call setslider function
    //     console.log('cat[i].id,cat[i].title,cat[i].setid');

    // }
    $.each(cat,function(){
      setslider(this.id,this.title,this.setid);     // call setslider function
      console.log(this.id,this.title,this.setid)
    })
  

});



// json file to localStorage------------------------------------------------------------------>
function storedata(){
$.getJSON("http://127.0.0.1:5500/Assets/js/alldata.json",
    function (result) {
        
        $.each( result[0], function( key, val ) {
            // console.log(key);
        var vals = JSON.stringify(val);
        localStorage.setItem(key, vals);

          });
    });


}
// storedata()









// console.log("data in")
// var  slider=$({data:[{'id':'Best_Sellers','title':'Upto 75% Off On Best Sellers','setid':'ifram'},
// {'id':'Prices_Like_Never_Before','title':'Prices Like Never Before','setid':'ifram'},
// {'id':'Top_Smart_Watches','title':'Top Smart Watches','setid':'imgslider'},
// {'id':'Top_Wireless','title':'Upto 75% Off On Top Wireless','setid':'New_Launches'}]})
// localStorage.setItem("slidercat",JSON.stringify(slider))

// function storedata(){
//     $.getJSON("http://127.0.0.1:5500/Assets/js/.json",
//         function (result) {
      
//             localStorage.setItem('Best_Sellers',JSON.stringify(result))

    
//     }
// localStorage.setItem('Prices_Like_Never_Before')
// localStorage.setItem('Top_Smart_Watches')
// localStorage.setItem('Top_Wireless')