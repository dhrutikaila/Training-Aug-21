// Practice Exercise_1
var square = function (num) {
  var res = num * num;
  document.getElementById("result").innerHTML = "Result: " + res;
};

// Practice Exercise_2
function string_reverse() {
  return new Promise(function (resolve, reject) {
    var string = document.getElementById("massage").value;
    setTimeout(function () {
      if (isNaN(string)) {
        resolve(
          (document.getElementById("result").innerHTML = string
            .split("")
            .reverse()
            .join(""))
        );
      } else {
        reject(document.getElementById("result").innerHTML ="wrong Input");
      }
    }, 500);
  });
}

