//University of Mumbai needs to set an online exam for their students. For that they need to set a timer for three hours. After 3 hours exams should be finished.

var sec = 0;
var min = 0;
var hr = 3;
function examStart() {
  document.getElementById("instructions").classList.add("d-none");
  document.getElementById("questionPaper").classList.remove("d-none");

  return new Promise((resolve, reject) => {
    var interval = setInterval(() => {
      counter();
    }, 1000);
    if (hr == 0 && min == 0 && sec == 0) {
      clearInterval(interval);
    }

    setTimeout(() => {
      document.getElementById("questionPaper").classList.add("d-none");
      document.getElementById("afterExam").classList.remove("d-none");
      resolve("Your answer is submitted successfully...");
    }, 3 * 3600 * 1000);
  })
    .then(() => {
      var a = document.getElementById("afterExam");
      a.innerHTML = "Your answer is submitted successfully...";
    })
    .catch((err) => {
      var b = document.getElementById("afterExam");
      b.innerHTML = err + " Please contact Invigilator";
    });
}

function counter() {
  sec--;
  if (sec < 0) {
    min--;
    sec = 59;
  }
  if (min < 0) {
    hr--;
    min = 59;
  }
  document.getElementById("timer").innerHTML =
    "Time Left: " + hr + ":" + min + ":" + sec;
  return;
}
