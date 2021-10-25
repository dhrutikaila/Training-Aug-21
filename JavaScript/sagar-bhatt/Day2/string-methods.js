// TODO: https://www.w3schools.com/jsref/jsref_obj_string.asp

// * String Methods and Properties
// ! Don't create strings as objects. It slows down execution speed.The new keyword complicates the code. This can produce some unexpected results:
let string = new String("Strings Can be Objects");
console.log(string, typeof string);

// * The backslash (\) escape character turns special characters into string characters.
let text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\t";
console.log(text, typeof text);
console.log(text.length); // * Find the length of a string.

// * Extracting String Parts: There are 3 methods for extracting a part of a string:
// ? slice(start, end)
// ? substring(start, end)
// ? substr(start, length)

// ? slice(): slice() extracts a part of a string and returns the extracted part in a new string.
let str = "Apple, Banana, Kiwi";
console.log(str.slice(7, 13), str.slice(-12, -6)); // 7 to position 12 (13-1)

// ? The substring() Method: substring() is similar to slice().
// ? The difference is that substring() cannot accept negative indexes.
console.log(str.substring(7, 13));

// ? The substr() : substr() is similar to slice().
// ? The difference is that the second parameter specifies the length of the extracted part.
console.log(str.substr(7, 6));

// * Replacing String Content
// ? The replace() method replaces a specified value with another value in a string:
let strReplace = "Please visit Microsoft!";
console.log(strReplace.replace("Microsoft", "W3Schools"));

// * Converting to Upper and Lower Case
console.log(strReplace.toUpperCase(), strReplace.toLocaleLowerCase());

// * The concat() Method: concat() joins two or more strings:
let con = "sagar";
console.log(con.concat("sagar", "bhatt"));

// * String.trim(): trim() method removes whitespace from both sides of a string:
console.log("  sagar  ".trim());

// * JavaScript String Padding
// ECMAScript 2017 added two String methods: padStart and padEnd to support padding at the beginning and at the end of a string.
let textno = "5";
console.log(textno.padStart(4, 0)); // Returns 0005
console.log(textno.padEnd(4, 0)); // Returns 5000

// * Extracting String Characters: There are 3 methods for extracting string characters:
// ? Property access [ ]
// ? charAt(position): The charAt() method returns the character at a specified index (position) in a string:
// ? charCodeAt(position): The charCodeAt() method returns the unicode of the character at a specified index in a string:
let strHello = "Hello World!";
console.log(strHello[1], strHello.charAt(1), strHello.charCodeAt(1));

// * Converting a String to an Array
console.log(strHello.split(" "));

// * JavaScript methods for searching strings:
// ? String.indexOf(): The indexOf() method returns the index of (the position of) the first occurrence of a specified text in a string:
// ? String.lastIndexOf(): The lastIndexOf() method returns the index of the last occurrence of a specified text in a string:
// ? String.search(): The search() method searches a string for a specified value and returns the position of the match:
// ? String.match(): The match() method searches a string for a match against a regular expression, and returns the matches, as an Array object.
// ? String.includes(): The includes() method returns true if a string contains a specified value.
// ? String.startsWith(): The startsWith() method returns true if a string begins with a specified value, otherwise false:
// ? String.endsWith(): The endsWith() method returns true if a string ends with a specified value, otherwise false:
let strSearch = "Please locate where 'locate' occurs!";
console.log(
  strSearch.indexOf("locate", 10),
  strSearch.lastIndexOf("locate", 10),
  strSearch.search("locate"),
  strSearch.match(/locate/),
  strSearch.match(/locate/g),
  strSearch.includes("locate"),
  strSearch.startsWith("p"),
  strSearch.endsWith("!")
);
// ? The two methods are NOT equal. These are the differences:
// The search() method cannot take a second start position argument.
// The indexOf() method cannot take powerful search values (regular expressions).

// * JavaScript Template Literals
// Template Literals use back-ticks (``) rather than the quotes ("") to
console.log(`JavaScript Template Literals`);

// *Interpolation
// Template literals provide an easy way to interpolate variables and expressions into strings.
// The method is called string interpolation.
let interpolation = "Interpolation";
console.log(`${interpolation}`);
