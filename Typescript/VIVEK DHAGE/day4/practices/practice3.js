// let date: Date = new Date(2017, 4, 4, 17, 23, 42, 11);  
// date.setDate(13);  
// date.setMonth(13);  
// date.setFullYear(2013);  
// date.setHours(13);  
// date.setMinutes(13);  
// date.setSeconds(13);  
// console.log("Year = " + date.getFullYear());  
// console.log("Date = " + date.getDate());  
// console.log("Month = " + date.getMonth());  
// console.log("Day = " + date.getDay());  
// console.log("Hours = " + date.getHours());  
// console.log("Minutes = " + date.getMinutes());  
// console.log("Seconds = " + date.getSeconds()); 
var date1 = new Date();
console.log(date1);
var date2 = new Date("2012-02-02");
console.log(date2);
var date3 = new Date(2018, 5, 5, 17, 23, 42, 11);
console.log(date3);
var date = new Date(2018, 5, 5, 17, 23, 42, 11);
console.log("Date = " + date); //Date = Tue Jun 05 2018 17:23:42 GMT+0530 (IST)  
var mydate = new Date(2018, 5, 5);
console.log("Date = " + mydate);
var date4 = new Date();
console.log("year = " + date4.getFullYear());
console.log("month = " + date4.getMonth());
console.log("day = " + date4.getDay());
console.log("hours = " + date4.getHours());
console.log("minutes = " + date4.getMinutes());
console.log("seconds = " + date4.getSeconds());
console.log("UTC DATE = " + date4.getUTCDate());
console.log("Timezone offset = " + date4.getTimezoneOffset());
