//Explain difference between var and let keyword using example. 


var a = 10;
let b = 10;

if (1) {
    var a = 99;
    let b = 99;
}

console.log(a);
console.log(b);