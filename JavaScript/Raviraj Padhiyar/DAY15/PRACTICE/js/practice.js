// var num1 = parseInt(prompt("enter a first number"));
// var num2 = parseInt(prompt("enter a second number"));
// var num3 = parseInt(prompt("enter a third number"));

var arr = new Array(
  parseInt(prompt("enter a first number")),
  parseInt(prompt("enter a first number")),
  parseInt(prompt("enter a first number"))
);

var max;

if (arr[1] > arr[2]) {
  max = arr[1] > arr[2] ? arr[1] : arr[3];
} else {
  max = arr[2] > arr[3] ? arr[2] : arr[3];
}

console.log(max);

var sum = 0;
for (i of arr) {
  if (i > 40) sum += i;
}

console.log(sum);

//Declare array with 5 city names and iterate these values with the help of loop and display it with alert.

var cities = new Array("Ahmedabad", "Rajkot", "Surat", "Vadodara", "Anand");

for (city of cities) {
  alert(city);
}
