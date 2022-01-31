// University of Mumbai needs to set an online exam for their students. For that they need to set a timer for three >hours. After 3 hours exams should be finished.


//on click start exam button 
var myWindow;
function opentest() {
  if (confirm("you want to start your exam")) {
    start();  //call start exam
  }
}

//start exam
function start() {
  myWindow = window.open("test.html", "_self");
}


//main timer for exam 
function timers() {
  setTimeout(() => {
    alert("Test 3 Hour time is completed");
    closetest();
  }, 1.08e+7);// 3 hour close test page
}

//closetest 
function closetest() {
  myWindow = window.open("index.html", "_self");
}


// Exam display timer
var sec = 0,min = 0, hour = 0;

function timer() {
    sec++;
    if (sec == 60) {
      min += 1;
      sec = 0;
      document.getElementById("min").innerHTML = min;
    }
    if (min == 60) {
      hour += 1;
      min = 0;
      document.getElementById("hour").innerHTML = hour;
    }
    document.getElementById("sec").innerHTML = sec;
 
  }
setInterval(timer, 1000);