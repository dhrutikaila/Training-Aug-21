// Define a function called callback which receives an argument and prints the square of that number.

function square(a) {
    return a * a;
}

function calc(a, callback) {
    console.log(callback(a));
}

calc(10, square);



// Explain difference between var and let keyword using example. 


//we cannot redefine a let variable
var number = 30;       // define
number = 200;          // update
var number = "oranges";//redefine 
// all three line are valid


//let
let num = 100;
num = 200;
// let num = "oranges" //redfine throw error;

//using button example

//we declare 6 buttons node list

const btn = document.querySelectorAll("button"); //btn is nodelist containng all buttons nodes
console.log(btn);
//upon click a particular numbered button
//the number button should be in console.log

for (var i = 0; i < 6; i++) {
    btn[i].addEventListener("click", () => {
        console.log(i);
    })
}

//upon clicke on any button console output only 6

//if we change var with let


for (let i = 0; i < 6; i++) {
    btn[i].addEventListener("click", () => {
        console.log(i + 1);
    })
}

//this whole happen because hoisting & global scope property of var keyword 
//while let is not hoisted and has block scope;




/*  Make a function that takes in a single parameter and returns a new promise. using setTimeout, after 500 milliseconds, the promise will either resolove or reject. if the input is a string, the promise resolves with that reverse string . if the input is anything but a string it rejects with that same input call the function wrong Input */


function myFun(value) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            if (typeof (value) == typeof ("hello")) {
                resolve(value.split("").reverse().join(""));
            }
            else {
                reject("wrong input");
            }
        }, 500);

    });

}

myFun("olleh").then(value => { console.log(value) }, error => console.log(error));;
// myFun(321);