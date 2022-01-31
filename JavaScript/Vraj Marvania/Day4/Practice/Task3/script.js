// Make a function that takes in a single parameter and returns a new promise. using setTimeout,
// after 500 milliseconds, the promise will either resolove or reject. if the input is a string,
// the promise resolves with that reverse string . if the input is anything but a string it rejects with that same input call the function wrong Input

function wronginput() {
  return "wrong input";
}

function demo(strdata) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (isNaN(parseInt(strdata))) {
        resolve(strdata.split("").reverse().join(""));
      } else {
        reject(wronginput());
      }
    }, 500);
  });
}

function check() {
  var datav = document.getElementById("data").value;
  demo(datav)
    .then((resolve) => {
      document.getElementById("mes").innerHTML = resolve;
    })
    .catch((reject) => {
      document.getElementById("mes").innerHTML = reject;
    });
}
