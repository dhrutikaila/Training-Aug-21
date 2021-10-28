// function
function add(a, b) {
  return a + b;
}
console.log("addition-fun:-" + add(3, 4));

// function expession
var c = function add(a, b) {
  return a + b;
};
console.log("multifun -" + c(3, 4));


// Function() constructor
const sum = new Function("a", "b", "return a + b");
console.log(sum(2, 6));

// function hoisting
demo(4);

function demo(no) {
  console.log(no);
}

// self-invoking function

(function () {
  console.log("in-side");
})();

// Array function

var add = (a) => {
  console.log(a);
};

add("in Array function");

// function call

const myObject = {
  firstName: "John",
  lastName: "Doe",
  fullName: function () {
    return this.firstName + " " + this.lastName;
  },
};

console.log(myObject.fullName());

//  call() Method

const person2 = {
  firstName: "Mary",
  lastName: "Doe",
};
console.log(myObject.fullName.call(person2));

//   pass permeters
const myObject2 = {
  fullName: function (city, state) {
    return this.firstName + " " + this.lastName + " " + city + " " + state;
  },
};
console.log(myObject2.fullName.call(person2, "rajkot", "gujrat"));

//   apply() method

console.log(myObject2.fullName.apply(person2, ["rajkot", "gujrat"]));
