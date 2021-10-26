//Functions---------------------------------------------------------------------

//simple function that prints foo in console

function printFoo() {
    console.log("foo")
}

// a function to calculat square

function calcSquare(a) {
    let result = a * a;
    return result;
}

// Function Expression ---------------------------------------------------------



//function experssion is an anonymous function assgined to variable

//an anonymous function 
// function (a, b) {
//     return a + b;
// }

//function expression

let add = function (a, b) {
    return a + b;
}

console.log(add(1, 2)); // return addition of 1 and 2;
// function expression are called throuh the varibale its assigned to


//arrow function 
//intorduced in es6 
//arrow function are the shorthand for writing function expression and anonymous functions

//let above add function to arrow function

var add1 = (a, b) => {
    return a + b;
}

//since add1 container only one statement we can ommit brakets and return keyword

var add1 = (a, b) => a + b;
console.log(add1(2, 2));


//an arrow function to calculate square of number

let square = a => a * a; //since there is only one parameter we can also ommit parathesis


//tradition function expression have some advantages over arrow function expression

//this keyword not work with arrow function
//arrow keyword cannot utilize as methods

var myObject = {
    firstName: "raviraj",
    printName: () => {
        console.log(this.firstName, this)
    },
    printName2: function () {
        console.log(this.firstName, this)
    }
}

myObject.printName();
myObject.printName2();


// Function Constructor --------------------------------------------------------

var mul = new Function("a", "b", "return a * b"); // we have pass function body and parameter as argument of the Function construcotr

console.log(mul(2, 3));






// Self-Invoking constructor----------------------------------------------------
(function () {
    var x = "hello world!";
    console.log(x);
})(); //the function is invoking without call due to added () at end of statemtnt




// Function Call ---------------------------------------------------------------

var person = {
    firstName: "Raviraj",
    lastName: "Padhiyar",
    fullName: function () {
        return this.firstName + " " + this.lastName;
    }
}

console.log(person.fullName());

//call method



var person1 = {
    firstName: "Sagar",
    lastName: "Padhiyar"
}

console.log(person.fullName.call(person1));


//another example
var person = {
    workAs: function (job) {
        return this.firstName + " " + this.lastName + " is work as " + job;
    }
}

var person1 = {
    firstName: "Raviraj",
    lastName: "Padhiyar"
}

console.log(person.workAs.call(person1, "Engineer"));



// Function Apply --------------------------------------------------------------

//apply method takes seprate argumetns as an array

var person = {
    personDetail: function (job, company) {
        return this.firstName + " " + this.lastName + " is work as " + job + " at " + company;
    }
}

var person1 = {
    firstName: "Raviraj",
    lastName: "Padhiyar"
}



console.log(person.personDetail.apply(person1, ["Developer", "RadixWeb"]));



// Function Hoising ------------------------------------------------------------
//hoisting is concept in javascript in which all variable with var and function are declare or can say parse at top 

console.log(value); // return undefined but value is declared
var value = 2;


//Hoisiting in function

console.log(sum(4, 5));

function sum(a, b) {
    return a + b;
}

//function hoisting with function expression doesnt work 
// console.log(sum2(7, 8)); //throws erro as sum2 is not function
// var sum = function (a, b) {
//     return a + b;
// }


// Global variable & Local Variable --------------------------------------------
//scope

var v = 10;
let i = 10;
if (true) {
    var v = 20;
    let i = 20;
    console.log(v, i); // return 20 20
}
console.log(v, i); //reutrn 20 10

//the let show 10 becuase let variable has block scope 
//while var has only function scope


var v1 = 10;
let i1 = 10;
function printv1i1() {
    var v1 = 20;
    let i1 = 20;
    console.log(v1, i1);
}

printv1i1();
console.log(v1, i1);
//since both var and let has function scope


// Function closure ------------------------------------------------------------
//clouse is concept in which global variable can be made local



//example

var x = 0;
function addx() {
    x++;
    console.log(x);
}

// addx();
// addx();
// addx(); // at this stage x = 3

//but problem whith above code is i can change x anywhere inside a page

//chaning x with third party function
function dox() {
    x = 890;
}
dox();

addx();
addx();
addx(); // prints 893 since x has been updated in dox;

//to not allow this we have to use closure concept

var addy = (function () {
    var counter = 0;
    return () => {
        counter++;
        return counter;
    }
})();


// console.log(addy());
// console.log(addy());
// console.log(addy()); //will output 3


function doy() {
    counter = 12;
}

doy(); //we will still see 3 as output

console.log(addy());
console.log(addy());
console.log(addy()); //will output 3

