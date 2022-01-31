$(document).ready(function() {
    //This Function Get User Details From Local Storage
    getUserInfo();

    var Data = localStorage.getItem("Menu");
    if (Data == null) {
        //Fetch Data From Menu.json File
        $.getJSON("JSON/Menu.json", function(Menu, status) {
            if (status == "success") {
                localStorage.setItem("Menu", JSON.stringify(Menu));
                localStorage.setItem("Bestsellers", JSON.stringify(Menu.Bestsellers));
                localStorage.setItem("VegPizza", JSON.stringify(Menu.VegPizza));
                localStorage.setItem("NonVegPizza", JSON.stringify(Menu.NonVegPizza));
                localStorage.setItem("NewLaunches", JSON.stringify(Menu.NewLaunches));
                localStorage.setItem("MealsCombos", JSON.stringify(Menu.MealsCombos));
                localStorage.setItem("PizzaMania", JSON.stringify(Menu.PizzaMania));
                localStorage.setItem("SpecialityChicken", JSON.stringify(Menu.SpecialityChicken));
                localStorage.setItem("Sides", JSON.stringify(Menu.Sides));
                localStorage.setItem("Beverages", JSON.stringify(Menu.Beverages));
                localStorage.setItem("Dessert", JSON.stringify(Menu.Dessert));

                PizzaDisplay();
            }
        });
    } else {
        PizzaDisplay();
    }

    //This Function Calculate SubTotal And Show Dynamically
    Subtotal();

    addCartItems();

    Favorite_List_Display();


});

//This Function Display Pizza Which is Fetch From Local Storage
function PizzaDisplay() {
    var Bestsellers = JSON.parse(localStorage.getItem("Bestsellers"));
    var VegPizza = JSON.parse(localStorage.getItem("VegPizza"));
    var NonVegPizza = JSON.parse(localStorage.getItem("NonVegPizza"));
    var NewLaunches = JSON.parse(localStorage.getItem("NewLaunches"));
    var MealsCombos = JSON.parse(localStorage.getItem("MealsCombos"));
    var PizzaMania = JSON.parse(localStorage.getItem("PizzaMania"));
    var SpecialityChicken = JSON.parse(localStorage.getItem("SpecialityChicken"));
    var Sides = JSON.parse(localStorage.getItem("Sides"));
    var Beverages = JSON.parse(localStorage.getItem("Beverages"));
    var Dessert = JSON.parse(localStorage.getItem("Dessert"));

    //This Function can Display Different Categories Pizza
    showPizzaData("#Bestsellers", Bestsellers);
    showPizzaData("#VegPizza", VegPizza);
    showPizzaData("#NonVegPizza", NonVegPizza);
    showPizzaData("#NewLaunches", NewLaunches);
    showOtherData("#MealsCombos", MealsCombos);
    showPizzaData("#PizzaMania", PizzaMania);
    showOtherData("#SpecialityChicken", SpecialityChicken);
    showOtherData("#Sides", Sides);
    showOtherData("#Beverages", Beverages);
    showOtherData("#Dessert", Dessert);
}

//This Function can Display The Pizza
function showPizzaData(Id, Menu_arr) {
    var Menu_str = "";
    $.each(Menu_arr, function(index, Data) {
        Menu_str = Menu_str + ("<div class='col'>" +
            "<div class='card h-100'>" +
            "<img src='" + Data.Img_Src + "' class='card-img-top'>" +
            "<a class='position-absolute top-0 start-0'><img src='" + Data.Pizza_Type + "'width='12px' height='12px'></a>" +
            "<a class='btn position-absolute top-0 end-0' onclick='favorite(" + Data.Id + ',\"' + Data.Img_Src + '\",' + "\"" + Data.Pizza_Type + "\"," + '\"' + Data.Pizza_Name + '\",' + '\"' + Data.Description + '\",' + Data.Price + ")'><img src='https://docs.google.com/uc?id=18JXyZb30fh4Ope5nuQ8OjacLDHiKb80q' alt='favorite'></a>" +
            "<div class= 'card-body'>" +
            "<h5 class='card-title' id='card_title'>" + Data.Pizza_Name + "</h5>" +
            "<p class='card-text text-muted' id='card-text'>" + Data.Description + "</p>" +
            "<hr>" +
            "<div class='card-text d-flex '>" +
            "<p class='d-flex mt-2'>&#8377;&nbsp;<span id='price_" + Data.Pizza_Name + "'>" + Data.Price + "</span></p>" +
            "<select name='Pizza_Size' id='pizzaSize' class='ms-auto h-50 form-select w-50'>" +
            "<option value='1'>Medium</option>" +
            "<option value='2'>Regular</option>" +
            "<option value='3'>Large</option>" +
            "</select>" +
            "</div ><button type='button' class='d-flex mt-2 ms-auto btn btn-outline-success' onclick='addToCart(" + Data.Id + ',\"' + Data.Img_Src + '\",' + "\"" + Data.Pizza_Type + "\"," + '\"' + Data.Pizza_Name + '\",' + '\"' + Data.Description + '\",' + Data.Price + ")' >" +
            "ADD TO CART</button></div></div></div>"
        );
    });
    $(Id).html(Menu_str)
}

