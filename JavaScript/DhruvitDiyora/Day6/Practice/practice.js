function getData() {
  fetch("http://127.0.0.1:5500/Practice/products.json")
    .then((result) => {
      return result.json();
    })
    .then((res) => {
      console.log(res.products);
      var datas = JSON.stringify(res.products);

      console.log(datas);
      localStorage.setItem("Products", datas);
      //location.href = "../displaydata.html";
      var table = document.getElementById("table");
      res.products.forEach((obj) => {
        console.log(obj);
        var row = getElement(obj);
        table.appendChild(row);
      });
    })
    .catch((error) => {
      console.log(error);
    });
}
function displaydata() {
  localStorage.getItem("Products");
  var table = document.getElementById("table");
  res.products.forEach((obj) => {
    console.log(obj);
    var row = getElement(obj);
    table.appendChild(row);
  });
}
function getElement(obj) {
  var row = document.createElement("tr");
  var td1 = document.createElement("td");
  var td2 = document.createElement("td");
  var td3 = document.createElement("td");
  var td1Text = document.createTextNode(obj.Name);
  var td2Text = document.createTextNode(obj.Price);
  var td3Text = document.createTextNode(obj.Location);

  td1.appendChild(td1Text);
  td2.appendChild(td2Text);
  td3.appendChild(td3Text);
  row.appendChild(td1);
  row.appendChild(td2);
  row.appendChild(td3);
  return row;
}
