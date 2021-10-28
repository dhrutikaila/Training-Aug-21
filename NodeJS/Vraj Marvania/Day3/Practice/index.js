
// Global Objects


console.log( __filename );

console.log( __dirname );

function printHello() {
    console.log( "Hello, World!");
 }
 
 // Now call above function after 2 seconds
 var t = setTimeout(printHello, 2000);
 clearTimeout(t);

 function printHello() {
    console.log( "Hello, World!");
 }
 
 // Now call above function after 2 seconds
 var i=setInterval(printHello, 2000);
 clearInterval(i)


// Loading a Module

var e= require('./demo.js')
console.log(e.name)