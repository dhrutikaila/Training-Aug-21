/* JavaScript Variables */

var a = 3;
let b = 3;
const PI = 3.14;

/* Data types */

// Primitive values

//number
var num = 2;
//float numbers
var dcNum = 10.098;
//string
var firstName = "Raviraj";
//boolean
var isNull = false;
//undefined and null
var z = undefined;

//bigint
var powewint = 2 ** 56;
var powerb = 2n ** 56n;

//non -primitive

//array
var arr = new Array(2, 2, 3, 4, 5, 5);
console.log(arr);

//object
var person = {
  firstName: "Raviraj",
  lastName: "padhiyar",
  phoneNumber: "9265914306",
};

var person2 = new Object({
  firstName: "Sagar",
  lastName: "padhiyar",
  phoneNumber: "9265914306",
});

console.log(person);

/* Functions */

//function

function Addition(a, b) {
  return a + b;
}

console.log(Addition(1, 2));

//function expression

var n1 = function (a, b) {
  return a + b;
};

console.log(n1(2, 7));

// Conditional construct

//if else
var condition = true;
if (condition) console.log("hello from inside");
else {
  console.log("hello from else");
}

//condition expression

a = 2;
b = 5;
var max = a > b ? a : b;
console.log(max);

//switch case

var marks = 89;
var grad = parseInt(marks / 10) + 1;

switch (grad) {
  case 10:
    console.log("A");
    break;
  case 9:
    console.log("B");
    break;
  default:
    console.log("default");
    break;
}

// For/While/foreach Loop
//while loop
var i = 10;
while (i > 0) {
  console.log("hello world");
  i -= 1;
}

//for loop

for (var i = 0; i < 10; i++) {
  console.log("hello world");
}

// advance forloops

arr = [1, 2, 3, 4, 5, 6, 7, 8];
//in operator

for (i in arr) {
  console.log(arr[i]);
}

//for of

for (var i of arr) {
  console.log(i);
}

//for on object

var obj = {
  firstName: "Raviraj",
  lastName: "padhiyar",
};

for (key in obj) {
  console.log(obj[key]);
}

for (key in obj) {
  console.log(key, obj[key]);
}

// for (var key of obj) {
//   console.log(key, obj[key]);
// }
//gives error cuz of uses an iterable object like indexec of array while forin uses values

// Array
//array is list of element

//array of numbers
arr = [1, 2, 3, 4, 5];
arr = new Array(1, 2, 3, 4, 5, 6);
//array of strings
arr = new Array("one", "two", "three");
//array of mix datatypes
arr = new Array("one", 2, "Three");

// Methods
// insertion methods
arr = new Array(1, 2, 3, 4);

arr.push(5); // insert element at last position
arr.unshift(6); // insert element at first position
arr.pop(); //remove element from last pos
arr.shift; // remove element form first position

var str1 = "hello";
var str2 = "world!";

console.log(str1.concat(" ", str2));

// Events
// alert("this thing called first");

function init() {
  alert("body elemetn has loaded succesfully");
}

// Upting the content of elements
const header = document.getElementById("header");

header.innerHTML += " world!";

// Debugging
//performed through vs code and chrome dev tools
