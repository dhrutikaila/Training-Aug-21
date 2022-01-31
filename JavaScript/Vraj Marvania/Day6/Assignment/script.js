//JSON Data
var pro = [
  {
    ProductID: 1,
    ProductName: "Cheese",
    Price: 100,
    Quantity: 1,
  },
  {
    ProductID: 2,
    ProductName: "Pen",
    Price: 150,
    Quantity: 2,
  },
  {
    ProductID: 3,
    ProductName: "Butter",
    Price: 100,
    Quantity: 1,
  },
  {
    ProductID: 4,
    ProductName: "Pencil",
    Price: 10,
    Quantity: 1,
  },
];

//ADD all products in table row 1 by 1 dynamically
for (i in pro) {
  var table = document.getElementById("Protable");
  var row = document.createElement("tr");
  row.classList.add("table-secondary");
  var td1 = document.createElement("td");
  var td2 = document.createElement("td");
  var td3 = document.createElement("td");
  var td4 = document.createElement("td");
  var td5 = document.createElement("td");

  var td1text = document.createTextNode(pro[i].ProductID);
  var td2text = document.createTextNode(pro[i].ProductName);
  var td3text = document.createTextNode(pro[i].Price);
  var td4text = document.createTextNode(pro[i].Quantity);
  var checkbox = document.createElement("input");   //check box 
      checkbox.type = "checkbox";
      checkbox.value = pro[i].ProductID;    //set productid as value in checkbox
      checkbox.onchange = function () {
        if (this.checked == true) {          
          AddProduct(this.value);       //check call this
        }
        else {
          RemoveProduct(this.value);      
        }
      };

  td1.appendChild(td1text);
  td2.appendChild(td2text);
  td3.appendChild(td3text);
  td4.appendChild(td4text);
  row.appendChild(td1);
  row.appendChild(td2);
  row.appendChild(td3);
  row.appendChild(td4);
  row.appendChild(checkbox);
  table.appendChild(row);
}


//for add new product in cart
function AddProduct(id) {
  if (localStorage.getItem(id) == null) {
    var result = pro.filter((obj) => obj.ProductID == id);
    // console.log(result);
    localStorage.setItem(id, JSON.stringify(result));
  }
}

//for remove product from cart
function RemoveProduct(id) {
  if (localStorage.getItem(id) != null) {
    var result = pro.filter((obj) => obj.ProductID == id);
    if (result != null) {
      localStorage.removeItem(id);
      console.log("removed" + id);
    }
  }
}

//for display cart in console
function showdata() {
  console.log("<----------------My cart------------------->")
   for (x in localStorage){
      if(localStorage.getItem(x)!=null){
      console.log(localStorage.getItem(x));
      }
  }
}


localStorage.clear()