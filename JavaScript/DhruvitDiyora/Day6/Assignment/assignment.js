var cartProducts = [];
var products = [
  { ProductID: 1, ProductName: "Cheese", Price: 100, Quantity: 1 },
  { ProductID: 2, ProductName: "Pen", Price: 150, Quantity: 2 },
  { ProductID: 3, ProductName: "Butter", Price: 100, Quantity: 1 },
  { ProductID: 4, ProductName: "Pencil", Price: 10, Quantity: 1 },
];
function AddToCart(item) {
  if (item == 1) {
    cartProducts.push(products[0]);
    if (sessionStorage.hasOwnProperty("Products")) {
      var localData = sessionStorage.getItem("Products");
      var jsonData = JSON.parse(localData);

      sessionStorage.removeItem("Products");
      sessionStorage.setItem("Products", JSON.stringify(cartProducts));
    } else {
      sessionStorage.setItem("Products", JSON.stringify(cartProducts));
    }
  } else if (item == 2) {
    cartProducts.push(products[1]);
    if (sessionStorage.hasOwnProperty("Products")) {
      var localData = sessionStorage.getItem("Products");
      var jsonData = JSON.parse(localData);
      jsonData.push(products[1]);
      sessionStorage.removeItem("Products");
      sessionStorage.setItem("Products", JSON.stringify(cartProducts));
    } else {
      sessionStorage.setItem("Products", JSON.stringify(cartProducts));
    }
  } else if (item == 3) {
    cartProducts.push(products[2]);
    if (sessionStorage.hasOwnProperty("Products")) {
      var localData = sessionStorage.getItem("Products");
      var jsonData = JSON.parse(localData);
      jsonData.push(products[2]);
      sessionStorage.removeItem("Products");
      sessionStorage.setItem("Products", JSON.stringify(cartProducts));
    } else {
      sessionStorage.setItem("Products", JSON.stringify(cartProducts));
    }
  } else if (item == 4) {
    cartProducts.push(products[3]);
    if (sessionStorage.hasOwnProperty("Products")) {
      var localData = sessionStorage.getItem("Products");
      var jsonData = JSON.parse(localData);
      jsonData.push(products[3]);
      sessionStorage.removeItem("Products");
      sessionStorage.setItem("Products", JSON.stringify(cartProducts));
    } else {
      sessionStorage.setItem("Products", JSON.stringify(cartProducts));
    }
  }
}

function Summary() {
  console.log(JSON.parse(sessionStorage.getItem("Products")));
}
