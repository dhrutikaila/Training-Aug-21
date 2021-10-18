function myDisplayer(some) {
  document.getElementById("demo").innerHTML = some;
}

function myFirst() {
  myDisplayer("Hello");
}

function mySecond() {
  myDisplayer("Goodbye");
}
myFirst();
mySecond();


//calculate and then display
function myDisplayer1(some) {
  document.getElementById("demo1").innerHTML = some;
}

function myCalculator(num1, num2) {
  let sum = num1 + num2;
  return sum;
}

let result = myCalculator(5, 5);
myDisplayer1(result);

//giving method as parameter
function myDisplayer2(some) {
  document.getElementById("demo2").innerHTML = some;
}

function myCalculator2(num11, num12, myCallback) {
  let sum2 = num11 + num12;
  myCallback(sum2);
}

myCalculator2(5, 5, myDisplayer2);
