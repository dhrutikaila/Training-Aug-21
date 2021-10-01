/* callback function */

function display(content) {
    document.getElementById("id1").innerHTML = content;
}

// function calc(a, b) {
//     return a + b;
// }

// var result = calc(2, 4);

// display(result);


// here we have to call two function to calculate and display result


function calc(a, b, myCallback) {
    let result = a + b;
    myCallback(result);
}

calc(2, 3, display);

//another example

// function greetings(name) {
//     console.log('Hello ' + name);
// }

// function processUserInput(callback) {
//     var name = prompt("please enter your name");
//     callback(name);
// }

// processUserInput(greetings);



/* What is Asynchronous JavaScript */



const btn = document.querySelector("button");

btn.addEventListener("click", () => {
    let myDate;
    for (let i = 0; i < 10_000_000; i++) {
        let date = new Date();
        myDate = date;
    }

    console.log(myDate);

    let pElem = document.createElement('p');
    pElem.textContent = 'This is a newly-added paragraph.';
    document.body.appendChild(pElem);
})

//another example

const btn2 = document.querySelectorAll("button")[1];

// btn2.addEventListener("click", () => {
//     alert("hello world!");

//     let pElem = document.createElement('p');
//     pElem.textContent = 'This is a newly-added paragraph.';
//     document.body.appendChild(pElem);
// })


btn2.addEventListener("click", () => {
    setTimeout(() => {
        alert("hello world");
    }, 3000);

    let pElem = document.createElement('p');
    pElem.textContent = 'This is a newly-added paragraph.';
    document.body.appendChild(pElem);
})



/* Promises 
JavaScript Promise object contains both the producing code and calls to the consuming code*/

//a simple promice

let myPromise = new Promise((resolve, reject) => {

    let a = 3, b = 0;

    if (b != 0)
        resolve('ok');
    else
        reject("divide by zero error");
});


myPromise.then(value => display(value), error => display(error));





// async await

//function to resolved after 2 seconds

// function resolveAfter2seconds() {
//     return new Promise(resolve => {
//         setTimeout(() => {
//             resolve("resolved");
//         }, 2000);
//     });
// }


async function asyncCall() {
    console.log("called promise");
    const result = await resolveAfter2seconds();
    console.log(result);
}

asyncCall();



async function foo() {
    const result1 = await new Promise((resolve) => setTimeout(() => resolve('1'), 1000));
    const result2 = await new Promise((resolve) => setTimeout(() => resolve('2'), 2000));
}
var result = foo();


// asynce example


function resolveAfter2seconds() {
    console.log("startig slow promise");
    return new Promise(resolve => {
        setTimeout(() => {
            resolve("slow");
            console.log("slow process ended");
        }, 2000);
    })
}

function resolveAfter1seconds() {
    console.log("staring fast promise");
    return new Promise(resolve => {
        setTimeout(() => {
            resolve("fast");
            console.log("fast promise ended");
        }, 1000);
    })
}

//async function 

async function seqStart() {
    console.log("==sq start==");

    const slow = await resolveAfter2seconds();
    console.log(slow);

    const fast = await resolveAfter1seconds();
    console.log(fast);
}

async function concStart() {
    console.log("===conc start ===");

    const slow = resolveAfter2seconds();
    const fast = resolveAfter1seconds();

    console.log(await slow);
    console.log(await fast);
}