//This Function can Display The Other Iteams
function showOtherData(Id, Menu_arr) {
    var Menu_str = "";
    $.each(Menu_arr, function(index, Data) {
        Menu_str = Menu_str + ("<div class='col'>" +
            "<div class='card h-100'>" +
            "<img src='" + Data.Img_Src + "' class='card-img-top'>" +
            "<a class='position-absolute top-0 start-0'><img src='" + Data.Pizza_Type + "'width='12px' height='12px'></a>" +
            "<a class='btn position-absolute top-0 end-0' onclick='favorite(" + Data.Id + ',\"' + Data.Img_Src + '\",' + "\"" + Data.Pizza_Type + "\"," + '\"' + Data.Pizza_Name + '\",' + '\"' + Data.Description + '\",' + Data.Price + ")'><img src='https://docs.google.com/uc?id=18JXyZb30fh4Ope5nuQ8OjacLDHiKb80q' alt='favorite'></a>" +
            "<div class= 'card-body'>" +
            "<h5 class='card-title' id='card_title'>" + Data.Pizza_Name + "</h5>" +
            "<p class='card-text text-muted' id='card-text'>" + Data.Description + "</p>" +
            "<hr>" +
            "<div class='card-text d-flex '>" +
            "<p class='d-flex mt-2'>&#8377;&nbsp;<span id='price_" + Data.Pizza_Name + "'>" + Data.Price + "</span></p>" +
            "<button type='button' class='d-flex mt-2 ms-auto btn btn-outline-success' onclick='addToCart(" + Data.Id + ',\"' + Data.Img_Src + '\",' + "\"" + Data.Pizza_Type + "\"," + '\"' + Data.Pizza_Name + '\",' + '\"' + Data.Description + '\",' + Data.Price + ")' >" +
            "ADD TO CART</button></div></div></div></div>"
        );
    });
    $(Id).html(Menu_str)
}


//This Two Function Toggle Width Of Categories
function openMenuBtn() {
    document.getElementById("categories").style.width = "40%";
}

function closeMenuBtn() {
    document.getElementById("categories").style.width = "0px";
    document.getElementById("manu").style.marginLeft = "0px";
}

// This Function Is Add Pizza To Favorite List
function favorite(Id, Img_Src, Pizza_Type, Pizza_Name, Description, Price) {
    var Favorite = {
        "Id": Id,
        "Img_Src": Img_Src,
        "Pizza_Type": Pizza_Type,
        "Pizza_Name": Pizza_Name,
        "Description": Description,
        "Price": Price
    };

    var Favorite_List = localStorage.getItem("Favorite");

    if (Favorite_List == null) {
        var Favorite_arr = new Array();
        Favorite_arr.push(Favorite);
        localStorage.setItem("Favorite", JSON.stringify(Favorite_arr));
        Favorite_List_Display();
    } else {
        var Old_Favorite_Data = JSON.parse(Favorite_List);
        Old_Favorite_Data.push(Favorite);
        localStorage.setItem("Favorite", JSON.stringify(Old_Favorite_Data));
        Favorite_List_Display();
    }

}

//This Function Display Local Storage Favorite Data
function Favorite_List_Display() {
    var Favorite_List_arr = JSON.parse(localStorage.getItem("Favorite"));
    console.log(Favorite_List_arr);
    var Favorite_str = "";
    $.each(Favorite_List_arr, function(index, Data) {
        Favorite_str = Favorite_str + ("<div class='col'>" +
            "<div class='card h-100'>" +
            "<img src='" + Data.Img_Src + "' class='card-img-top'>" +
            "<a class='position-absolute top-0 start-0'><img src='" + Data.Pizza_Type + "'width='12px' height='12px'></a>" +
            "<a class='btn position-absolute top-0 end-0' onclick='Not_Favorite(" + index + ")'><img src='https://docs.google.com/uc?id=1mmp78hmHez1c50NzxIJ4n6a9qSiZy2oD' alt='favorite'></a>" +
            "<div class= 'card-body'>" +
            "<h5 class='card-title' id='card_title'>" + Data.Pizza_Name + "</h5>" +
            "<p class='card-text text-muted' id='card-text'>" + Data.Description + "</p>" +
            "<hr>" +
            "<div class='card-text d-flex '>" +
            "<p class='d-flex mt-2'>&#8377;&nbsp;<span id='price_" + Data.Pizza_Name + "'>" + Data.Price + "</span></p>" +
            "<select name='Pizza_Size' id='pizzaSize' class='ms-auto h-50 form-select w-50'>" +
            "<option value='1'>Medium</option>" +
            "<option value='2'>Regular</option>" +
            "<option value='3'>Large</option>" +
            "</select>" +
            "</div ><button type='button' class='d-flex mt-2 ms-auto btn btn-outline-success' onclick='addToCart(" + Data.Id + ',\"' + Data.Img_Src + '\",' + "\"" + Data.Pizza_Type + "\"," + '\"' + Data.Pizza_Name + '\",' + '\"' + Data.Description + '\",' + Data.Price + ")' >" +
            "ADD TO CART</button></div></div></div>")
    });
    $("#Favorite_Item").html(Favorite_str);
}

