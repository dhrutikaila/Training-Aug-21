//Explain difference between var and let keyword using example. 

/*
In var if we print the value before initialize it will reurn undefined bcz of the hoisting
*/

console.log(a)
var a = 10 ;

/*
let is also allocate the memory for that variable but in seprate space not in a global space .
so you can not access this seprate memory before put anything

so in let variable accur temporal deadzone
so temporal deadzone means the timw since then the let variable is hoisted and till it is initialize the value that time is known as 
temporal deadzone

if we try to access the variable in temporal zone it will give refrence error

var is attach with window but let is not

let is more strict then var 

in let we can not be redecalred variable and it must be declare before use
*/ 

//it will give an error
let a = 100;
console.log(a);

