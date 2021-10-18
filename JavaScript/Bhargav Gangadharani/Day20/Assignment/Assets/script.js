var data;
async function loadJson() {
    var file = await fetch('Assets/data.json');
    data = await file.text();
    
    data = JSON.parse(data);

    var tbody = document.getElementById('tbody');

    for(var i=1; i <= data.products.length; i++)
    {
        tbody.innerHTML += '<tr id="row-'+(i-1)+'">\
            <td>'+i+'</td>\
            <td id="name-'+(i-1)+'">'+data.products[i-1].Name+'</td>\
            <td id="price-'+(i-1)+'">'+data.products[i-1].Price+'</td>\
            <td><input class="form-control w-25 text-center mx-auto" type="text" id="quantity-'+(i-1)+'" onkeyup="calculateTotal('+(i-1)+')"></td>\
            <td><button class="btn btn-outline-info" onclick="addItemToCart('+(i-1)+')" id="add-btn-'+(i-1)+'">Add to Cart</button></td>\
            <td id="total-'+(i-1)+'"></td>'
    }
}

function addItemToCart(item) {
    var quantityId = "quantity-"+item;
    var name = "name-"+item;
    var productName = document.getElementById(name).innerHTML;
    console.log(document.getElementById(name).value)
    var quantity = parseFloat(document.getElementById(quantityId).value);
    if(isNaN(quantity) || quantity < 1) {
        alert("Please Enter Quantity");
        return;
    }
    let itemData = {
        "productIndex": item,
        "productName": productName,
        "quantity" : quantity
    }
    if(!localStorage.cartItems) {
            localStorage.setItem('cartItems', JSON.stringify(itemData));
        }
        else {
            localStorage.cartItems += "| " + JSON.stringify(itemData);
        }      
}
   

function viewCartSummary() {
    if(localStorage.cartItems){
            console.log(localStorage.cartItems);
            document.getElementById('cartSummary').innerHTML = '<ul id="items-list"></ul>';
            var grandTotal = 0;
            let itemsData = localStorage.cartItems;
            itemsData = itemsData.split("|");
            itemsData.forEach(item => {
                item = JSON.parse(item);
                document.getElementById('items-list').innerHTML+=
                    '<li>Product: '+ data.products[item.productIndex].Name + 
                    ',<br>Quantity: ' + item.quantity + 
                    ',<br>Total price: ' + (parseFloat(item.quantity) * parseFloat(data.products[item.productIndex].Price)) +
                    '</li><hr>';
                grandTotal += (parseFloat(item.quantity) * parseFloat(data.products[item.productIndex].Price));
            });

            document.getElementById('cartSummary').innerHTML += '<h5>Grand Total: '+ grandTotal + '</h5>';
        }
        else {
            document.getElementById('cartSummary').innerHTML = '<ul id="items-list"></ul><h4>Cart is empty</h4>';
        }    
}

function resetCartSummary() {
    localStorage.removeItem('cartItems');
        if(document.getElementById('items-list')){
            document.getElementById('items-list').innerHTML = "";
        }
        alert("Your cart is reset!")      
}

function calculateTotal(item) {
    var totalId = "total-"+item;
    var total = document.getElementById(totalId);

    var quantityId = "quantity-"+item;
    var quantity = parseFloat(document.getElementById(quantityId).value);
    if(isNaN(quantity) || quantity < 1) {
         total.innerHTML = ""
        return;
    }
    
    var priceId = "price-"+item;
    var price = document.getElementById(priceId).innerHTML;

    total.innerHTML = parseFloat(quantity) * parseFloat(price);
}