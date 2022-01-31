console.log("-------------------TypeScript map----------------------");
var map = new Map();
map.set(2, "Rakesh");
map.set('1', 'abhishek');
map.set(1, 'www.javatpoint.com');
map.set(true, 'bool1');
map.set('2', 'ajay');
console.log("Name=" + map.has(true));
console.log("Value1= " + map.get(1));
console.log("Value2= " + map.get('1'));
console.log("Key is Present= " + map.has(3));
console.log("Size= " + map.size);
console.log("Delete value= " + map["delete"](1));
console.log("New Size= " + map.size);
console.log("Value1= " + map.get(1));
var nameMepping = new Map();
nameMepping.set(1, "Ramniklal");
nameMepping.set(2, "Kamlesh");
nameMepping.set(3, "Deep");
console.log("Name=".concat(nameMepping.get(1)));
console.log("Name=".concat(nameMepping.has(2)));
console.log("Name=".concat(nameMepping.size));
// console.log(`Name=${nameMepping.delete(4)}`);
// console.log(nameMepping.clear());
console.log("----------------------");
for (var _i = 0, _a = nameMepping.keys(); _i < _a.length; _i++) {
    var Key = _a[_i];
    console.log("Map Key Is:", Key);
    // console.log(nameMepping.get(Key));
}
console.log("----------------------");
for (var _b = 0, _c = nameMepping.values(); _b < _c.length; _b++) {
    var Value = _c[_b];
    console.log("Map Value Is:", Value);
    // console.log(nameMepping.get(Key));
}
console.log("----------------------");
for (var _d = 0, _e = nameMepping.entries(); _d < _e.length; _d++) {
    var entries = _e[_d];
    console.log(entries[0], entries[1]);
    // console.log(nameMepping.get(Key));
}
console.log("-------------------TypeScript Set----------------------");
var StudentEntries = new Set();
//Add Values  
StudentEntries.add("Deep");
StudentEntries.add("Manoj");
StudentEntries.add("Smite");
StudentEntries.add("Ganesh");
//Returns Set data 
console.log(StudentEntries);
//Check value is present or not  
console.log(StudentEntries.has("Deep"));
console.log(StudentEntries.has("Heer"));
//It returns size of Set  
console.log(StudentEntries.size);
//Delete a value from set  
StudentEntries["delete"]("Manoj");
console.log(StudentEntries);
//Clear whole Set  
StudentEntries.clear();
console.log(StudentEntries);
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
console.log("--------------------Date Object-------------------------------");
var date1 = new Date();
console.log("Date = " + date1); //Date = Tue Feb 05 2019 12:05:22 GMT+0530 (IST)  
var date2 = new Date(500000000000);
console.log("Date = " + date2); //Date = Tue Nov 05 1985 06:23:20 GMT+0530 (IST)  
var date3 = new Date("2019-01-16");
console.log("Date = " + date3); //Date = Wed Jan 16 2019 05:30:00 GMT+0530 (IST)  
var date4 = new Date(2018, 5, 5, 17, 23, 42, 11);
console.log("Date = " + date4); //Date = Tue Jun 05 2018 17:23:42 GMT+0530 (IST)  
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
