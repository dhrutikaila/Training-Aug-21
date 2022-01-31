//onload function 
function get_data()
{
    //get value from localstorage
    var localData1 = localStorage.getItem("p1");
    var localData2 = localStorage.getItem("p2");
    var localData3 = localStorage.getItem("p3");
    var localData4 = localStorage.getItem("p4");
    var localData5 = localStorage.getItem("p5");
    
    //concat all string data
    var data = localData1.concat(",", localData2, ",", localData3, ",", localData4, ",", localData5);
    //set data in json format
    var data1 = "[" + data + "]";
    var jsonData = JSON.parse(data1);

    //for loop for calculate total amount to pay
    let totalAmt = 0;
    for (let x in jsonData)
    {
        totalAmt += parseInt(jsonData[x].total);
    }
    
    //for loop for insert data in the table
    let details = " ";
    for (let x in jsonData)
    {
        details += "<tr><td>" + jsonData[x].productId + "</td><td>" + jsonData[x].ProductName + "</td><td>" + jsonData[x].price + "</td><td>" + jsonData[x].quantity + "</td><td>" + jsonData[x].total + "</td></tr>";
    }
    details += "<tr  class = \"table-active\"><th colspan = \"4\"  style=\"text-align: end;\"> Total Amount To Pay : </th><td>" + totalAmt + "</td></tr>";
    document.getElementById("tblBody").innerHTML = details;
    
    
    

//     var table_data = document.getElementById("tblBody");

//     jsonData.forEach((obj) => {
//         var row = getElement(obj);
//         table_data.appendChild(row);
//     });

// }
// function getElement(obj)
// {
//     var row = document.createElement("tr");
//     var td1 = document.createElement("td");
//     var td2 = document.createElement("td");
//     var td3 = document.createElement("td");
//     var td4 = document.createElement("td");
//     var td5 = document.createElement("td");

//     var td1Text = document.createTextNode(obj.productId);
//     var td2Text = document.createTextNode(obj.ProductName);
//     var td3Text = document.createTextNode(obj.price);
//     var td4Text = document.createTextNode(obj.quantity);
//     var td5Text = document.createTextNode(obj.total);

//     td1.appendChild(td1Text);
//     td2.appendChild(td2Text);
//     td3.appendChild(td3Text);
//     td4.appendChild(td4Text);
//     td5.appendChild(td5Text);

//     row.appendChild(td1);
//     row.appendChild(td2);
//     row.appendChild(td3);
//     row.appendChild(td4);
//     row.appendChild(td5);
    
    
}