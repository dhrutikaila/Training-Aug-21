const d = new Date()
console.log(d.getDate())

//gettime function returns result in ms
console.log(d.getTime())

//getfullyear function return the year as a result 
console.log("Year is "+d.getFullYear())

//getmonth is return the month as a number result
console.log("Month is "+d.getMonth())

//getmonth is return the month as a number result if we want name then we can use array
const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
console.log("Month is "+months[d.getMonth()])

//gethour is returns the hours
console.log("Hour is "+d.getHours())

//getMinutes is returns the minutes
console.log("Minute is "+d.getMinutes())

//getseconde is returns the seconds
console.log("Second is "+d.getSeconds())

//getmilisecond is returns the milisecond
console.log("Second is "+d.getUTCMilliseconds())

//getDay is returns the day as a number
console.log("Day is "+d.getDay())

//if we want day name as output 
const day=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
console.log("Day is "+day[d.getDay()])


//SetYear method set the year of a date object
console.log("Set year is "+d.setFullYear(2020))