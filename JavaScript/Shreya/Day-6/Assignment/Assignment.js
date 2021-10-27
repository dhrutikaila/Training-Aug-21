async function getdata() {
    var response = await fetch("product.json");
    var jsonData = await response.json();

    jsonData.forEach((object, index) => {
        let table = document.getElementById("tbldata");
        let tr = document.createElement("tr");
        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");
        let td5 = document.createElement("td");
        let cart = document.createElement("button");
        cart.addEventListener("click", storeData);
        cart.setAttribute("id", index);

        td1.innerHTML = object.ProductID;
        td2.innerHTML = object.ProductName;
        td3.innerHTML = object.Price;
        td4.innerHTML = object.Quantity;
        cart.innerHTML = "Add to Cart";

        table.appendChild(tr);
        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td3);
        tr.appendChild(td4);
        tr.appendChild(td5);
        td5.appendChild(cart);

    });

    function storeData(event) {
        if (localStorage.ProductDetails) {
            var productData = new Array(localStorage.getItem("ProductDetails"));
            productData.push(JSON.stringify(jsonData[event.target.id]));
            localStorage.setItem("ProductDetails", productData);
        }
        else {
            localStorage.setItem("ProductDetails", JSON.stringify(jsonData[event.target.id]));
        }
    }

}
function displaydata() {
    if (localStorage.ProductDetails) {

        console.log(localStorage.getItem("ProductDetails"));
    }
    else {
        alert("Your Cart is Empty Please Add Some item..");
    }
}