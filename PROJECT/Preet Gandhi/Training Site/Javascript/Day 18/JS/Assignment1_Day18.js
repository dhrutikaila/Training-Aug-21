// Assignment1_Day18

//declaring variables
var sec = 60;
var min = 59;
var hour = 2;
var timer = documnent.getElementById("timer");

//function for decreasing time
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

//function called on starting of exam (promise)
function examStart() {
    document.getElementById("instructions").classList.add("d-none");
    document.getElementById("questionPaper").classList.remove("d-none");

    return new Promise((resolve, reject) => {

        var timer = document.getElementById("timer");
        var interval = setInterval(() => {
            timer.innerText = showTime();
        }, 1000);

        setTimeout(() => {
            if (hour == 0 && min == 0 && sec == 0) {
                clearInterval(interval);
                document.getElementById("questionPaper").classList.add("d-none");
                document.getElementById("afterExam").classList.remove("d-none");
                resolve("Your answer is submitted successfully...");
            }
            else {
                reject("Error Occured");
            }
        }, 1000 * 5);
    })
        .then((msg) => {
            var a = document.getElementById("afterExam");
            a.innerHTML = msg;
        })
        .catch((err) => {
            var b = document.getElementById("afterExam");
            b.innerHTML = err;
        });
}




