/* Array methods */

// toString() converts array into comma seprated strings

var arr = new Array("mango", "banana", "pineapple", "apple", "oranges");

console.log(arr.toString());

//join() we can specify seprator other then comma

console.log(arr.join(" | "));

// popping and pushing

arr.pop(); // removes last element
arr.push("grapes"); // add element at last position

console.log(arr);

//shifting elements

console.log(arr.shift()); // gives mango
arr.unshift("mango");
console.log(arr); //add mango at first position

//changing elements using indexes

console.log(arr[2]);

//delete
delete arr[arr.length - 1]; //delete last element space still exist in array
arr.pop();
arr.push("oranges");

//splicing

arr.splice(2, 0, "Lemon");
arr.splice(2, 1, "kiwi");

//splice to remove elements
arr.splice(2, 2); // remove two elements starting from second position

var veg = new Array("tometo", "patoto", "ladyfinger", "eggplant");

console.log(arr.concat(veg));

//slice array

console.log(arr.slice(1, 3));

//sort

arr = new Array(3, 8, 44, 5, 4, 57, 52, 1, 85);

console.log(arr);
console.log(arr.sort());
console.log(arr.sort((a, b) => a - b));

//array iteration

arr.forEach(myfun);

function myfun(value, index, array) {
  console.log(value, index);
}

//map
console.log(arr.map((value) => value * 2));

//filter
console.log(arr.filter((value) => value < 10));

//reduce
console.log(arr.reduce((total, value) => total + value));

/* strings methods */

//string length
var txt = "aksjdfhjksahfdkjashfjk";

console.log(txt.length);

//slice on string

txt = "apple, banana, oranges";
console.log(txt.slice(7, 13));

//substring is similar to slice but we cant pass negative indexes

txt = "apple, banana, oranges";
console.log(txt.substring(7, 13));

//substr start index,length can accept negtive value at start index
txt = "asdfasdjkfdaghsjkfask";
console.log(txt.substr(4, 10));

console.log(txt.substr(-4));

//replace

txt = "hello world!";

console.log(txt.replace("world", "Earth"));

//upper lower case

console.log(txt.toUpperCase());
console.log(txt.toLowerCase());

//trim ltrim rtimr
txt = "     hello      ";

console.log(txt.trim());
console.log(txt.trimRight());
console.log(txt.trimLeft());

//split returns array

txt = "hello,world,earth";

console.log(txt.split(","));

/* dates and date method */

var date = new Date(); // current date is assigned to date
console.log(date);

var date1 = new Date(2022, 0, 12, 10, 23, 23);
console.l2 = new Date(2022, 13, 12, 10, 23, 23);
console.log(date);
//javascript store date in milliseconds from 1 jan 1970
var date3 = new Date(1129837128945) // this show oct 21 2005
console.log(date3);

//get methods
console.log(date.getDate()); //return date of the month
console.log(date.getDay()); // return day of the week
console.log(date.getHours()); //return hours of day
console.log(date.getTime());  //return millisecond from 1 jan 1970
console.log(date.getFullYear()); //return full year
console.log(date.getMinutes()); //return minute of hour


//set methods

console.log(new Date(date.setDate(23)));
console.log(new Date(date.setHours(23)));
console.log(new Date(date.setMinutes(23)));
console.log(new Date(date.setYear(2023)));


//regular expression

//   /pattern/modifers

txt = "Welcome at RadixWeb Technosoft LLP at";
var n = txt.search("RadixWeb");

//modifers
n = txt.search(/RadixWeb/i);
n = txt.search(/Radixweb/i);

n = txt.match(/at/g);

txt = `is this 
is it`;

n = txt.match(/is/m);
console.log(n);

//regExp patterns
txt = "hello";
console.log(txt.match(/[eh]/g));

txt = "12345";
console.log(txt.match(/[1-4]/g));

txt = "app, ban , apple, banan, banana, pine"
console.log(txt.match(/apple|banana/g));

//metachar
txt = "give your 100% effort";
console.log(txt.match(/\d/g));



//test()
const pattern = /easy/;


console.log(pattern.test("it this example is easy")); //return true

