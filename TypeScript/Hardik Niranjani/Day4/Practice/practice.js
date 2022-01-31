// // TypeScript Map
//  create a map
var map_name = new Map();
// different map methods
var map1 = new Map();
map1.set('1', 'person_1');
map1.set(1, 'person_1@gmail.com');
map1.set(true, 'boolen_value');
map1.set('2', 'person_2');
console.log("Value1= " + map1.get(1));
console.log("Value2= " + map1.get('1'));
console.log("Key is Present= " + map1.has(3));
console.log("Size= " + map1.size);
console.log("Delete value= " + map1["delete"](1));
console.log("New Size= " + map1.size);
// Iterating Map Data
var ageMapping = new Map();
ageMapping.set("person_1", 40);
ageMapping.set("person_2", 25);
ageMapping.set("person_3", 30);
//Iterate over map keys  
for (var _i = 0, _a = ageMapping.keys(); _i < _a.length; _i++) {
    var key = _a[_i];
    console.log("Map Keys= " + key);
}
//Iterate over map values  
for (var _b = 0, _c = ageMapping.values(); _b < _c.length; _b++) {
    var value = _c[_b];
    console.log("Map Values= " + value);
}
console.log("The Map Enteries are: ");
//Iterate over map entries  
for (var _d = 0, _e = ageMapping.entries(); _d < _e.length; _d++) {
    var entry = _e[_d];
    console.log(entry[0], entry[1]);
}
// // TypeScript Set
// Create Set
var Set_name = new Set();
// difference set methods
var studentEntries = new Set();
//Add Values  
studentEntries.add("John");
studentEntries.add("Peter");
studentEntries.add("Gayle");
studentEntries.add("Kohli");
studentEntries.add("Dhawan");
//Returns Set data  
console.log(studentEntries);
//Check value is present or not  
console.log(studentEntries.has("Kohli")); //true     
console.log(studentEntries.has(10)); // false 
//It returns size of Set  
console.log(studentEntries.size); //5
//Delete a value from set  
console.log(studentEntries["delete"]("Dhawan")); //true  
//Clear whole Set  
studentEntries.clear();
//Returns Set data after clear method.  
console.log(studentEntries);
// Chaining of Set Method
var studentEntries1 = new Set();
//Chaining of add() method is allowed in TypeScript  
studentEntries1.add("John").add("Peter").add("Gayle").add("Kohli");
//Returns Set data  
console.log("The List of Set values:");
console.log(studentEntries1);
// Iterating Set Data
var diceEntries = new Set();
diceEntries.add(1).add(2).add(3).add(4).add(5).add(6);
//Iterate over set entries  
console.log("Dice Entries are:");
for (var _f = 0, diceEntries_1 = diceEntries; _f < diceEntries_1.length; _f++) {
    var diceNumber = diceEntries_1[_f];
    console.log(diceNumber);
}
// Iterate set entries with forEach  
console.log("Dice Entries with forEach are:");
diceEntries.forEach(function (value) {
    console.log(value);
});
// // TypeScript Date Object
// Creating Date Object
// 1. new Date():
var date = new Date();
console.log("Date = " + date); //Date = Tue Feb 05 2019 12:05:22 GMT+0530 (IST)  
// new Date(milliseconds): 
var date1 = new Date(500000000000);
console.log("Date = " + date1); //Date = Tue Nov 05 1985 06:23:20 GMT+0530 (IST)  
// new Date ( year, month, date[, hour, minute, second, millisecond ]):
var date3 = new Date(2018, 5, 5, 17, 23, 42, 11);
console.log("Date = " + date3); //Date = Tue Jun 05 2018 17:23:42 GMT+0530 (IST)  
// Different Date Object Methods
var date4 = new Date(2017, 4, 4, 17, 23, 42, 11);
date4.setDate(13);
date4.setMonth(13);
date4.setFullYear(2013);
date4.setHours(13);
date4.setMinutes(13);
date4.setSeconds(13);
console.log("Year = " + date4.getFullYear());
console.log("Date = " + date4.getDate());
console.log("Month = " + date4.getMonth());
console.log("Day = " + date4.getDay());
console.log("Hours = " + date4.getHours());
console.log("Minutes = " + date4.getMinutes());
console.log("Seconds = " + date4.getSeconds());
