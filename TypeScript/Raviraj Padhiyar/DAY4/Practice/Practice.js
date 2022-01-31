let map = new Map();
map.set("first", "hello world");
console.log("value1 = " + map.get("first"));
console.log(map.has("first"));
console.log(map.delete("first"));
console.log(map.clear());
let ageMapping = new Map();
//set data
ageMapping.set("Rahul", 20);
ageMapping.set("Ronak", 21);
ageMapping.set("Roshan", 23);
//iterate over map with keys
for (let key of ageMapping.keys()) {
    console.log(`Map keys ${key}`);
}
//iterate over map with values
//
//
for (let value of ageMapping.keys()) {
    console.log(`Map values = ${value}`);
}
//iterate over map entries
//
for (let entry of ageMapping.entries()) {
    console.log(entry[0], entry[1]);
}
//set 
//
let myset = new Set();
myset.add("rakesh");
console.log(myset.has("rakesh"));
let studentEntries = new Set();
//add values
studentEntries.add("Rahul");
studentEntries.add("Himesh");
studentEntries.add("abhi");
studentEntries.add("Virat");
studentEntries.add("Shikhar");
console.log(studentEntries);
//check for student is present or not 
console.log("student present " + studentEntries.has("Virat"));
console.log("Student present " + studentEntries.has("ronak"));
console.log(studentEntries.size);
console.log("delete student " + studentEntries.delete("Himesh"));
console.log(studentEntries);
studentEntries.clear();
console.log(studentEntries);
//date object
let date2 = new Date(); // current time has been assigned to date variable
console.log(`date is ${date2}`);
//date string
let newDate = new Date('2021-05-21');
console.log(`new date is ${newDate}`);
let date = new Date(2021, 11, 27, 17, 23, 42, 11);
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
