var sec = 0;
var min = 0;
var hr = 3;
var timer = setInterval(counter, 1000);

let myPromise = new Promise(function (resolve, reject) {
    setTimeout(function () {
        const error = false;
        if (!error) {
            resolve();
        }
        else {
            reject();
        }
    }, 3 * 3600 * 1000);
});

myPromise.then(function () {
    alert("Time Over!! Your answers are submitted successfully.")
    window.location.assign("assignment2.html");
}).catch(function () {
    alert("Error: Contact your Invigilator!!");
});

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
    document.getElementById("timer").innerHTML = "Time Left: " + hr + ":" + min + ":" + sec;
    if (hr == 0 && min == 0 && sec == 0) {
        clearInterval(timer);
    }
    return;
}
