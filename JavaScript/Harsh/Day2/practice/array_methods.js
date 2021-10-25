// Array Method

// Converting Arrays to Strings
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits.toString());

// join() method
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits.join("*"));

// Popping
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.pop();
console.log(fruits);

var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits.pop());

// Pushing
var fruits = ["banana", "Orange", "Apple", "Mango"];
fruits.push("Kiwi");
console.log(fruits);

var fruits = ["banana", "Orange", "Apple", "Mango"];
console.log(fruits.push("Kiwi"));

// Shifting Elements
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.shift();
console.log(fruits);

var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits.shift());

var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.unshift("Kiwi");
console.log(fruits);

var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits.unshift("Kiwi"));

// Changing Elements
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits[0] = "kiwi";
console.log(fruits);

var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits[fruits.length] = "kiwi";
console.log(fruits);

// Deleting Elements

var fruits = ["Banana", "Orange", "Apple", "Mango"];
delete fruits[0];
console.log(fruits);

// Splicing an Array
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.splice(2, 0, "Lemon", "Kiwi")
console.log(fruits);

var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.splice(2, 2, "Lemon", "Kiwi")
console.log(fruits);

var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.splice(0, 1,)
console.log(fruits);

// Merging(Concatenating)
var arr1 = ["Cecilie", "Lone"];
var arr2 = ["Emil", "Tobias", "Linus"];
var x = arr1.concat(arr2);
console.log(x);

var arr1 = ["Cecilie", "Lone"];
var arr2 = ["Emil", "Tobias", "Linus"];
var arr3 = ["Robin", "Morgan"]
var x = arr1.concat(arr2, arr3);
console.log(x);


var arr1 = ["Cecilie", "Lone"];
var x = arr1.concat("Manav");
console.log(x);

// Slicing an Array
var fruits = ["Banana", "Orange", "Apple", "Mango"];
var arr = fruits.slice(1);
console.log(arr);

var fruits = ["Banana", "Orange", "Apple", "Mango"];
var arr = fruits.slice(2);
console.log(arr);

var fruits = ["Banana", "Orange", "Apple", "Mango"];
var arr = fruits.slice(1, 3);
console.log(arr);

// Automatic tostring
var fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits.toString());