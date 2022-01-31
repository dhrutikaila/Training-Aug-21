let ageMapping = new Map();  
   
ageMapping.set("Rutvik", 40);  
ageMapping.set("Nayan", 25);  
ageMapping.set("Shivam", 30);  
   
//Iterate over map keys  
for (let key of ageMapping.keys()) {  
    console.log("Map Keys= " +key);          
}  
//Iterate over map values  
for (let value of ageMapping.values()) {  
    console.log("Map Values= " +value);      
}  
console.log("The Map Enteries are: ");   
//Iterate over map entries  
for (let entry of ageMapping.entries()) {  
    console.log(entry[1], entry[1]);   
}  

// set

let studentEntries = new Set();  
   
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
console.log(studentEntries.delete("Dhawan"));      
   
//Clear whole Set  
studentEntries.clear();   
  
//Returns Set data after clear method.  
console.log(studentEntries);  

// Chaining of Set Method

let studentEntries1 = new Set();  
   
//Chaining of add() method is allowed in TypeScript  
studentEntries1.add("John").add("Peter").add("Gayle").add("Kohli");  
  
//Returns Set data  
console.log("The List of Set values:");  
console.log(studentEntries1);  

// Iterating Set Data

let diceEntries = new Set();  
  
diceEntries.add(1).add(2).add(3).add(4).add(5).add(6);  
   
//Iterate over set entries  
console.log("Dice Entries are:");   
for (let diceNumber of diceEntries) {  
    console.log(diceNumber);   
}  
   
// Iterate set entries with forEach  
console.log("Dice Entries with forEach are:");   
diceEntries.forEach(function(value) {  
  console.log(value);     
}); 


// Date

let date: Date = new Date(2017, 4, 4, 17, 23, 42, 11);  
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

// Example

let date1: Date = new Date();  
console.log("Date = " + date1);  

let date2: Date = new Date(500000000000);  
console.log("Date = " + date2);  

let date3: Date = new Date("2019-01-16");  
console.log("Date = " + date3); 

let date4: Date = new Date(2018, 0O5, 0O5, 17, 23, 42, 11);  
console.log("Date = " + date4);