// 1. Map
var map = new Map();
map.set('1', 'abhishek');
map.set(1, 'www.javatpoint.com');
map.set(true, 'bool1');
map.set('2', 'ajay');
console.log("Value1= " + map.get(1));
console.log("Value2= " + map.get('1'));
console.log("Key is Present= " + map.has(3));
console.log("Size= " + map.size);
console.log("Delete value= " + map["delete"](1));
console.log("New Size= " + map.size);
// 2. Iterating map data
var ageMapping = new Map();
ageMapping.set("Rakesh", 40);
ageMapping.set("Abhishek", 25);
ageMapping.set("Amit", 30);
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
// 3. 
var studentEntriess = new Set();
//Add Values  
studentEntriess.add("Messi");
studentEntriess.add("Suarez");
studentEntriess.add("Xavi");
studentEntriess.add("Iniesta");
studentEntriess.add("Martinez");
//Returns Set data  
console.log(studentEntriess);
//Check value is present or not  
console.log(studentEntriess.has("Messi"));
console.log(studentEntriess.has(10));
//It returns size of Set  
console.log(studentEntriess.size);
//Delete a value from set  
console.log(studentEntriess["delete"]("Xavi"));
//Clear whole Set  
studentEntriess.clear();
//Returns Set data after clear method.  
console.log(studentEntriess);
//Set-2
//create
var studentEntries = new Set();
//Add Values
studentEntries.add("Leo");
studentEntries.add("Messi");
studentEntries.add("Luis");
studentEntries.add("Suarez");
studentEntries.add("Xavi");
//Returns Set data  
console.log(studentEntries);
//Check value is present or not  
console.log(studentEntries.has("Leo"));
console.log(studentEntries.has(10));
//It returns size of Set  
console.log(studentEntries.size);
//Delete a value from set  
console.log(studentEntries["delete"]("Luis"));
//Clear whole Set
studentEntries.clear();
//Returns Set data after clear method.  
console.log(studentEntries);
//adding using chain 
studentEntries.add("Leo").add("Messi").add("Goal").add("Goalll").add("Goalllll").add("Goallllll").add("Goaaaallllllllll");
//Returns Set data
console.log("The List of Set values:");
console.log(studentEntries);
//for...of
//iterate
for (var _f = 0, studentEntries_1 = studentEntries; _f < studentEntries_1.length; _f++) {
    var student = studentEntries_1[_f];
    console.log(student);
}
//foreach
studentEntries.forEach(function (value) {
    console.log(value);
});
//date objects
var date = new Date();
console.log(date);
//milliseconds
var date1 = new Date(500000000000);
console.log(date1);
//datestring
var date2 = new Date("2002-10-5");
var date3 = new Date("2025-24-06");
//will not work
var date4 = new Date("05-10-2021");
var date5 = new Date("24-06-2021");
console.log(date2);
console.log(date3);
console.log(date4);
console.log(date5);
var date6 = new Date(2020, 10, 21, 16, 26, 48, 56);
console.log(date6);
//methods
date6.setDate(21);
date6.setMonth(10);
date6.setFullYear(1999);
date6.setHours(6);
date6.setMinutes(48);
date6.setSeconds(48);
console.log("Year: " + date6.getFullYear() + "Date: " + date6.getDate() + "Month = " + date6.getMonth() + "Day = " + date6.getDay());
console.log("The time is: " + date6.getHours() + "hours " + date6.getMinutes() + "minutes " + date6.getSeconds() + "seconds");
