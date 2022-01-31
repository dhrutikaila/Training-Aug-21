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
  const thCount = document.createElement("th");
  tr.appendChild(thCount);
  thCount.append("Item");

  // * Table Heading
  for (let items in products[0]) {
    const th = document.createElement("th");
    tr.appendChild(th);
    const tdTextNode = document.createTextNode(items);
    th.appendChild(tdTextNode);
  }

  let count = 0;
  // * Table Data
  for (let items of products) {
    const tr = document.createElement("tr");
    displayProducts.appendChild(tr);
    count++;
    const tdCount = document.createElement("td");
    tr.appendChild(tdCount);
    tdCount.append(count);
    for (item in items) {
      const td = document.createElement("td");
      td.classList.add("p-2");
      const textNode = document.createTextNode(items[item]);
      td.append(textNode);
      tr.appendChild(td);
    }
  }
  // * Display Data in console
  console.group(`%c Products Data:`, `color:orange`);
  console.table(products);
  console.groupEnd();
};
