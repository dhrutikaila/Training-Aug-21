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
var myMap = new Map();
myMap.set("one", 1);
myMap.set("four", 4);
myMap.set("five", 5);
myMap.set(6, 'six');
myMap.set("four", 4);
myMap.set(false, 0);
console.log(myMap.get(true));
console.log(myMap.get(6));
console.log(myMap.get(1));
console.log("key check" + myMap.has(3));
console.log("key check" + myMap.has("one"));
console.log("size is" + myMap.size);
myMap["delete"]("four");
console.log("size is after delete");
myMap["delete"](5);
console.log("size is after delete 5");
for (var _i = 0, _a = myMap.keys(); _i < _a.length; _i++) {
    var key = _a[_i];
    console.log("keys are: ".concat(key));
}
for (var _b = 0, _c = myMap.values(); _b < _c.length; _b++) {
    var val = _c[_b];
    console.log("values are: ".concat(val));
}
for (var _d = 0, _e = myMap.entries(); _d < _e.length; _d++) {
    var allEntry = _e[_d];
    console.log("all entries  are: ".concat(allEntry[0], "  ").concat(allEntry[1]));
}
var ageMapping = new Map();
ageMapping.set("Rakesh", 40);
ageMapping.set("Abhishek", 25);
ageMapping.set("Amit", 30);
for (var _f = 0, _g = ageMapping.keys(); _f < _g.length; _f++) {
    var key = _g[_f];
    console.log("Map Keys= " + key);
}
//Iterate over map values  
for (var _h = 0, _j = ageMapping.values(); _h < _j.length; _h++) {
    var value = _j[_h];
    console.log("Map Values= " + value);
}
console.log("The Map Enteries are: ");
//Iterate over map entries  
for (var _k = 0, _l = ageMapping.entries(); _k < _l.length; _k++) {
    var entry = _l[_k];
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
