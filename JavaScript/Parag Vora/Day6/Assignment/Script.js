
var myArray = 
[
    {
        "ProductId" : 1,
        "ProductName" : "Cheese",
        "Price" : 100,
        "Quantity" : 1
    },
    {
        "ProductId" : 2,
        "ProductName" : "Pen",
        "Price" : 150,
        "Quantity" : 2
    },
    {
        "ProductId" : 3,
        "ProductName" : "Butter",
        "Price" : 100,
        "Quantity" : 1
    },
    {
        "ProductId" : 4,
        "ProductName" : "Pencil",
        "Price" : 10,
        "Quantity" : 1
    }
]

function buildTable(data)
{
    var table =  document.getElementById('myTable');
    for (var i=0;i<data.length;i++)
    {
        var row = `<tr>
                        <td>${data[i].ProductId}</td>
                        <td>${data[i].ProductName}</td>
                        <td>${data[i].Price}</td>
                        <td>${data[i].Quantity}</td>
                        <td><input type="checkbox" value = ${data[i].ProductId} onchange ="addToCart(${data[i].ProductId})"></td>
                  </tr>`
        table.innerHTML +=row;    
    }
}

function addToCart(rowid)
{
    // console.log(myArray.filter(r => r.ProductId == rowid));
    var localdata =myArray.filter(r => r.ProductId == rowid);
    var getaddcart = localStorage.getItem("product_data");
    if(getaddcart == null)
    {
        localStorage.setItem("product_data","" + JSON.stringify(localdata) );
    }
    else
    {

        localStorage.setItem("product_data",getaddcart + JSON.stringify(localdata) );
    }


}
function cartSummary()
{
    console.log(localStorage.getItem('product_data'));
}
localStorage.clear();