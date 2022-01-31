// TODO: https://www.w3schools.com/jsref/jsref_obj_number.asp
// * Number Methods and Properties
// JavaScript has only one type of number. Numbers can be written with or without decimals.
let x = 3.14; // A number with decimals
let y = 3; // A number without decimals

// * NaN - Not a Number: NaN is a JavaScript reserved word indicating that a number is not a legal number.
// * isNaN(): to find out if a value is a not a number:
console.log(
  x,
  y,
  isNaN(x),
  isNaN(y),
  isNaN("sagar"),
  isNaN("null"),
  isNaN(null),
  isNaN("true"),
  isNaN(true),
  isNaN(undefined),
  typeof NaN,
  typeof Infinity,
  typeof -Infinity
);

// * Numbers Can be Objects
// ! Do not create Number objects. It slows down execution speed. The new keyword complicates the code. This can produce some unexpected results:
let z = new Number(123);
console.log(z, typeof z);

// * The toString() Method: The toString() method returns a number as a string.
let no = 123;
console.log(no, no.toString(), (100 + no).toString());

// * The toExponential() Method: toExponential() returns a string, with a number rounded and written using exponential notation.
// * The toFixed() Method: toFixed() returns a string, with the number written with a specified number of decimals:
// * The toPrecision() Method: toPrecision() returns a string, with a number written with a specified length:
// * The valueOf() Method: valueOf() returns a number as a number.
let e = 9.656;
console.log(
  e.toExponential(2),
  e.toExponential(5),
  e.toFixed(0),
  e.toFixed(5),
  e.toPrecision(),
  e.toPrecision(5),
  e.valueOf(),
  (123).valueOf(),
  (100 + 23).valueOf()
);

// * Converting Variables to Numbers: There are 3 JavaScript methods that can be used to convert variables to numbers:
// ? Number()	Returns a number, converted from its argument.
// ? parseFloat()	Parses its argument and returns a floating point number
// ? parseInt()	Parses its argument and returns an integer
console.log(
  Number(new Date("1970-01-02")),
  parseInt(e),
  parseFloat("10 years")
);

// * Number Properties
// ? MAX_VALUE :	Returns the largest number possible in JavaScript
// ? MIN_VALUE :	Returns the smallest number possible in JavaScript
// ? POSITIVE_INFINITY :	Represents infinity (returned on overflow)
// ? NEGATIVE_INFINITY :	Represents negative
console.log(
  Number.NaN,
  Number.MAX_VALUE,
  Number.MIN_VALUE,
  Number.MAX_SAFE_INTEGER,
  Number.MIN_SAFE_INTEGER,
  Number.POSITIVE_INFINITY,
  Number.NEGATIVE_INFINITY
);
