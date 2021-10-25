// TODO: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions
// TODO: https://www.w3schools.com/jsref/jsref_obj_regexp.asp

// * RegExp Object
// * A regular expression is an object that describes a pattern of characters.
// * Regular expressions are used to perform pattern-matching and "search-and-replace" functions on text.

// ?g: Perform a global match (find all matches rather than stopping after the first match)
// ?i: Perform case-insensitive matching
// ?m: Perform multiline matching
// var patt1 = new RegExp("sagar", "g");

let str = "sagar bhatt";
let patt = /sagar/g; // * case-insensitive
console.log(str.patt);
console.log(str.patt);
console.log(patt.exec(str)); // * exec() Tests for a match in a string. Returns the first match
console.log(patt.test(str)); // * test() Tests for a match in a string. Returns true or false
console.log(patt.toString()); // * toString() Returns the string value of the regular expression

// *match(): The match() method retrieves the result of matching a string against a regular expression.
console.log(str.match(patt));
// *matchAll(): The matchAll() method returns an iterator of all results matching a string against a regular expression, including capturing groups.
console.log(str.matchAll(patt));
for (let i of str.matchAll(patt)) console.log(i);

/*
* Special characters in regular expressions.
? Character classes
\, ., \cX, \d, \D, \f, \n, \r, \s, \S, \t, \v, \w, \W, \0, \xhh, \uhhhh, \uhhhhh, [\b]

? Assertions
^, $, x(?=y), x(?!y), (?<=y)x, (?<!y)x, \b, \B

? Groups and ranges
(x), (?:x), (?<Name>x), x|y, [xyz], [^xyz], \Number

? Quantifiers
*, +, ?, x{n}, x{n,}, x{n,m}

? Unicode property escapes
\p{UnicodeProperty}, \P{UnicodeProperty}
*/

const chessStory = "He played the King in a8 and she moved her Queen in c2.";
const regex1 = /\w\d/g;
console.log(chessStory.match(regex1));
