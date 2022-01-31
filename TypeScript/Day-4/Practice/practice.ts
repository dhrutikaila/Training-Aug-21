// map practice 

let data = new Map(); //create map 
data.set('1','shreya')
data.set(1 , "Diya")
data.set(true , 'IsBool')
data.set(2 , "Dhyanavi")

console.log("For 1st : " + data.get(1))
console.log("val2 "+data.get('1'))
console.log("val3 "+data.get(3)) // if key is not present then it will return Undefined 
console.log("val4 "+data.get(2))
console.log("val5 "+data.get(true))
console.log(data.has(5))
console.log("Size"+data.size)
//iterating map data 
//iterate over map key 

for (let a of data.keys()){
    console.log("Map key are "+a)
}

//iterate over values 

for(let a of data.values()){
    console.log("Values are "+a)
}

//map entries
console.log("Map entries are :: ")
for (let a of data.entries()){
    console.log(a[0], a[1])
}

//set 
let mySet = new Set();
mySet.add("shreya"); //adding value
mySet.add("Diya");
mySet.add("shreya");
mySet.add(1);
mySet.add(17);
mySet.add("Dhyanavi");

console.log(mySet)  //get data
//check value is present or not
console.log(mySet.has("Thakkar"))
console.log(mySet.has("Diya"))

//return size
console.log(mySet.size)

//delete value from set 
console.log(mySet.delete(1));

//clear set
mySet.clear();
//now print it 
//it will return empty set
console.log(mySet)

//chaining of set method 
let student = new Set();
student.add("Shreya").add("Diya").add("Dharal").add("Dhyanavi");
console.log("-----List of student-----")
//console.log(student)
for(var i of student){
    console.log(i)
}

console.log("---for each loop---")
student.forEach(element => {
    console.log(element)
});

//date
var date1 = new Date();
console.log(date1)

var date2 : Date = new Date("2021-01-18")
console.log(date2)

var date3 : Date = new Date(2018 , 0o5 , 0o5 , 17 , 23, 42 , 11)
console.log(date3)

var date4 : Date = new Date(2020 , 4,4,17,23,42,11)
date4.setDate(17);
date4.setMonth(8);
date4.setFullYear(2000);
date4.setHours(4);
date4.setMinutes(30);
date4.setSeconds(100);
console.log("Year : "+date4.getFullYear())
console.log("Month : "+date4.getMonth())
console.log("Day : "+date4.getDate())
console.log("Hour : "+date4.getHours())
console.log("Minute : "+date4.getMinutes())
console.log("Second : "+date4.getSeconds())
