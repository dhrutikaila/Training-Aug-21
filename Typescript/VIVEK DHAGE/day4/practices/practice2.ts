// let map = new Map();  
  
// map.set('1', 'abhishek');     
// map.set(1, 'www.javatpoint.com');       
// map.set(true, 'bool1');   
// map.set('2', 'ajay');  
  
// console.log( "Value1= " +map.get(1)   );   
// console.log("Value2= " + map.get('1') );   
// console.log( "Key is Present= " +map.has(3) );   
// console.log( "Size= " +map.size );   
// console.log( "Delete value= " +map.delete(1) );   
// console.log( "New Size= " +map.size );  

let myMap = new Map();

myMap.set("one",1);
myMap.set("four",4);
myMap.set("five",5);
myMap.set(6,'six');
myMap.set("four",4);
myMap.set(false,0);

console.log(myMap.get(true));
console.log(myMap.get(6));
console.log(myMap.get(1));

console.log("key check"+myMap.has(3));
console.log("key check"+myMap.has("one"));

console.log("size is"+myMap.size);
myMap.delete("four")
console.log("size is after delete");
myMap.delete(5)
console.log("size is after delete 5");


for(let key of myMap.keys()){
    console.log(`keys are: ${key}`)
}


for(var val of myMap.values()){
    console.log(`values are: ${val}`)
}


for(var allEntry of myMap.entries()){
    console.log(`all entries  are: ${allEntry[0]}  ${allEntry[1]}`)
}



let ageMapping = new Map();  
   
ageMapping.set("Rakesh", 40);  
ageMapping.set("Abhishek", 25);  
ageMapping.set("Amit", 30);  





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
    console.log(entry[0], entry[1]);   
}  


// //map with destructing
// var map = new Map([
//     [ "a", 10 ],
//     [ "b", 20 ],
//     [ "c", 30 ]
//  ]);

// for (let [key, value] of map.entries()) {
//     console.log(key, value);
// }