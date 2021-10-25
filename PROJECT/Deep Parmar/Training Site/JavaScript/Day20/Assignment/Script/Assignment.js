async function tableData(){
    var response = await fetch("http://127.0.0.1:5501/JavaScript/Deep%20Parmar/Day20/Assignment/Script/Assignment.json");
    var jsonData=await response.json(); //Store json Data in jsonData variable
    // console.log(jsonData);

    jsonData.forEach((object,index) => {
        let table=document.getElementById("table");
        let tr=document.createElement("tr");
        let td1=document.createElement("td");
        let td2=document.createElement("td");
        let td3=document.createElement("td");
        let td4=document.createElement("td");
        let td5=document.createElement("td");
        let addToCart=document.createElement("button");
        addToCart.addEventListener("click",storeData);
        addToCart.setAttribute("class","btn btn-outline-primary my-2");
        addToCart.setAttribute("id",index);


        //Add data to in table
        td1.innerHTML=object.ProductID;
        td2.innerHTML=object.ProductName;
        td3.innerHTML=object.Price;
        td4.innerHTML=object.Quantity;
        addToCart.innerHTML="Add to Cart";

        table.appendChild(tr);
        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td3);
        tr.appendChild(td4);
        tr.appendChild(td5);
        td5.appendChild(addToCart);

    });

    function storeData(event){
        if(localStorage.ProductDetails)
        {
            var productData=new Array(localStorage.getItem("ProductDetails"));//Here First Fetch The Data in ProductDetails key
            if(jsonData[event.target.id].Quantity > 0)
            {
                productData.push(JSON.stringify(jsonData[event.target.id]));//Push New Data 
                localStorage.setItem("ProductDetails",productData);//store Data in localstorage 
                jsonData[event.target.id].Quantity=jsonData[event.target.id].Quantity-1; //it decrease quantity by 1 after store data in cart
            }
            else{
                alert("Prouct is Out Of Stock");
            }
        }
        else{
            localStorage.setItem("ProductDetails", JSON.stringify(jsonData[event.target.id]));
            jsonData[event.target.id].Quantity=jsonData[event.target.id].Quantity-1;
        }
    }

}

function displayCart()
{

    if(localStorage.ProductDetails)
    {
        // var product= JSON.parse(localStorage.getItem("ProductDetails"));
        // console.table(product);
        
        console.log(localStorage.getItem("ProductDetails"));
    }
    else{
        alert("Your Cart is Empty Please Add Some item..");
    }
}