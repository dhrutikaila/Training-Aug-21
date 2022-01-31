function getData()
{
    fetch('http://127.0.0.1:5500/Day6/Practice/task1.json').then((result)=>
    {
        return result.json();
    })
    .then((res)=>
    {
        var table = document.getElementById('myTable');
        // res.forEach((obj) => {
        //     var row = getElement(obj);
        //     table.appendChild(row);
        // });
        var data = JSON.stringify(res);
        localStorage.setItem("product_data",data);
        location.href = "./task2.html"; 
    })
    .catch((error)=>
    {
        console.log(error);
    })
}

function getElement(obj)
{
    var row = document.createElement("tr");
    var td1 = document.createElement("td");
    var td2 = document.createElement("td");
    var td3 = document.createElement("td");
    // console.log(obj[1].Name);
    var td1text = document.createTextNode(obj.Name);
    var td2text = document.createTextNode(obj.price);
    var td3text = document.createTextNode(obj.Location);

    td1.appendChild(td1text);
    td2.appendChild(td2text);
    td3.appendChild(td3text);
    row.appendChild(td1);
    row.appendChild(td2);
    row.appendChild(td3);
    return row;
}