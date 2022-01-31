//var example
console.log(x);
var x=5;
console.log(x);

//let example
console.log(y);
let y=5;
console.log(y);


// calling x after definition
var x1 = 5;
document.write(x1, "\n");

// calling y after definition 
let y1 = 10;
document.write(y1, "\n");

// calling var z before definition will return undefined
document.write(z, "\n");
var z = 2;

// calling let a before definition will give error
document.write(a);
let a = 3;

//
function colour() {
  
    setInterval(function() {

        if (document.getElementById('var').style.color == 'black')
            var col1 = 'blue';
        else
            col1 = 'black';

        // setting value of color 1 through var

        if (document.getElementById('let').style.color == 'black') {
            let col2 = 'red';
        } else {
            col2 = 'black';
        }

        // setting value of color 2 through let

        document.getElementById('var').style.color = col1;

        document.getElementById('let').style.color = col2;

        // changing color of h1 in html
    }, 500);

}