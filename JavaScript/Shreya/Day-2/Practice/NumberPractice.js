//tostring its return string value 
var x=100;
console.log(x.toString())
console.log('type is '+typeof(x.toString()))

//Exponential returns string with rounded value 

var y=122.342323;
console.log('Result is '+ y.toExponential(2))

//tofixed method is return string with sepcified number of decimals 
//its maily use with money 

console.log('Tofixed example Result is '+ y.toFixed(2))

//toprecision returns string with specified length
var num=1.567;
console.log( 'To precision example Result is '+ num.toPrecision(1))

//valueof method return number as a number
var num1=6755;
console.log(num1.valueOf());
console.log(typeof(num1.valueOf()));

//converting variable to number 

console.log(Number("10 "))
console.log(Number("shreya "))
 // prseint
console.log(parseInt("10 "))

console.log(parseFloat("10 "))

//number properties 
var x = Number.MAX_VALUE;
console.log(x)

var x = Number.MIN_VALUE;
console.log(x)

//infinity
var x = 1 / 0;
console.log(x)

//negative infinity
var x = -1 / 0;
console.log(x)

//return NaN bcz abc is not a number
var x = 1 / "abc";
console.log(x)

//number properties can not use in variable 

var x = 6;
console.log(x.MAX_VALUE)

