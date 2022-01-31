
const num1 = document.getElementById("num1");
const num2 = document.getElementById("num2");

function myCal() {
  var n1 = parseInt(num1.value);
  var n2 = parseInt(num2.value);

  if (isNaN(n1) || isNaN(n2)) {
    alert("enter valid numbers");
  } else if (document.getElementById("add").checked) {
    document.getElementById("result").innerHTML = n1 + n2;
  } else if (document.getElementById("sub").checked) {
    document.getElementById("result").innerHTML = n1 - n2;
  } else if (document.getElementById("mul").checked) {
    document.getElementById("result").innerHTML = n1 * n2;
  } else if (document.getElementById("div").checked) {
    document.getElementById("result").innerHTML = n1 / n2;
  } else {
    alert("please choose valid operation");
  }
}

function reset() {
  // window.location = window.location.href;
  num1.value = null;
  num2.value = null;

  for (i of document.querySelectorAll("div input[name='operation']")) {
    i.checked = null;
  }
}
