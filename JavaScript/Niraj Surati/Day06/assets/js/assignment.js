
let file = '../assets/json/practical.json';

async function getData(file){
    let fetchDataObj = await fetch(file);
    let data =  await fetchDataObj.text();
    localStorage.setItem('products',data);
}
getData(file);

//display json and parse and table

let jsonData = localStorage.getItem('products');
newJSONData = JSON.parse(jsonData);

let tbl = document.createElement('table');
//tbl.className = "table";
tbl.classList.add('table','table-bordered');
let tbl_tr = document.createElement('tr');
let heading = newJSONData[0];
for(let row in heading){
    let tbl_th = document.createElement('th');
    let tbl_th_text = document.createTextNode(row);
    tbl_th.appendChild(tbl_th_text);
    tbl_tr.appendChild(tbl_th);
}
tbl.appendChild(tbl_tr);

for(let row of newJSONData){
    let tblRow = document.createElement('tr');
    let tblColBtn = document.createElement('td');
    let btn = document.createElement('button');
    let btnText = document.createTextNode('Add To Cart');
    btn.classList.add('btn','btn-info');
    btn.appendChild(btnText);
    btn.onclick = () =>{
        let cartItem = JSON.parse(localStorage.getItem('cartItem'));
        strData = row;
        if(cartItem){
            cartItem.push(strData);  
            
            cartItem = JSON.stringify(cartItem);
        }
        else{
            cartArray = [];
            cartItem = JSON.stringify(cartArray);
            localStorage.setItem('cartItem',cartItem);
            return btn.onclick();
        }
        localStorage.setItem('cartItem',cartItem);
    }

    tblColBtn.appendChild(btn)
    for(let col in row){
        let tblCol = document.createElement('td');
        let tblColText = document.createTextNode(row[col]);
        tblCol.appendChild(tblColText);
        tblRow.appendChild(tblCol);
    }
    tblRow.appendChild(tblColBtn);
    tbl.appendChild(tblRow);
}

document.getElementById('tableData').appendChild(tbl);

// get summary

function getSummary(){
    let cart = JSON.parse(localStorage.getItem('cartItem'));
    if(!cart){
        console.log('Looks like cart is empty. Start adding now!');
        return;
    }
    let heading = ''
    for(let objRow in cart[0]){
        heading = heading + objRow +'\t'
    }
    console.log('-----------------------------------');
    console.log(heading);
    for(let objRow of cart){
        let data = ''
        for(let objData in objRow){
            data = data + objRow[objData] +'\t'
        }
        console.log(data);
    }
    console.log('-----------------------------------');
}

// Clear Cart

function clearCart(){
    localStorage.removeItem('cartItem');
    console.log('Cart Cleared');
}