function Not_Favorite(index) {
    var Favorite_Items = JSON.parse(localStorage.getItem("Favorite"));
    Favorite_Items.splice(index, 1);
    localStorage.setItem("Favorite", JSON.stringify(Favorite_Items));
    Favorite_List_Display();
}



//---------------------addToCart() Function----------------
function addToCart(Id, Img_Src, Pizza_Type, Pizza_Name, Description, Price) {
    var cart = {
        "Id": Id,
        "Img_Src": Img_Src,
        "Pizza_Type": Pizza_Type,
        "Pizza_Name": Pizza_Name,
        "Description": Description,
        "Price": Price
    };

    var cartData = localStorage.getItem("Cart Summary");

    if (cartData == null) {
        var addcart = new Array(cart);
        localStorage.setItem("Cart Summary", JSON.stringify(addcart));
        console.log(JSON.parse(localStorage.getItem("Cart Summary")));
        addCartItems();
    } else {
        var oldData = JSON.parse(cartData);
        oldData.push(cart);
        localStorage.setItem("Cart Summary", JSON.stringify(oldData));
        addCartItems();
    }

}

//Display Cart Items Dynamically
function addCartItems() {
    var cartValue = JSON.parse(localStorage.getItem("Cart Summary"));
    var cart_str = "";
    $.each(cartValue, function(index, Data) {
        cart_str = cart_str + ("<div class='row g-0'>" +
            "<div class='col-4 d-flex flex-column justify-content-between'> " +
            "<img src='" + Data.Img_Src + "' class='img-fluid rounded-start mt-4 ms-1 p-0' alt='pizza_img'>" +
            "<a onclick='removeCartItems(" + Data.Id + ")' class='btn'><img src='https://docs.google.com/uc?id=1BFWRCWHTsxUQBUzunKAbJMsQSwVOSUQP' alt='trash_can' class='me-4 mb-4' width='20px'></a></div>" +
            "<div class='col-8'><div class='card-body'>" +
            "<p class='card-title' id='card_title'>" + Data.Pizza_Name + "<img src='" + Data.Pizza_Type + "' class='ms-2 mb-1' width='12px' height='12px'></p>" +
            "<p class='card-text text-muted' id='card-text'>" + Data.Description + "</p>" +
            "<hr><div class='card-text d-flex '>" +
            "<p class='mt-2'>&#8377;&nbsp;<span id='price'>" + Data.Price + "&nbsp;</span></p>" +
            "<div id='pizza_Size' class='ms-auto mt-2'>Medium</div>" +
            "</div></div></div></div>" +
            "<div style='border: 2px dotted rgb(156, 150, 150);'></div>");
    });
    $(".Shopping_Cart").html(cart_str);
    Subtotal();
}



//---------------------removeCartItems() Function----------------
//It Removes Cart Items Dynamically
function removeCartItems(Id) {
    var cart_arr = JSON.parse(localStorage.getItem("Cart Summary"));
    console.log("inside remove cart fun");
    console.log(cart_arr);
    console.log(cart_arr.length);

    for (var i = 0; i < cart_arr.length; i++) {

        if (cart_arr[i].Id == Id) {
            console.log("inside if")
            console.log(i);
            console.log(cart_arr[i]);
            cart_arr.splice(i, 1)
            console.log("end if")
        }
    }
    console.log(cart_arr);

    localStorage.setItem("Cart Summary", JSON.stringify(cart_arr));
    addCartItems();
    Subtotal();
}

