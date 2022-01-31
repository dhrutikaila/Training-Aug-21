// * function expression(anonymous functions): stored in a variable
var x = function () {
  console.log("function stored in a variable");
};
x();

// * Function() constructor
var c = new Function("a", "b", "return a * b");
console.log(c(9, 9));

// * functions Hoisting
f1();
function f1() {
  console.log("f1");
}
// f2();
var f2 = function () {
  console.log("f2");
};
f2();
// f3();
let f3 = function () {
  console.log("f3");
};
f3();

// * self-invoking functions
(function () {
  console.log("self-invoking function.");
})();

// * arrow functions
(() => console.log("self-invoking arrow function"))();

// * function call() method: using call() method we can call a method for other objects
let person = {
  firstName: "Sagar",
  lastName: "Bhatt",
  //   fullName: () => `${firstName} ${lastName}`,
  //   fullName: () => `${this.firstName} ${this.lastName}`,
  //   fullName: () => `${person.firstName} ${person.lastName}`,
  fullName: function (middleName = "") {
    return this.firstName + " " + middleName + " " + this.lastName;
  },
};
console.log(person, person.firstName, person.lastName, person.fullName()); // function invoked for object person

let person1 = {
  firstName: "Harsh",
  lastName: "Bhatt",
};

console.log(person.fullName.call(person1)); // function invoked for object person1

// * call() with arguments
console.log(person.fullName.call(person1, "J"));

// * apply() : similar to call(), call() takes arguments separately, apply() takes arguments as an array.
console.log(person.fullName.apply(person1, ["J"]));

// * Closures:
// * variable scope: global or local, variables created without keywords(var, let, const) are always global
// * Global variables can be made local with closures
let gCounter = 0; // value can be changed from outside of the function
const count = () => {
  gCounter++;
  console.log(gCounter);
};
count();
gCounter = 5;
count();
count();

// closures:
const add = (() => {
  let counter = 0;
  return () => {
    counter++;
    console.log(counter);
  };
})();

add();
add();
add();
