//basic functions
function multiplication(a, b) {
  return a * b;
}
console.log(multiplication(5, 10));

//function expressions
const x = function (a, b) {return a * b};
console.log(x(5,10));

//default function parameter
function defaultPara(x, y) {
  if (y === undefined) {
    y = 2;
  }  
  return x * y;
}
console.log(defaultPara(4));

//Arguments Object 
function findMax() {
  let max = -Infinity;
  for(let i = 0; i < arguments.length; i++) {
    if (arguments[i] > max) {
      max = arguments[i];
    }
  }
  return max;
}
console.log(findMax(5, 8, 7, 9, 10, 11, 15));

//Invoking a Function as a Method
const myObject = {
  firstName:"Dhruvit",
  lastName: "Diyora",
  fullName: function() {
    return this.firstName + " " + this.lastName;
  }
}
console.log(myObject.fullName());

//Invoking a Function with a Function Constructor
function myFunction(fName, lName) {
  this.firstName = fName;
  this.lastName  = lName;
}

const myObj = new myFunction("Dhruvit", "Diyora");
console.log(myObj);

//JavaScript call() Method
const person = {
  fullName: function() {
    return this.firstName + " " + this.lastName;
  }
}
const person1 = {
  firstName:"Dhruvit",
  lastName: "Diyora"
}
const person2 = {
  firstName:"Diyora",
  lastName: "Dhruvit"
}


console.log(person.fullName.call(person1));
console.log(person.fullName.call(person2));

//apply function 
const people = {
  fullName: function(city, country) {
    return this.firstName + " " + this.lastName + "," + city + "," + country;
  }
}
console.log(people.fullName.apply(person1, ["Surat", "India"]));

//function hoisting
console.log(square(5));
function square(y) {
  return y * y;
}

//self invoking functions
(function () {
  var x = "Hello  World!!!";
  console.log(x);
})();

//arrow function
const arrow = (x, y) => x * y;
console.log(arrow(5, 4));


//closure
function Counter() {
    var counter = 0;

    function IncreaseCounter() {
        return counter += 1;
    };

    return IncreaseCounter;
}

var counter = Counter();
console.log(counter()); // 1
console.log(counter()); // 2
console.log(counter()); // 3
console.log(counter()); // 4