//This Subtotal() Function Calculate Subtotal Dynamically
function Subtotal() {
    var cart_Total = JSON.parse(localStorage.getItem("Cart Summary"));
    var Total = 0;

    if (cart_Total != null) {
        console.log("inside if");
        for (let j = 0; j < cart_Total.length; j++) {
            console.log("for");
            Total = Total + cart_Total[j].Price;
            $(".subtotal_price").html(Total);
            localStorage.setItem("Subtotal", Total);
        }
        if (cart_Total.length == 0) {
            Total = 0;
            $(".Shopping_Cart").html("<img src='https://docs.google.com/uc?id=1zJlfJLNsi26xJ35d88Tb2UoTmAxYYEH0' width='100%' alt='Empty_cart'>")
            $(".subtotal_price").html(Total);
            localStorage.setItem("Subtotal", Total);
        }

    } else {
        $(".subtotal_price").html(Total);
        $(".Shopping_Cart").html("<img src='https://docs.google.com/uc?id=1zJlfJLNsi26xJ35d88Tb2UoTmAxYYEH0' width='100%' alt='Empty_cart'>")
        localStorage.setItem("Subtotal", Total);
    }
}

//This Function Add Pizza In Pizza-Categories

function addPizza(category, Pizza_Name, Pizza_Description, Pizzaprice, Pizza_Img_Src) {

    var Menu_List = JSON.parse(localStorage.getItem("Menu"));
    Id_cat = "#" + category;

    if (document.getElementById("Veg").checked) {
        var Pizza_Type = "https://docs.google.com/uc?id=1O-YlCvu6OSKx2ymKPy7qBzmOeV_nNjDH";
    }
    if (document.getElementById("Nonveg").checked) {
        var Pizza_Type = "https://docs.google.com/uc?id=1wvdcu7_CRbIsO1f1fFzDYv_I-WiSbFGB";
    }

    var Menu_arr = JSON.parse(localStorage.getItem(category));

    // It Get Last Array Item Id And Add 1
    var Pizza_Id = Menu_arr[Menu_arr.length - 1].Id + 1;

    var Pizza = {
        "Id": Pizza_Id,
        "Img_Src": Pizza_Img_Src,
        "Pizza_Type": Pizza_Type,
        "Pizza_Name": Pizza_Name,
        "Description": Pizza_Description,
        "Price": Pizzaprice
    };

    // Here Update Pizza category And Also Update Into Localstorage
    Menu_arr.push(Pizza);
    localStorage.setItem(category, JSON.stringify(Menu_arr));
    var New_Menu = JSON.parse(localStorage.getItem(category));
    console.log(New_Menu);

    //Check Category And Then Show Related Structure Data
    if (category == "Bestsellers" || category == "VegPizza" || category == "NonVegPizza" || category == "NewLaunches" || category == "PizzaMania") {
        showPizzaData(Id_cat, New_Menu);
    }
    if (category == "MealsCombos" || category == "SpecialityChicken" || category == "Sides" || category == "Beverages" || category == "Dessert") {
        showOtherData(Id_cat, New_Menu);
    }

}

//This Function Store User Order Related Data in Local Storage
function Order(Address) {
    var userName = localStorage.getItem("LoginUser");
    var ContactNumber = localStorage.getItem("Contact Number");
    var Total = localStorage.getItem("Subtotal")

    if (document.getElementById("Delivery").checked) {
        var PizzaDelivery = "Delivery";
    }
    if (document.getElementById("PickUp_Dinein").checked) {
        var PizzaDelivery = "Pick Up/Dine-in";
    }

    var cart_item = JSON.parse(localStorage.getItem("Cart Summary"));
    localStorage.removeItem("Cart Summary")

    var cart_str = "";
    $.each(cart_item, function(index, Data) {
        cart_str = cart_str + Data.Pizza_Name + " , ";
    });

    var Order = {
        "UserName": userName,
        "ContactNumber": ContactNumber,
        "Address": Address,
        "PizzaDelivery": PizzaDelivery,
        "Total": Total,
        "Cart_Items": cart_str
    }

    var Data = localStorage.getItem("Order");
    if (Data == null) {
        var Order_arr = new Array();
        Order_arr.push(Order);
        localStorage.setItem("Order", JSON.stringify(Order_arr));
    } else {
        var Old_Order_arr = JSON.parse(Data);
        Old_Order_arr.push(Order);
        localStorage.setItem("Order", JSON.stringify(Old_Order_arr));
    }

}


//Check User Role Show Their Related Details
function getUserInfo() {
    var userName = localStorage.getItem("LoginUser");
    var contactNumber = localStorage.getItem("Contact Number");
    var role = localStorage.getItem("Role");

    $("#userName").html(userName);
    $("#contactNumber").html(contactNumber);

    if (role == "user") {
        $("#role").hide();
        // $("#role").css("display", "none");
    }
}

//If User LogOut Then All Local Storage is Clear
function clearUserData() {
    localStorage.clear();
}