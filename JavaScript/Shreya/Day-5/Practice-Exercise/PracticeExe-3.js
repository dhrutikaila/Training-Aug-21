/*
    In hoisting if we run variable before initialize it will give undefined
    for function it will print whole function
 */
console.log(a);
var a = 10;

console.log(x())

function x(){
    console.log("Function")
    return
}
/*If we not initialize the value and try to access then it will give an error like the variable is not defined 
 */
console.log(b)