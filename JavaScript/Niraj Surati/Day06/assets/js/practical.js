//get json and fetch

let file = '../assets/json/products.json';

async function getData(file){
    let fetchDataObj = await fetch(file);
    let data =  await fetchDataObj.text();
    localStorage.setItem('products',data);
}
getData(file);


//display json and parse and table

let jsonData = localStorage.getItem('products');
newJSONData = JSON.parse(jsonData);
console.log(newJSONData);

let tbl = document.createElement('table');
//tbl.className = "table";
tbl.classList.add('table','table-bordered');
let tbl_tr = document.createElement('tr');
let heading = newJSONData.products;
for(let row in heading[0]){
    let tbl_th = document.createElement('th');
    let tbl_th_text = document.createTextNode(row);
    console.log(row);
    tbl_th.appendChild(tbl_th_text);
    tbl_tr.appendChild(tbl_th);
}
tbl.appendChild(tbl_tr);

// for(let row in newJSONData.products){
//     console.log(newJSONData.products[row]);
//     let tblRow = document.createElement('tr');
//     for(let col in newJSONData.products[row]){
//         let tblCol = document.createElement('td');
//         let tblColText = document.createTextNode(newJSONData.products[row][col]);
//         console.log(newJSONData.products[row][col]); 
//         tblCol.appendChild(tblColText);
//         tblRow.appendChild(tblCol);
//     }
//     tbl.appendChild(tblRow);
// }


for(let row of newJSONData.products){
    let tblRow = document.createElement('tr');
    for(let col in row){
        let tblCol = document.createElement('td');
        let tblColText = document.createTextNode(row[col]);
        tblCol.appendChild(tblColText);
        tblRow.appendChild(tblCol);
    }
    tbl.appendChild(tblRow);
}

document.getElementById('tableData').appendChild(tbl);