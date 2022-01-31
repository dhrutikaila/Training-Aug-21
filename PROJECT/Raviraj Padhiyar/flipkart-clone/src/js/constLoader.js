import {
    navData,
    bannerData,
    dealData,
    footwareDeals,
    groceryDeals,
    MobileDeals,
    fashionDeals,
    electronicsDeals,
    homeDeals,
    appliancesDeals,
    otherDeals,
    recentViews
  } from "../constants/data.js";


let myLocalStorage = window.localStorage;
myLocalStorage.setItem("navData",JSON.stringify(navData));
myLocalStorage.setItem("bannerData",JSON.stringify(bannerData));
// myLocalStorage.setItem("dealData",JSON.stringify(dealData));
// myLocalStorage.setItem("footwareDeals",JSON.stringify(footwareDeals));
// myLocalStorage.setItem("groceryDeals",JSON.stringify(groceryDeals));
// myLocalStorage.setItem("MobileDeals",JSON.stringify(MobileDeals));
// myLocalStorage.setItem("fashionDeals",JSON.stringify(fashionDeals));
// myLocalStorage.setItem("electronicsDeals",JSON.stringify(electronicsDeals));
// myLocalStorage.setItem("homeDeals",JSON.stringify(homeDeals));
// myLocalStorage.setItem("appliancesDeals",JSON.stringify(appliancesDeals));
// myLocalStorage.setItem("otherDeals",JSON.stringify(otherDeals));
// myLocalStorage.setItem("recentViews",JSON.stringify(recentViews));

//cart {product}
let cart = new Array();
myLocalStorage.setItem("cart",JSON.stringify(cart));

//admin and password {adminname,password}
$.getJSON("../data/admin.json",function(data){
  myLocalStorage.setItem("admins",JSON.stringify(data));
});

//username and password {username,password}
$.getJSON("../data/users.json",function(data){
  myLocalStorage.setItem("users",JSON.stringify(data));
});

//user cart {username,cart array containing product}



$.getJSON("../data/products.json",function(data){
  myLocalStorage.setItem("products",JSON.stringify(data));
});


//current admin
if(!(myLocalStorage.getItem("curretAdmin"))){
  let currentAdmin = {};
  myLocalStorage.setItem("currentAdmin",JSON.stringify(currentAdmin));
}

//current user


if(!(myLocalStorage.getItem("currentUser"))){
  let currentUser = {};
  myLocalStorage.setItem("currentUser",JSON.stringify(currentUser));
}


//today deals product id

let dealsOfDay = [12,23,34,8,56,43,44,45];
myLocalStorage.setItem("dealsOfDay",JSON.stringify(dealsOfDay));