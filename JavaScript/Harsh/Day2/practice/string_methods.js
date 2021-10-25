// String Length

var text = "JavaScript Tutorial";
console.log(text.length);

// Extracting String parts
var text = "JavaScript Tutorial";
console.log(text.slice(2, 5));

var text = "JavaScript Tutorial";
console.log(text.slice(-5, -2));

var text = "JavaScript Tutorial";
console.log(text.slice(5));
var text = "JavaScript Tutorial";
console.log(text.slice(-5));

var text = "JavaScript Tutorial";
console.log(text.substring(2, 5));
var text = "JavaScript Tutorial";
console.log(text.slice(5));

var text = "JavaScript Tutorial";
console.log(text.substr(5, 2));
var text = "JavaScript Tutorial";
console.log(text.slice(5));
var text = "JavaScript Tutorial";
console.log(text.substr(-5, 2));

var text = "JavaScript Tutorial";
console.log(text.substr(-5));

var text = "JavaScript Tutorial";
var text1 = text.replace("JavaScript", "java");
console.log(text1);

var text = "JavaScript And JavaScript Tutorial";
var text1 = text.replace("JavaScript", "java");
console.log(text1);


var text = "JavaScript Tutorial";
var text1 = text.replace(/JAVASCRIPT/i, "java");
console.log(text1);

var text = "JavaScript And JavaScript Tutorial";
var text1 = text.replace(/JavaScript/g, "java");
console.log(text1);

// Converting to Upper and Lower Case

var x = "JavaScript Tutorial";
console.log(x.toUpperCase());

var x = "JavaScript Tutorial";
console.log(x.toLowerCase());

// Concate 
var text1 = "JavaScript";
var text2 = "Tutorial";
var text3 = text1.concat(" ", text2);
console.log(text3);

// trim
var x = "   JavaScript Tutorial  ";
console.log(x.trim());

// padding

var x = "5";
console.log(x.padStart(4, 0));

var x = "5";
console.log(x.padEnd(4, 0));

// extracting string characters

var x = "JavaScript Tutorial";
console.log(x.charAt(0));

var x = "JavaScript Tutorial";
console.log(x.charCodeAt(0));

var x = "JavaScript Tutorial";
console.log(x[0]);


var x = "a,b,c,d,e"
console.log(x.split(","));

var x = "JavaScript Tutorial";
console.log(x.indexOf("Tutorial"));

var x = "JavaScript Tutorial and Javascript Tutorial";
console.log(x.lastIndexOf("Tutorial"));




