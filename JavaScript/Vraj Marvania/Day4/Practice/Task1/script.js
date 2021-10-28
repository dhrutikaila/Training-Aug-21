// <!-- Define a function called callback which receives an argument and prints the square of that number. -->
function callback(fun, no1) {
  fun(no1 ** 2);
}

function square() {
  var NO1 = document.getElementById("NO1").value;

  callback((data) => {
    document.getElementById("ans").innerHTML = "Ans- " + data;
  }, NO1);
}
