//EXAMPLE 1
var Namemapping = new Map();
//set,get,has,delete,size,clear methods of map
Namemapping.set("dhruti", 1);
Namemapping.set("meet", 2);
Namemapping.set("pooja", 3);
Namemapping.set("avni", 4);
//iterate over map values 
for (var _i = 0, _a = Namemapping.keys(); _i < _a.length; _i++) {
    var key = _a[_i];
    console.log("map keys =" + key);
}
//iterate over map values 
for (var _b = 0, _c = Namemapping.values(); _b < _c.length; _b++) {
    var value = _c[_b];
    console.log("map value  =" + value);
}
//iterate over map entries
for (var _d = 0, _e = Namemapping.entries(); _d < _e.length; _d++) {
    var entry = _e[_d];
    console.log(entry[0], entry[1]);
}
//EXAMPLE 2
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
//SET EXAMPLE 1
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
console.log(studentEntries.has("Kohli"));
console.log(studentEntries.has(10));
//It returns size of Set  
console.log(studentEntries.size);
//Delete a value from set  
console.log(studentEntries["delete"]("Dhawan"));
//Clear whole Set  
studentEntries.clear();
//Returns Set data after clear method.  
console.log(studentEntries);
//Chaining of Set Method
var studentEntries1 = new Set();
//Chaining of add() method is allowed in TypeScript  
studentEntries.add("John").add("Peter").add("Gayle").add("Kohli");
//Returns Set data  
console.log("The List of Set values:");
console.log(studentEntries);
//Iterating Set Data
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
//DATE 
var date = new Date(2017, 4, 4, 17, 23, 42, 11);
date.setDate(13);
date.setMonth(13);
date.setFullYear(2013);
date.setHours(13);
date.setMinutes(13);
date.setSeconds(13);
console.log("Year = " + date.getFullYear());
console.log("Date = " + date.getDate());
console.log("Month = " + date.getMonth());
console.log("Day = " + date.getDay());
console.log("Hours = " + date.getHours());
console.log("Minutes = " + date.getMinutes());
console.log("Seconds = " + date.getSeconds());
