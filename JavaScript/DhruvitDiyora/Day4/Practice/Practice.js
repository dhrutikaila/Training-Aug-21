//Define a function called callback which receives an argument and prints the square of that number.

function displayData(some) {
  document.getElementById("square").innerHTML = some;
}

function myCalculator2(num, myCallback) {
  let square = num*num;
  myCallback(square);
}

myCalculator2(5, displayData);


//Make a function that takes in a single parameter and returns a new promise. using setTimeout, after 500 milliseconds, the promise will either resolove or reject. if the input is a string, the promise resolves with that reverse string . if the input is anything but a string it rejects with that same input call the function wrong Input
function stringCheck(stringvalue) {
    return new Promise((resolve, reject) =>
        setTimeout(() => {
            if (typeof stringvalue === 'string' || stringvalue instanceof String) {
                resolve("Reverse String  " + stringvalue.split('').reverse().join(''));
            }
            else {
                reject(stringvalue + "all the function wrong Input")
            }
        }, 500)
    )
        .then((result) => {
            document.getElementById("strings").innerHTML = result;
        })
}
stringCheck("hello");

// Explain difference between var and let keyword using example. 
//var example
console.log(x);
var x=5;
console.log(x);

//let example
console.log(y);
let y=5;
console.log(y);



