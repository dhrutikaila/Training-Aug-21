//addNumbers
function addNumbers(a: number, b: number) { 
    return a + b; 
} 

var sum: number = addNumbers(10, 15) 

console.log('Sum of the two numbers is: ' +sum); 

//Type Annotation
var age: number = 32; // number variable
var namee: string = "John";// string variable
var isUpdated: boolean = true;// Boolean variable

function display(id:number, name:string)
{
    console.log("Id = " + id + ", Name = " + name);
}
display(32,"John");

//toExponantial
let myNumber: number = 123456;

myNumber.toExponential(); // returns 1.23456e+5
myNumber.toExponential(1); //returns 1.2e+5
myNumber.toExponential(2); //returns 1.23e+5
myNumber.toExponential(3); //returns 1.235e+5

//toFixed
let myNumber1: number = 10.8788;

myNumber1.toFixed(); // returns 11
myNumber1.toFixed(1); //returns 10.9
myNumber1.toFixed(2); //returns 10.88
myNumber1.toFixed(3); //returns 10.879
myNumber1.toFixed(4); //returns 10.

//toPrecision
let myNumber3: number = 10.5679;

myNumber3.toPrecision(1); // returns 1e+1
myNumber3.toPrecision(2); // returns 11
myNumber3.toPrecision(3); // returns 10.6
myNumber3.toPrecision(4); // returns 10.57

//toLocaleString
let myNumber2: number = 10667.987;

myNumber2.toLocaleString(); // returns 10,667.987 - US English
myNumber2.toLocaleString('de-DE'); // returns 10.667,987 - German
myNumber2.toLocaleString('ar-EG'); // returns 10667.987 in Arebic

//toString
let myNumber4: number = 123;
myNumber4.toString(); // returns '123'
myNumber4.toString(2); // returns '1111011'
myNumber4.toString(4); // returns '1323'
myNumber4.toString(8); // returns '173'
myNumber4.toString(16); // returns '7b'
myNumber4.toString(36); // returns '3f'

//Array
let values1: (string | number)[] = ['Apple', 2, 'Orange', 3, 4, 'Banana']; 
// or 
let values2: Array<string | number> = ['Apple', 2, 'Orange', 3, 4, 'Banana']; 

//Access array elements
let fruits: string[] = ['Apple', 'Orange', 'Banana']; 

for(var index in fruits)
{ 
    console.log(fruits[index]);  // output: Apple Orange Banana
}

for(var i = 0; i < fruits.length; i++)
{ 
    console.log(fruits[i]); // output: Apple Orange Banana
}

//Array Methods
fruits.sort(); 
console.log(fruits); //output: [ 'Apple', 'Banana', 'Orange' ]

console.log(fruits.pop()); //output: Orange

fruits.push('Papaya'); 
console.log(fruits); //output: ['Apple', 'Banana', 'Papaya']

fruits = fruits.concat(['Fig', 'Mango']); 
console.log(fruits); //output: ['Apple', 'Banana', 'Papaya', 'Fig', 'Mango'] 

console.log(fruits.indexOf('Papaya'));//output: 2