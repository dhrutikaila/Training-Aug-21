//local storage api

// console.log(window.localStorage);



// console.log(mylocalStorage);



// console.log(mylocalStorage.getItem("name"));

const btn1 = document.getElementById("btn1");
var mylocalStorage = window.localStorage;
var mySessionStorage = window.sessionStorage;

btn1.addEventListener("click", () => {
    mylocalStorage.setItem("name", "Raviraj Padhiyar");
    mySessionStorage.setItem("age", "21");
})

const btn2 = document.getElementById("btn2");

btn2.addEventListener("click", () => {
    console.log(mylocalStorage.getItem("name"));
    console.log(mySessionStorage.getItem("age"));
})

//upon click on btn2 both session data nad storagedata return acccurate value

//upon closing window and after click button we got accurate storagedata value but an undefinded when it comes to sessiondata value;


//geolocation api

const x = document.getElementById("demo");

console.log(navigator.geolocation.getCurrentPosition(showPosition));


function showPosition(position) {
    x.innerHTML = "Latitude: " + position.coords.latitude +
        "<br>Longitude: " + position.coords.longitude;
}



//fetch api

// let objData;
// fetch("https://jsonplaceholder.typicode.com/todos")
//     .then(reponse => reponse.json())
//     .then(data => {
//         objData = data;
//         console.log(data);
//     })
//     .then(console.log(objData))


const btn3 = document.getElementById("btn3");

btn3.addEventListener("click", () => {
    fetch("https://jsonplaceholder.typicode.com/todos")
        .then(reponse => reponse.json())
        .then(res => x.innerHTML = res.map(item => {
            return `<li>${item.title}</li>`
        }).join(""));
})



//fetch using async await

const btn4 = document.getElementById("btn4");

btn4.addEventListener("click", async () => {
    let reponse = await fetch("https://jsonplaceholder.typicode.com/todos");

    if (!reponse.ok) {
        throw new Error(`HTTP error! status: ${reponse.status}`);
    }

    let data = await reponse.json();

    data.map(item => {
        console.log(item);
    })
})

