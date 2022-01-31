var examwindow;
var count = 3600*3;
var counter; 

//Opens exam page
function startexam()
{
    examwindow = window.open("http://127.0.0.1:5500/Day4/Assignment/exam.html");
    document.getElementById("btn1").disabled = true;
    document.getElementById("header1").innerHTML = "Exam Started!"
    
    //Callback timer
    counter = setInterval(timer, 1000);
}

//Countdown of 3hours
function timer() 
{
    count = count - 1;
    
    //Close exam window after countdown ends 
    if (count == -1) {
        clearInterval(counter);
        alert("Exam over!");
        examwindow.close();
    }

    var seconds = count % 60;
    var minutes = Math.floor(count / 60);
    var hours = Math.floor(minutes / 60);
    minutes %= 60;
    hours %= 60;
    examwindow.document.getElementById("timer").innerHTML = "Time left : "+hours + ":" + minutes + ":" + seconds;
}


//Close window on submit
function submitexam()
{
    window.close();
}

