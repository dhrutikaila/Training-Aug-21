
function startexam(){
    if(confirm("you want to start your exam"))
    {
     
            
       examstart();
    }
};

function examstart(){
    var myexam = window.open("page.html","_self")
}

function timers() {
    setTimeout(() => {
      alert("Test 3 Hour time is completed");
      examfinish();
    }, 1.08e+7);
  }

function examfinish() {
    myexam = window.open("Index.html", "_self");
  }

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

