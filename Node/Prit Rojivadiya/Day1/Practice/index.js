// expressions
console.log('1'+2);
console.log(1/0);
console.log(-1/0);
console.log(typeof typeof (1));

var d = new Date();
console.log(d instanceof Date);

// destructuring
var num = ['one','two','three'];
var [one,two,three] = num;
console.log(one);

var objData = {
  i1: "value1",
  i2: "value2"
}

var {i1,i2} = objData;
console.log(i1);

// data types
console.log(typeof([1,2,3]));
console.log(typeof 1);
console.log(typeof "Prit");
console.log(typeof true);
console.log(typeof undefined);
console.log(typeof null);
console.log(typeof 1/0);

// IIFE

(function(){
    console.log('Immediately invoked function expression');
})();


// strict mode

function myFunction() {
  "use strict";
  var y;
  y = 3.14;   // This will cause an error
}

myFunction();


// this keyword

let x = this;
console.log(x);

const person = {
    firstName: "John",
    lastName: "Doe",
    id: 5566,
    fullName : function() {
      return this.firstName + " " + this.lastName;
    }
  };

  console.log(person.fullName())


// javascript class

class Car {
    constructor(name, year) {
      this.name = name;
      this.year = year;
  
    }
    age() {
      let date = new Date();
      return date.getFullYear() - this.year;
    }
  }
  
  let myCar = new Car("Ford", 2014);

  console.log(myCar.age())


// loops

var a = [{name:"Prit",age:21},{name:"man",age:17}]
for(let x of a){
  console.log(x);
}

var b = [1,2,3,4];
for(let y in b){
  console.log(b[y]);
}


// template literals
let fname = "Prit";
let lname = "Rojivadiya";
console.log(`${fname} ${lname}`);


function getVar(str,exp1,exp2){
  console.log(str);
  console.log(exp1);
  console.log(exp2);
}
getVar`my name is ${fname} ${lname}`


// map method
var a = [1,2,3,4,5];
var b = a.map((n)=>{
  return n*2;
})
console.log(b);


// filer method
var a = [10,20,30,40,50];
var b = a.filter((n)=>{
  return n>30;
})
console.log(b);


// reduce method
var a = [1,2,3,4,5,6,7,8,9];
var b = a.reduce((total,n)=>{
  console.log(total,n);
  return total + n;
})
console.log(b);


// rest parameter
function myfun(a,b,...args){
  console.log(a);
  console.log(b)
  console.log(args);
}
myfun(1,2,3,4,5);

// symbol
let x1 = Symbol('hello');
let y1 = Symbol('hello');
console.log(x1===y1);
console.log(x1);
console.log(x1.description);

const id = Symbol("id")
let person1 = {
  name:"Prit",
  [id]: 1
}
console.log(person1[id])
person1[id] = 2;
console.log(person1[id])


// promises

function fun(){
  return new Promise((resolve,reject)=>{
    let error = true;
    if(!error){
      resolve();
    }else{
      reject('unexpected error');
    }
  })
}


fun().then(()=>{
  console.log('resolved');
}).catch((error)=>{
  console.log(error)
})


// callback
setTimeout(() => {
  console.log('output after 2 seconds')
}, 2000);

