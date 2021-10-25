var data = [
  {
    productId: 1,
    ProductName: "Cheese",
    price: 100,
    quantity: 1,
  },
  {
    productId: 2,
    ProductName: "Pen",
    price: 150,
    quantity: 2,
  },
  {
    productId: 3,
    ProductName: "Butter",
    price: 100,
    quantity: 1,
  },
  {
    productId: 4,
    ProductName: "Pencil",
    price: 10,
    quantity: 1,
  },
];
console.log(data);
function createTable() {
  var table = document.getElementById("myTable");
  data.forEach((obj, idx) => {
    var row = createElement(obj, idx);
    table.appendChild(row);
  });
}

function createElement(obj, idx) {
  var tr = document.createElement("tr");
  for (let value in obj) {
    let td = document.createElement("td");
    td.innerText = obj[value];
    tr.appendChild(td);
  }

  var td5 = document.createElement("td");
  var button = document.createElement("button");

  button.innerText = "Add to Cart";
  td5.appendChild(button);
  button.setAttribute("id", idx);
  button.setAttribute("class", "btn btn-secondary");
  button.addEventListener("click", addToLocal);
  tr.appendChild(td5);
  return tr;
}

function addToLocal(evt) {
  if (localStorage.selected_data) {
    var availableData = new Array(localStorage.getItem("selected_data"));
    availableData.push(data[evt.target.id].ProductName);
    localStorage.setItem("selected_data", availableData);
  } else {
    localStorage.setItem("selected_data", data[evt.target.id].ProductName);
  }
}

function getData() {
  if (localStorage.selected_data) {
    var availableData = new Array(localStorage.getItem("selected_data"));
    document.getElementById("data_localstorage").innerText = availableData;
  } else {
    document.getElementById("data_localstorage").innerText =
      "Your cart empty!!!! ";
  }
}
