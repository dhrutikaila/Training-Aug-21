const tbody = document.getElementById("tbody");
// console.log(window.localStorage);
myLocalStorage = window.localStorage;
console.log(myLocalStorage);


function fetchData() {

    fetch("http://127.0.0.1:5500/Assignment/products.json")
        .then(res => res.json())
        .then(data => {
            tbody.innerHTML = data.map(item => addData(item)).join("");
            const btn = document.querySelectorAll("td button");
            btn.forEach((element, index) => {
                element.addEventListener("click", () => {
                    // console.log(e.target, index + 1);
                    var localData = JSON.stringify(data[index]);
                    console.log(localData)
                    var localDatakey = index;
                    myLocalStorage.setItem(`${localDatakey}`, `${localData}`);

                })
            });
        })
        .catch(error => console.log(error.status));
}

function addData({ ProductID, ProductName, Price, Quantity }) {
    return `<tr>
    <td>${ProductID}</td>
    <td>${ProductName}</td>
    <td>${Price}</td>
    <td>${Quantity}</td>
    <td><button class="btn btn-primary">Add to Cart</td>
    </tr>`
}

const summaryBtn = document.getElementById("btn-summary");
const totalTextNode = document.getElementById("total");
summaryBtn.addEventListener("click", () => {
    let total = 0;
    for (let i = 0; i < myLocalStorage.length; ++i) {
        let localdata = myLocalStorage.getItem(`${myLocalStorage.key(i)}`);
        localdata = JSON.parse(localdata);
        console.log(localdata);

        // addition print total below summary btn;
        total += parseInt(localdata.Price);
    }
    totalTextNode.innerHTML = total;
})


