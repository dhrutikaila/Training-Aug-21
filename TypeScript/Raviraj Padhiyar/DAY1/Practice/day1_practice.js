//primitives types number,string,boolean
var num1 = 42;
console.log(num1);
var str1 = "Hello world";
console.log(str1);
var isTrue = true;
console.log(isTrue);
/*
//Non-exception Failures

const user = {
    name:"Jon",
    age:20
}

user.location //return undefined in vanilla js
//throw an error in typescript
*/
//function
function greet(person, date) {
    console.log(`hello ${person}, today is ${date.toDateString()}`);
}
var today = new Date();
greet("Ravi", today);
//Array
var nums = [1, 2, 3, 4, 5, 6];
var nusm2 = [9, 8, 7, 6, 5, 4, 3];
var names = ["ravi", "krunal", "rahul"];
//any type
let obj = { x: 0 };
// obj.foo();
// obj();
// obj.bar;
// obj = "hello";
// const n:number = obj;
//none of the above line thorw error as type of obj is any
//Type Annotations on Variables
let myName = "Raviraj";
let myName2 = "Raviraj"; //ts auto assign myName2 type to string
//anonymous funtion
names.forEach((s) => {
    console.log(s.toUpperCase());
});
//object type
function printCoord(pt) {
    console.log("the coordinate's x value is " + pt.x);
    console.log("the coordinate's y value is " + pt.y);
}
printCoord({ x: 3, y: 7 });
// printCoord({x:cancer,y:mercur}); throw error as x type string we required it to be a number as mention in the function
//optional properties
function printName(obj) {
    if (obj.last == undefined) {
        console.log(`First Name is ${obj.first}`);
    }
    else {
        console.log(`First Name is ${obj.first} Last Name is ${obj.last}`);
    }
}
printName({ first: "Raviraj" });
printName({ first: "Raviraj", last: "Padhiyar" });
//-----------------------------------------------------------------------------------------------------------
//methods
//number methods
let number1 = 2.23423423423;
console.log(number1.toExponential(4));
console.log(number1.toFixed(4));
console.log(number1.toLocaleString());
console.log(number1.toString());
console.log(number1.valueOf());
//string methods
let str = "Hello world!";
console.log(str.charAt(1));
console.log(str.concat("Universe"));
console.log(str.indexOf("l"));
console.log(str.replace("world", "Earth"));
console.log(str.split(" "));
console.log(str.toUpperCase());
console.log(str.toLowerCase());
console.log(str.includes("p"));
console.log(str.endsWith("."));
console.log(str.normalize());
console.log(str.repeat(2));
console.log(str.slice(2, 5));
console.log(str.substr(2, 2));
//multi Type Array
let values = ['Apple', 2, 'Orange', 3, 4, 'banana'];
for (var value of values) {
    console.log(value);
}
//array methods
console.log(values.pop());
console.log(values.push(5));
console.log(values.sort());
console.log(values.indexOf('Apple'));
console.log(values.copyWithin(2, 5));
var nums;
nums.fill(0, 6);
console.log(nums);
console.log(nums.filter(num => num < 3));
console.log(nums.reduce((sum, num) => sum + num));
console.log(nums.map(num => num * num));
