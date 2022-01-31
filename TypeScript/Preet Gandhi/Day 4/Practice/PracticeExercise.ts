//MAP

let mapValue = new Map();

//mapValue takes any data type for Key and Value.
mapValue.set(1,"Number 1", );
mapValue.set("Two","Number 2");
mapValue.set(true, 1);

//mapValue.get
console.log(`Value 1: ${mapValue.get(1)}`); //Number 1
console.log(`Value Two: ${mapValue.get("Two")}`); //Number 2
console.log(`Value of true: ${mapValue.get(true)}`); //1

//mapValue.has
console.log(`This key is Present? ${mapValue.has(3)}`); //false
console.log(`This key is Present? ${mapValue.has(1)}`); //true

//mapValue.size
console.log(`Size of mapValue is: ${mapValue.size}`); //3

//mapValue.delete
console.log(`Delete Key 'true': ${mapValue.delete(true)}`); //true
console.log("-------------------------------------");

//iterating map data
let ageMapping = new Map();

ageMapping.set("Hiren", 20);
ageMapping.set("Jai", 25);
ageMapping.set("Meet", 30);

//iterate keys
for (let keys of ageMapping.keys()){
    console.log(`Key: ${keys}`);
}

//iterate values
for (let values of ageMapping.values()){
    console.log(`Value: ${values}`);
}

//iterate entries
for( let entries of ageMapping.entries()){
    console.log(`Entry: ${entries[0]}, ${entries[1]}`);
}
console.log("++++++++++++++++++++++++++++++++++++++++");


//SETS

let studentEntries = new Set();

//adding data into set
studentEntries.add(1);
studentEntries.add("John");
studentEntries.add(true);
studentEntries.add("Peter");

//Returningset data
console.log(studentEntries);

//check key is present or not
console.log(studentEntries.has("John")); //true
console.log(studentEntries.has("jason")); //false

//size of set
console.log(studentEntries.size); //4

//delete one key from set
console.log(studentEntries.delete("peter")); //false
console.log(studentEntries.delete("Peter")); //true

//clear whole set
studentEntries.clear();
console.log(studentEntries);
console.log("-------------------------------------");

//Chaining of set method
let setValues = new Set();

setValues.add(1).add("John").add(5).add(true);

//iterating data from set
let diceNumbers = new Set();

diceNumbers.add(1).add(2).add(3).add(4).add(5).add(6);

for(let num of diceNumbers){
    console.log(num);
}
console.log("++++++++++++++++++++++++++++++++++++++++");


//Date objects
let date: Date = new Date();
console.log(date);

let date2: Date = new Date(500000000000);  
console.log(date2);

let date3: Date = new Date("2021-11-20");  
console.log(date3);

let date4: Date = new Date(2021, 0O0, 14, 10,0O0,0O0,0O0);
console.log(date4);

let date5: Date = new Date();
date5.setDate(15);
date5.setMonth(10);
date5.setFullYear(2000);
date5.setHours(13);
date5.setMinutes(25);
date5.setSeconds(19);

console.log(`${date5.getDate()}/${date5.getMonth()}/${date5.getFullYear()} - ${date5.getHours()}:${date5.getMinutes()}:${date5.getSeconds()}`);