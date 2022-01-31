var resolvedPromise, rejectedPromise, interval;
var sec = 0;
var min = 0;
var hr = 0;
var timer = document.getElementById("timer");
console.log(timer);
console.log(document.getElementById("timer"));
function setTimeExplicitly() {
  document.getElementById("timer").innerText = "00:00:00";
}

function startExam() {
  document.getElementById("startButton").style.display = "none";

  return new Promise((resolve, reject) => {
    resolvedPromise = resolve;
    rejectedPromise = reject;

    interval = setInterval(() => {
      timer.innerText = timerIncrement();
    }, 1000);

    setTimeout(() => {
      if (hr == 3) {
        clearInterval(interval);
        resolvedPromise("Exam has been over!!!");
      } else {
        setTimeExplicitly();
        rejectedPromise("You have submited this Exam!!!");
      }
    }, 3 * 60 * 60 * 1000);
  })
    .then((msg) => {
      alert(msg);
    })
    .catch((error) => {
      alert(error);
    });
}

function timerIncrement() {
  sec++;
  if (sec == 60) {
    min++;
    sec = 0;
  }
  if (min == 60) {
    hr++;
    min = 0;
    sec = 0;
  }
  var second = ("0" + sec).toString().slice(-2);
  var minute = ("0" + min).toString().slice(-2);
  var hour = ("0" + hr).toString().slice(-2);
  return `${hour}:${minute}:${second}`;
}

function endExam() {
  setTimeExplicitly();
  clearInterval(interval);
  rejectedPromise("You have submited this Exam!!!");
}
