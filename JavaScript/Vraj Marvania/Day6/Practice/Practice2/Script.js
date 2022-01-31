// fetch json data and store in a table

async function jdata() {
  fetch("jsondata.json")
    .then((result) => {
      return result.json();
    })
    .then((res) => {
      for (i in res.products) {
        set(res.products[i]);
        console.log(res.products[i])
      }
    });
}
jdata();

function set(info) {
    var table = document.getElementById('tab');
    var row = document.createElement("tr");
    var td1 = document.createElement("td");
    var td2 = document.createElement("td");
    var td3 = document.createElement("td");

    var td1text = document.createTextNode(info.Name);
    var td2text = document.createTextNode( info.Price);
    var td3text = document.createTextNode(info.Location);

    td1.appendChild(td1text);
    td2.appendChild(td2text);
    td3.appendChild(td3text);
    row.appendChild(td1);
    row.appendChild(td2);
    row.appendChild(td3);
    table.appendChild(row);

}
