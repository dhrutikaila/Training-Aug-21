// console.log("hello")
function addtocart(data) {
    if (sessionStorage.getItem("user") != null) {
        var uidd = JSON.parse(sessionStorage.getItem('user'))[0].uid
        var cart = JSON.parse(localStorage.getItem('cartinfo'))
         var keyy;
            cart.data.filter(function (e,key){keyy=(key); return  e[0].uid==uidd})
            // console.log(keyy)
        // console.log(cart.data)
     
        if (cart.data.filter(function (e) { return e[0].uid == uidd }) == 0) {
            var carttemp =$({'uid': uidd,'cartdata':[data]}); 
            // console.log(carttemp)
            var temp=JSON.parse(localStorage.getItem('cartinfo'))
            temp.data.push(carttemp)
            // console.log(temp)
            localStorage.setItem('cartinfo',JSON.stringify(temp))

        }
        else {
            console.log("______in")
            cart.data[keyy]
            // var carttemp =$({'uid': uidd,'cartdata':data}); 
           cart.data[keyy][0].cartdata.push(data)
           var temp=cart;
            localStorage.setItem('cartinfo',JSON.stringify(temp))

        }

    }
    else {
        window.open("./login.html")
    }
}






        // -----------------------------------------------imp-------------------------------------------------------------
// for cart reset
// localStorage.setItem('cartinfo',`{"type":"cartinfo","data":[]}`)
// localStorage.setItem("","{cartinfo:[{userid:1,productlist:[{},{},{}]}]}")
        // -----------------------------------------------imp-------------------------------------------------------------

