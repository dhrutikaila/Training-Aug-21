// declare variable 
var age = 44;
var demoname = "name1";
var isUpdate = true;
// TypeScript Number Type Variables
var first = 123; // number 
var second = 0x37CF; // hexadecimal
var third = 255; // octal
var fourth = 57; // binary  
console.log(first); // 123 
console.log(second); // 14287
console.log(third); // 255
console.log(fourth); // 57 
// Number Methods :- toExponential()
var myNumber = 123456;
myNumber.toExponential(); // returns 1.23456e+5
myNumber.toExponential(1); //returns 1.2e+5
myNumber.toExponential(2); //returns 1.23e+5
myNumber.toExponential(3); //returns 1.235e+5
// Number Methods :- toFixed()
var myNumber1 = 10.8788;
myNumber1.toFixed(); // returns 11
myNumber1.toFixed(1); //returns 10.9
myNumber1.toFixed(2); //returns 10.88
myNumber1.toFixed(3); //returns 10.879
myNumber1.toFixed(4); //returns 10.8788
// Array
var list = [1, 2, 3];
// second way
var list1 = [1, 2, 3];
// Tuple
// Declare a tuple type
var x;
// Initialize it
x = ["hello", 10]; // OK
// OK, return value of 'getValue' is not checked
var str = getValue("myString");
var looselyTyped = 4;
// OK, ifItExists might exist at runtime
looselyTyped.ifItExists();
// OK, toFixed exists (but the compiler doesn't check)
looselyTyped.toFixed();
var strictlyTyped = 4;
// strictlyTyped.toFixed(); //error
// Void
function warnUser() {
    console.log("This is my warning message");
}
