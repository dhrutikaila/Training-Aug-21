// * JS Basics
// * 1.1 Finding HTML Elements
// ? getElementById()
console.log(document.getElementById("h1"));
// ? getElementsByTagName()
console.log(document.getElementsByTagName("button"));
// ? getElementsByClassName()
document.getElementsByClassName("p1")[0].style.border = "1px groove black";
// ? querySelector()
console.log(document.querySelector("button"));
// ? querySelectorAll()
console.log(document.querySelectorAll("button"));

// * 1.2 Changing HTML Elements
// * element.innerHTML =  new html content :	Change the inner HTML of an element
document.getElementById("h1").innerHTML = "sagar bhatt";
// * element.style.property = new style :	Change the style of an HTML element
document.getElementById("h1").style.fontSize = "20px";
hideH1 = () => (document.getElementById("h1").style.display = "none");
showH1 = () => (document.getElementById("h1").style.display = "block");
// * element.setAttribute(attribute, value) :	Change the attribute value of an HTML element
document.getElementById("h1").setAttribute("name", "h1");
// * element.attribute = new value :	Change the attribute value of an HTML element
document.querySelector(".p1").id = "p1";
console.log(document.querySelector(".p1"));

// * 1.3 Adding and Deleting Elements
// * Methods:
const p = document.createElement("p");
const pText = document.createTextNode(
  "Lorem ipsum dolor sit amet consectetur, adipisicing elit."
);
p.appendChild(pText);
document.querySelector("body").appendChild(p);

const H2 = document.querySelector("h2");
document.querySelector("body").removeChild(H2);

const p2 = document.createElement("p");
const p2Text = document.createTextNode("sagar bhatt");
p2.appendChild(p2Text);
document.querySelector("body").appendChild(p2);

const div = document.querySelectorAll("div")[0];
document.querySelector("body").replaceChild(div, p2);

// * 1 Variables
// ? There are 3 ways to declare a JavaScript variable: var, let, const
var varScope = "function scope";
let letScope = "fuction-block scope";
const CONST_SCOPE = "function-block scope";
console.log(varScope, letScope, CONST_SCOPE);

// * 2 Data types
const bool = true; // Boolean
let val = 1.1; // Number
let length = 16; // Number
let lastName = "Sagar"; // String
let und; // und is Undefined
let obj = { firstName: "Sagar", lastName: "Bhatt" }; // Object
const cars = ["Saab", "Volvo", "BMW"]; // Object-Array
let car = null; // Object-Null
func = () => (car = ""); //Function
console.log(
  `typeof operator: bool:${typeof bool}, Val: ${typeof val}, Length: ${typeof length}, Lastname:${typeof lastName}, Und:${typeof und}, Obj:${typeof obj}, Cars:${typeof cars}, Car:${typeof car}, Func:${typeof func}`
);
console.log(
  `isNaN Function: bool:${isNaN(bool)}, Val: ${isNaN(val)},
  Length: ${isNaN(length)}, Lastname:${isNaN(lastName)},
  Und:${isNaN(und)}, Obj:${isNaN(obj)}, Cars:${isNaN(cars)},
  Car:${isNaN(car)}, Func:${isNaN(func)}`
);

// * 3 Functions
sum = (a, b) => a + b;
console.log(sum(1, 1));

// * 4 Conditional Construct
// ? if, else-if, else
let time = 10;
if (time < 10) {
  console.log("Good morning");
} else if (time < 20) {
  console.log("Good day");
} else {
  console.log("Good evening");
}

// ? switch
switch (new Date().getDay()) {
  case 0:
    day = "Sunday";
    break;
  case 1:
    day = "Monday";
    break;
  case 2:
    day = "Tuesday";
    break;
  case 3:
    day = "Wednesday";
    break;
  case 4:
    day = "Thursday";
    break;
  case 5:
    day = "Friday";
    break;
  case 6:
    day = "Saturday";
}
console.log(day);

// * 5 Loops
const array = [1, 2, 3];
for (val of array) console.log(`val of array: ${val}`);
for (val in array) console.log(`val in array: ${val}`);
for (val in array) console.log(`val in array: ${array[val]}`);
console.log(`forEach Loop:`);
array.forEach((value, index, array) =>
  console.log(`Value: ${value} at Index: ${index} from Array: [${array}]`)
);

// * 6 Array
const CARS_1 = ["Saab", "Volvo", "BMW"];
for (value of CARS_1) console.log(value);
const CARS_2 = new Array("Saab", "Volvo", "BMW");
console.log(
  `Array: ${CARS_2}, Length: ${CARS_2.length}, Sorted: ${CARS_2.sort()}`
);
for (value of CARS_2) console.log(value);

// * 7 Events:
// TODO: https://www.w3schools.com/jsref/dom_obj_event.asp
// TODO' https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events#inline_event_handlers_%E2%80%94_dont_use_these

// ? Ways of using web events
// * 1 - Event handler properties
const btnSkyBlue = document.querySelector("#changeBgColorSkyBlue");
btnSkyBlue.onclick = function () {
  const color = "skyblue";
  document.body.style.backgroundColor = color;
};

const btnWhite = document.querySelector("#changeBgColorWhite");
changeBgColorWhite = () => (document.body.style.backgroundColor = "White");
btnWhite.onclick = changeBgColorWhite;

// * 2 - Inline event handlers — don't use these
// <button id="changeColor" onclick="changeColor2();">Change Color</button>
changeColor2 = () => (document.body.style.backgroundColor = "yellow");

// ? Adding and removing event handlers
btnSkyBlue.addEventListener("click", changeColor2);
btnSkyBlue.removeEventListener("click", changeColor2);

// * 8 Upting the content of elements
// ? element.innerHTML =  new html content :	Change the inner HTML of an element
// ? element.innerText =  new html content :	Change the inner Text of an element
// ? element.style.property = new style :	Change the style of an HTML element
// ? element.setAttribute(attribute, value) :	Change the attribute value of an HTML element
// ? element.attribute = new value :	Change the attribute value of an HTML element

console.log(document.querySelector("div").innerText);
console.log((document.querySelector("div").innerText = "sagar bhatt"));

// * 9 Debugging
// TODO: https://www.w3schools.com/js/js_debugging.asp
// ? The debugger keyword stops the execution of JavaScript, and calls (if available) the debugging function.
debugger;
console.log("debugger called!");
