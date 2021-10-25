//  University of Mumbai needs to set an online exam for their students. For that they need to set a timer for three hours. After 3 hours exams should be finished.
// Note: Use promises and callbacks 
function exam_promise(err) {
    return new Promise(function (resolve, reject) {
        setTimeout(() => {
            var error = err;
            if (!error) {
                resolve();
            }
            else {
                reject();
            }
        }, 10800000);
        
    })
}

function examStart() {
    var hr = 3;
    var min = 0;
    var sec = 0;
    var clock = setInterval(start, 1000);// Every Second it Exexute start function

    function start() {
        sec--;
        if (sec < 0) {
            min--;
            sec = 60;
        }
        if (min < 0) {
            hr--;
            min = 59;
        }
        // var second=(sec<10) ? ("0"+sec.toString) : sec.toString; //make second two digit
        var second; //make second two digit
        if (min < 10) {
            minute = "0" + min;
        } else {
            minute = min.toString();
        }

        var minute; //make minute two digit
        if (sec < 10) {
            second = "0" + sec;
        } else {
            second = sec.toString();
        }

        var hour; //make minute two digit
        if (hr < 10) {
            hour = "0" + hr;
        } else {
            hour = hr.toString();
        }

        document.getElementById("clock").innerHTML = "Time Left : " + hour + " : " + minute + " : " + second;

        if (minute == "00" && second == "00" && hour == "00") {
            clearInterval(clock);
            exam_promise(false)
            .then(() => document.getElementById("finish").innerHTML = "Your Exam is Submited Successfully")
            .catch(()=>document.getElementById("error").innerHTML="Please Contact to HR for this Error");
        }
    }

}