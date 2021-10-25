var num1 = parseInt(prompt("Enter a first number"));
document.getElementById("number1").innerHTML = "First Number = " + num1;
var num2 = parseInt(prompt("Enter a second number"));
document.getElementById("number2").innerHTML = "Second Number = " + num2;
var num3 = parseInt(prompt("Enter a third number"));
document.getElementById("number3").innerHTML = "Third Number = " + num3;

var myElement = document.getElementById("Greater");
if (num1 > num2 && num1 > num3) {
  myElement.innerText = "Greater Number = " + num1;
}
if (num2 > num1 && num2 > num3) {
  myElement.innerText = "Greater Number = " + num2;
}
if (num3 > num1 && num3 > num2) {
  myElement.innerText = "Greater Number = " + num3;
}

var sum = 0;
if (num1 > 40) {
  sum += num1;
}
if (num2 > 40) {
  sum += num2;
}
if (num3 > 40) {
  sum += num3;
}
document.getElementById("addition").innerText =
  "Addition of number's are greater than 40 = " + sum;