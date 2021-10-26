// Practice_Exercise2

// Var Keyword
var x = 10; // global scope

if(true) {
    var x = 20; //local scope
    var outputX1 = document.getElementById("outputX1");
    outputX1.innerHTML = "x is: " + x;
    console.log(outputX1);
}
var outputX2 = document.getElementById("outputX2");
outputX2.innerHTML = "x is: " + x;
console.log(outputX2);

// Let Keyword
let y = 10; // global scope

if(true) {
    let y = 20; //local scope
    var outputX3 = document.getElementById("outputX3");
    outputX3.innerHTML = "y is: " + y;
    console.log(outputX3);
}
var outputX4 = document.getElementById("outputX4");
outputX4.innerHTML = "y is: " + y;
console.log(outputX4);