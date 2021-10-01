/* DOM selection */

const box = document.getElementById("box");

console.log(box);
console.log(typeof (box));

const box1 = document.querySelector("#box");

console.log(box);
console.log(typeof (box));

box.style.border = "1px solid black";
box.style.height = "100px";


//get element by tag name
const header = document.getElementsByTagName("h1");
console.log(header);


//get elements by class name
const heading = document.getElementsByClassName("heading");
console.log(heading);


//tag and class get methods are used for multiple elements;
//return HTMLCollection


//query selector methods

//single elements
const orderlist = document.querySelector("ol");
console.log(orderlist);

const list = document.querySelector("li");
console.log(list); //chooses first element with tag li

//multiple elements
const lists = document.querySelectorAll("li");
console.log(lists);


// every valid css seletor can be passed as query slector arguments

/* DOM Manipulation */

//changing content

const text_block = document.getElementById("text");

const textContentTag = document.createElement("p");
const textContentDet = document.createTextNode("Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, veniam.");


textContentTag.appendChild(textContentDet);

text_block.appendChild(textContentTag);

//best way to change html conetnt is to use html content

const intro = document.getElementById("introduction");

intro.innerHTML = "<b>bold text</b> in the paragraph";



//chaning attribute and css

text_block.classList.add("text-center");
text_block.style.color = "red";

text_block.style = "border: 3px solid black";



//event

function alertall() {
    alert("hello");
}

const btn = document.getElementById("btn")
btn.onclick = alertall;



//using addEventListener method
btn.addEventListener("click", () => {
    alert("you clicked me!")
})


//navigation

//between  nodes

/* parentNode
childNodes[nodenumber]
firstChild
lastChild
nextSibling
previousSibling
*/

let container = document.querySelector(".container");

console.log(container);

console.log(container.children); //return html collection return 2 element
console.log(container.childNodes); // return nodes list return 5 element

console.log(container.firstChild);
console.log(container.parentNode);
console.log(container.lastChild);
console.log(container.nextSibling);

//windows methods

console.log(window.innerWidth);
console.log(window.outerWidth);

//there tons window propety we can use in manipulation

//other useful property

// window.open("https://www.w3schools.com");

// window.close();

function openWin() {
    myWindow = window.open("", "", "width=250, height=250");
    myWindow.document.write("<h1>hello</h1>")
}

function moveWinTo() {
    myWindow.moveTo(150, 150);
    myWindow.focus();
}

function moveWinBy() {
    myWindow.moveBy(75, 50);
    myWindow.focus();
}

// loction

console.log(window.location.href)

//history

// window.history.back();
// window.history.forward();

function moveBack() {
    window.history.back();
}

