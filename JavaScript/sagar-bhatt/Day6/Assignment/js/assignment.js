document.body.onload = () => {
  // * Fetch Data
  const url = "../json/products-data.json";
  async function getProducts(url) {
    let products = await fetch(url);
    let data = await products.json();
    let key = Object.keys(data)[0];
    let values = Object.values(data)[0];
    localStorage.setItem(key, JSON.stringify(values));
  }
  getProducts(url);

  const products = JSON.parse(localStorage.getItem("products"));
  const displayProducts = document.getElementById("displayProducts");
  const tr = document.createElement("tr");
  displayProducts.appendChild(tr);

  // * Table Heading
  const thCount = document.createElement("th");
  tr.appendChild(thCount);
  thCount.append("Item");
  for (let items in products[0]) {
    const th = document.createElement("th");
    tr.appendChild(th);
    const tdTextNode = document.createTextNode(items);
    th.appendChild(tdTextNode);
  }
  const thCart = document.createElement("th");
  tr.appendChild(thCart);
  thCart.append("Add to cart");

  let count = 0;
  // * Table Data
  for (let items of products) {
    const tr = document.createElement("tr");
    displayProducts.appendChild(tr);
    count++;
    const tdCount = document.createElement("td");
    tr.appendChild(tdCount);
    tdCount.append(count);
    for (let item in items) {
      const td = document.createElement("td");
      td.classList.add("p-2");
      const textNode = document.createTextNode(items[item]);
      td.append(textNode);
      tr.appendChild(td);
    }
    const btnCart = document.createElement("button");
    const btnText = document.createTextNode("Add to Cart");
    btnCart.classList.add("btn", "btn-outline-dark");
    btnCart.appendChild(btnText);
    tr.appendChild(btnCart);

    btnCart.onclick = (event) => {
      event.preventDefault();
      const key = "cartItems";
      let cartProducts = JSON.parse(localStorage.getItem(key));
      let data = items;
      if (cartProducts) {
        let count = 0;
        for (let i of cartProducts) {
          if (i["Name"] == data["Name"]) {
            count++;
          }
        }
        if (count > 0) {
          console.log(`%c ${data["Name"]} is already there.`, `color:yellow`);
        } else {
          cartProducts.push(data);
          cartProducts = JSON.stringify(cartProducts);
          localStorage.setItem(key, cartProducts);
        }
      } else {
        newCartProducts = [];
        newCartProducts.push(data);
        cartProducts = JSON.stringify(newCartProducts);
        localStorage.setItem(key, cartProducts);
      }
    };
  }
  // * Display Data in console
  console.group(`%c Products Data:`, `color:orange`);
  console.table(products);
  console.groupEnd();

  // * Cart Summary
  let btnCartSummary = document.getElementById("btnCartSummary");
  btnCartSummary.onclick = () => {
    let cartItems = JSON.parse(localStorage.getItem("cartItems"));
    if (!cartItems) {
      console.log(`%c Your cart is empty!`, `color:yellow`);
    } else {
      console.group(`%c Cart Summary:`, `color:orange`);
      for (let i of cartItems) {
        console.log(
          `%c Name: %c ${i.Name}`,
          `color:lightgreen`,
          `color:lightyellow`
        );
        console.log(
          `%c Price: %c ${i.Price}`,
          `color:lightgreen`,
          `color:lightyellow`
        );
        console.log(
          `%c Location: %c ${i.Location}`,
          `color:lightgreen`,
          `color:lightyellow`
        );
        console.log(`\n`);
      }
      console.table(cartItems);
      console.groupEnd();
    }
  };
};
