function getData() {

  fetch("http://127.0.0.1:5500/data.json")
    .then((result) => {
      return result.json();
    })
    .then((res) => {
        var data = JSON.stringify(res);
        sessionStorage.setItem("Employee_Data",data);
        location.href = "./displaydata.html";
    //   var table = document.getElementById("myTable");

    //   res.forEach((obj) => {
    //     var row = getElement(obj);
    //     table.appendChild(row);
    //   });
    })  
    .catch((error) => {
      console.log(error);
    });
}

function getElement(obj) {
    var row = document.createElement("tr");
    var td1 = document.createElement("td");
    var td2 = document.createElement("td");
    var td3 = document.createElement("td");
    var td1Text = document.createTextNode(obj.id);
    var td2Text = document.createTextNode(obj.name);
    var td3Text = document.createTextNode(obj.colleg);

    td1.appendChild(td1Text);
    td2.appendChild(td2Text);
    td3.appendChild(td3Text);
    row.appendChild(td1);
    row.appendChild(td2);
    row.appendChild(td3);
    return row;
}
