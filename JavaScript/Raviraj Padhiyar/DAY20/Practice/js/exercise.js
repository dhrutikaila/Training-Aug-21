function storeData() {
    myLocalStorage = window.localStorage;

    myLocalStorage.setItem("products_data", "{ “products” : [   { “Name”: “Cheese”, “Price” : 2.50, “Location”: “Refrigerated foods”},   { “Name”: “Crisps”, “Price” : 3, “Location”: “the Snack isle”},   { “Name”: “Pizza”, “Price” : 4, “Location”: “Refrigerated foods”},   { “Name”: “Chocolate”, “Price” : 1.50, “Location”: “the Snack isle”},   { “Name”: “Self-raising flour”, “Price” : 1.50, “Location”: “Home baking”},   { “Name”: “Ground almonds”, “Price” : 3, “Location”: “Home baking”} ]} ");

    let data = myLocalStorage.getItem("products_data");
    console.log(data);
}



// Keep above JSON Data into a file, using Web Fetch API read that data.


const btn = document.getElementById("btn-fetch");

btn.addEventListener("click", () => {
    fetch("http://127.0.0.1:5500/Practice/data.json")
        .then(res => res.json())
        .then(data => data.products.map(item => addData(item)));
})

const tbody = document.getElementById("tbody");

function addData({ Name, Price, Location }) {
    tbody.innerHTML +=
        `<td>${Name}</td>
        <td>${Price}</td>
        <td>${Location}</td>`
}

