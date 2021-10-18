//Store items in local storage
function addItems(id)
{
    fetch("http://127.0.0.1:5500/Day6/Assignment/products.json")
    .then((response)=>{
        return response.json();
    })
    .then((jsondata)=>{
        
        let products = [];
        if(localStorage.getItem('products'))
        {
            products = JSON.parse(localStorage.getItem('products'));
        }
        products.push({'ProductId' : jsondata.products[id-1].ProductId,
                       'ProductName': jsondata.products[id-1].ProductName,
                       'Price':jsondata.products[id-1].Price ,
                       'Quantity':jsondata.products[id-1].Quantity});
        
        localStorage.setItem('products', JSON.stringify(products));
    })
    .catch((error)=>{
        console.log(error);
    })
}

//display cart summary in console
function cart()
{
    var x = localStorage.getItem('products');
    console.log("Cart Summary : "+x);
}

