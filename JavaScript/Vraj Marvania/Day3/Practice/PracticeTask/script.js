// Finding HTML elements by id
var i = document.getElementById("demo1").innerHTML;
console.log(i);

// Finding HTML elements by tag name
const x = document.getElementById("main");
const y = x.getElementsByTagName("p");
console.log(y[0].innerHTML);


// Finding HTML elements by class name
var j = document.getElementsByClassName("demo3")[1].innerHTML;
console.log(j);

// Finding HTML elements by CSS selectors
var m = document.querySelectorAll("h1.demo3");
console.log(m[0].innerHTML);

// Changing HTML Content
document.getElementById("t1").innerHTML = "Changing HTML Content";



// Changing the Value of an Attribute

document.getElementById("t2").src = "https://www.industrialempathy.com/img/remote/ZiClJf-1280w.avif"

// Dynamic HTML content

document.getElementById("time").innerHTML = Date();

// document.write(
document.write("hello")


// JavaScript Window - The Browser Object Model
// JavaScript Popup Boxes

alert("I am an alert box!");

// Confirm Box

if (confirm("Press a button!")) {
    txt = "You pressed OK!";
} else {
    txt = "You pressed Cancel!";
}

//   prompt
let person = prompt("Please enter your name", "Harry Potter");
let text;
if (person == null || person == "") {
    text = "User cancelled the prompt.";
} else {
    text = "Hello " + person + "! How are you today?";
}

//   Line Breaks

alert("Hello\nHow are you?");



function myFunction() {
    alert('Hello');
}


//   The setInterval() Method

setInterval(myTimer, 1000);

function myTimer() {
    const d = new Date();
    document.getElementById("demo").innerHTML = d.toLocaleTimeString();
}

myTimer()