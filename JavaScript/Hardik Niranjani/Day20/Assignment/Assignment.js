var jsonData = [
    {
        ProductId: 1,
        ProductName: "Cheese",
        Price: 100,
        Quantity: 1,
    },
    {
        ProductId: 2,
        ProductName: "Pen",
        Price: 150,
        Quantity: 2,
    },
    {
        ProductId: 3,
        ProductName: "Butter",
        Price: 100,
        Quantity: 1,
    },
    {
        ProductId: 4,
        ProductName: "Pencil",
        Price: 10,
        Quantity: 1,
    }
];

 function table_data() {
    var table = document.getElementById("table_formate");
    jsonData.forEach((obj, index) => {
        var tr = document.createElement("tr");
        var data1 = document.createElement("td");
        var data2 = document.createElement("td");
        var data3 = document.createElement("td");
        var data4 = document.createElement("td");
        var data5 = document.createElement("td");
        var cartButton = document.createElement("button");
        cartButton.setAttribute("id", index);
        cartButton.addEventListener("click", save_data);


        data1.innerHTML = obj.ProductId;
        data2.innerHTML = obj.ProductName;
        data3.innerHTML = obj.Price;
        data4.innerHTML = obj.Quantity;
        cartButton.innerHTML = "Add To Cart";
        cartButton.style['background']  = 'lightblue';
        cartButton.style['border']  = 'none';
        
        data5.appendChild(cartButton);
        tr.appendChild(data1);
        tr.appendChild(data2);
        tr.appendChild(data3);
        tr.appendChild(data4);
        tr.appendChild(data5);
        table.appendChild(tr);
    })
}

//FUNCTION TO SAVE DATA INTO localStorage
function save_data(event) {
    console.log(jsonData);
    if (localStorage.Product_Details) {
        var storeData = new Array(localStorage.getItem("Product_Details"));
        console.log(event.target.id);
        storeData.push(jsonData[event.target.id].ProductName);
        localStorage.setItem("Product_Details", storeData);
    }
    else {
        localStorage.setItem("Product_Details", jsonData[event.target.id].ProductName);
    }
}

//FUNCTION TO PRINT DATA INTO console FROM localStorage
function cart_data() {
    if (localStorage.Product_Details) {
        var getData = localStorage.getItem("Product_Details");
        document.getElementById("result").innerHTML = getData;
    }
    else {
        document.getElementById("result").innerHTML ="Cart is empty";
    }

}