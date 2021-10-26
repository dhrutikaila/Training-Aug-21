// Write a JavaScript function to check whether a string is blank or not

function stringChk(str) {
    if (str.length < 1) {
        console.log("string is empty");
    }
    else
        console.log("string is not empty");
}

stringChk("hello");
stringChk("");

//Write a JavaScript function to split a string and convert it into an array of words

var sentence = "I am trainee at RadixWeb Technosoft LLP";

var arr = sentence.split(" ");

console.log(arr);


//Write a JavaScript function to extract a specified number of characters from a string.

function charAtNumber(index, string) {
    console.log(string.charAt(index));
}

charAtNumber(3, "hello");
charAtNumber(6, "pineapple");

//Write a JavaScript function to get the current date

function getCurrentDate() {
    console.log(new Date());
}

getCurrentDate();

//Try some operation with list like push, pop, shifting, deleting element

//array of cities
cities = ["Ahmedabad", "Rajkot", "Surat", "Delhi"];

//pop
var lastcity = cities.pop(); // remove last element and return it

//push
cities.push("Banglore"); //enter at last position and return new length

//unshift
cities.unshift("Mumbai") //enter at first position and return new length

//shift
var firstCity = cities.shift(); //remove first element and return it