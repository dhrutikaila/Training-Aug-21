var cartItem = [];
var products = [
  { ProductID: 1, ProductName: "Cheese", Price: 100, Quantity: 1 },
  { ProductID: 2, ProductName: "Pen", Price: 150, Quantity: 2 },
  { ProductID: 3, ProductName: "Butter", Price: 100, Quantity: 1 },
  { ProductID: 4, ProductName: "Pencil", Price: 10, Quantity: 1 },
];
function AddToCart(item) {
  if (item == 1) {
    cartItem.push(products[0]);

    localStorage.setItem("Products", JSON.stringify(cartItem));
  }
  else if (item == 2) {
    cartItem.push(products[1]);

    localStorage.setItem("Products", JSON.stringify(cartItem));

  }
  else if (item == 3) {
    cartItem.push(products[2]);

    localStorage.setItem("Products", JSON.stringify(cartItem));

  } else if (item == 4) {
    cartItem.push(products[3]);

    localStorage.setItem("Products", JSON.stringify(cartItem));

  }
}

function Summary() {
  console.log(JSON.parse(localStorage.getItem("Products")));
}
