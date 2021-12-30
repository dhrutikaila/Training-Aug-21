//Generics
//simple number Identity function
// function Identity(arg : number) number {
//     return arg;
// }
// Identity(2);
function Identity(arg) {
    return arg;
}
console.log(Identity({ name: "Raviraj", height: 180, weight: 65 }));
//now let us update Idneity func
// function Identity2<Type>(arg:Type) :Type {
//     // console.log(arg.length); => throw error as type doesnt define a valid lenght property for all possible types
//     return arg;
// }
function Identity2(arg) {
    console.log(arg.length); // works because the compiler know that we are passing array and array has a length property
    return arg;
}
console.log(Identity2([2, 3, 4, 5, 6, 5]));
