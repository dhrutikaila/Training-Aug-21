// * JavaScript Date Output
//* By default, JavaScript will use the browser's time zone and display a date as a full text string:
const d = new Date();
console.log(d);

// * Creating Date Objects
// * Date objects are created with the new Date() constructor.There are 4 ways to create a new date object:
// ? new Date()
// ? new Date(year, month, day, hours, minutes, seconds, milliseconds)
// ? new Date(milliseconds)
// ? new Date(date string)

const date1 = new Date();
const date2 = new Date(2021, 01, 11, 10, 33, 30, 0);
// ? JavaScript counts months from 0 to 11: January = 0 - December = 11.
const date3 = new Date(2021, 02);
const date4 = new Date(100000000000);
const date5 = new Date("October 13, 2014 11:13:00");
console.log(date1, date2, date3, date4, date5);

// * Date Methods
// * When you display a date object in HTML, it is automatically converted to a string, with the toString() method.

// ? The toUTCString() method converts a date to a UTC string (a date display standard).
// ? The toDateString() method converts a date to a more readable format:
// ? The toISOString() method converts a Date object to a string, using the ISO standard format:
console.log(date1.toUTCString(), date1.toDateString(), date1.toISOString());

// * JavaScript Date Input: There are generally 3 types of JavaScript date input formats:
// ? ISO Date :	"2015-03-25" (The International Standard)
// ? Short Date :	"03/25/2015"
// ? Long Date :	"Mar 25 2015" or "25 Mar 2015"
const d1 = new Date("2015-03-25");
const d2 = new Date("03/25/2015");
const d3 = new Date("Mar 25 2015"); // Month and day can be in any order:
console.log(d1, d2, d3);

// * you can use the Date.parse() method to convert it to milliseconds.
let msec = Date.parse("March 21, 2012");
let mDate = new Date(msec);
console.log(msec, mDate);
