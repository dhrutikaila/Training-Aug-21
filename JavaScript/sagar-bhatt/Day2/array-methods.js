// TODO: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
// TODO: https://www.w3schools.com/js/js_arrays.asp

// * Array Properties and Methods

let cars = new Array("BMW", "Mercedes");
console.log(cars);
let fruits = ["Banana", "Orange", "Apple", "Mango", "Pineapple"];
console.log(fruits);

// * How to Recognize an Array
console.log(
  `typeof fruits?: ${typeof fruits},
  fruits instanceof Array?: ${fruits instanceof Array},
  Array.isArray(fruits)? ${Array.isArray(fruits)}`
);

// * Changing Elements
fruits[0] = "Kiwi";
console.log(fruits);

// * Deleting Elements: Use pop() or shift()
// delete fruits[0];
// console.log(fruits);

// * array.length;  Returns the number of elements
console.log(`fruits.length? ${fruits.length}`);

// * Accessing the First Array Element
console.log(fruits[0]);
// * Accessing the Last Array Element
console.log(fruits[fruits.length - 1]);

// * Converting Arrays to Strings
console.log(fruits.toString()); // ? toString() converts an array to a string of (comma separated) array values.
console.log(fruits.join(" ")); // ? join() also converts an array to a string but in addition you can specify the separator.

// * Adding Removing Element
// ? Popping items out of an array, or pushing items into an array.
console.log(fruits.pop(), fruits);
console.log(fruits.push("Watermelon", "Pineapple"), fruits);

// ? Shifting is equivalent to popping, working on the first element instead of the last.
// ? The shift() method removes the first array element and "shifts" all other elements to a lower index.
console.log(fruits.shift(), fruits);
console.log(fruits.unshift("Banana"), fruits);

// * Splicing an Array: The splice() method changes the contents of an array by removing or replacing existing elements and/or adding new elements in place.
// ? Syntax splice(start);
// ? Syntax splice(start, deleteCount);
// ? Syntax splice(start, deleteCount, item1, item2, itemN);
console.log(fruits.splice(3), "array:", fruits);
console.log(fruits.splice(0, 1), "array:", fruits);
console.log(
  fruits.push(fruits.splice(1, 1, "Banana", "Kiwi", "Watermelon")),
  "array:",
  fruits
);

// * Slicing an Array: Extracts a section of the calling array and returns a new array.
// ? Syntax: slice()
// ? Syntax: slice(start)
// ? Syntax: slice(start, end)
console.log(fruits.slice(), fruits);
console.log(fruits.slice(3), fruits);
console.log(fruits.slice(3, 5), fruits);

// * Merging (Concatenating) Arrays: Syntax: arr1.concat(arr2, arr3, ..., arrN)
let items = cars.concat(fruits);
console.log(items);

// * Sort(): The sort() method sorts an array alphabetically:
console.log(fruits.sort()); // ASC

// * Reversing an Array
console.log(fruits.sort());
console.log(fruits.reverse()); //DESC

// * Numeric Sort
let no = [1, 2, 3, 4, 5, 9, 9, 7, 77];
console.log(no.sort()); // ? By default, the sort() function sorts values as strings. -ASC
console.log(no.reverse()); // ? By default, the sort() function sorts values as strings. -DESC
console.log(no.sort((a, b) => a - b)); // ASC
console.log(no.sort((a, b) => b - a)); // DESC

// * JavaScript Array Iteration
// ? Array.forEach(): The forEach() method calls a function (a callback function) once for each array element.
const nos = [45, 4, 9, 16, 25];
nos.forEach((value, index, array) => {
  console.log(`Value: ${value}, Index: ${index}, Array: ${array}`);
});

// ? Array.map()
// The map() method creates a new array by performing a function on each array element.
// The map() method does not execute the function for array elements without values.
// The map() method does not change the original array.
const map = nos.map((value, index, array) => {
  return value * 2;
});
console.log(map);

// ? Array.filter()
// The filter() method creates a new array with array elements that passes a test.
const filter = nos.filter((value, index, array) => {
  return value > 18;
});
console.log(filter);

// ? Array.reduce(): (left-to-right)
// The reduce() method runs a function on each array element to produce (reduce it to) a single value.
const reduce = nos.reduce((total, value, index, array) => {
  return total - value;
});
console.log(reduce);

// ? Array.reduceRight(): (right-to-left)
// The reduceRight() method runs a function on each array element to produce (reduce it to) a single value.
const reduceRight = nos.reduceRight((total, value, index, array) => {
  return total - value;
});
console.log(reduceRight);

// ? Array.every(): The every() method check if all array values pass a test.
const every = nos.every((value, index, array) => {
  return value > 18;
});
console.log(every);

// ? Array.some(): The some() method check if some array values pass a test.
const some = nos.some((value, index, array) => {
  return value > 18;
});
console.log(some);

// ? Array.find()
// The find() method returns the value of the first array element that passes a test function.
const find = nos.find((value, index, array) => {
  return value > 18;
});
console.log(find);

// ? Array.findIndex()
// The findIndex() method returns the index of the first array element that passes a test function.
const findIndex = nos.findIndex((value, index, array) => {
  return value > 18;
});
console.log(findIndex);

// * Array.indexOf(): The indexOf() method searches an array for an element value and returns its position.
console.log(fruits.indexOf("Kiwi", 3));

// * Array.lastIndexOf()
// Array.lastIndexOf() is the same as Array.indexOf(), but returns the position of the last occurrence of the specified element.
console.log(fruits.lastIndexOf("Banana", 2));

// *Array.includes()
// ECMAScript 2016 introduced Array.includes() to arrays. This allows us to check if an element is present in an array
console.log(fruits.includes("Orange"));

// * Array.from()
// The Array.from() method returns an Array object from any object with a length property or any iterable object.
console.log(Array.from("Sagar"));

// * Array.Keys()
// The Array.keys() method returns an Array Iterator object with the keys of an array.
const keys = fruits.keys();
for (let i of keys) console.log(i);

// TODO: https://www.w3schools.com/jsref/jsref_obj_array.asp
