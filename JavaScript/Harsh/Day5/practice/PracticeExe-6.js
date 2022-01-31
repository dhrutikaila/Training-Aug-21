//Explain Function closure with practical
/*
Closure means function binds together with its lexical environment 
*/
/*
Inside y we have closure function y binds with the variable of x 
so its access to its parent 
BAsically closure means its like a function along with it's scope 
*/
function x() {
    var a = 7;
    function y() {
        console.log(a);
    }
    y();
}
x();