
//variable diclare
var sec = 60;
var min = 59;
var hour = 2;
var timer = documnent.getElementById("timer");

//timer logic
function showTime() {
    sec--;
    if (sec == 00) {
        min--;
        sec = 59;
    }
    if (min == 00) {
        hour--;
        min = 59;
        sec = 59;
    }

    var seconds = (sec < 10) ? "0" + sec : sec.toString();
    var minutes = (min < 10) ? "0" + min : min.toString();
    var hours = hour.toString();
    var time = "0" + hours + ":" + minutes + ":" + seconds;
    return time;
}

//Timer 
function start_exam() {
    document.getElementById("instructions").classList.add("d-none");
    document.getElementById("question").classList.remove("d-none");
    var timer = document.getElementById("timer");
    setInterval(() => {
        timer.innerText = showTime();
    }, 1000);
}




