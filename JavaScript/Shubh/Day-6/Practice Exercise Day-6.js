//Longi-lati. of user's location
const x = document.getElementById("locate");

function getLocation() {
  try {
    navigator.geolocation.getCurrentPosition(showPosition);
  } catch {
    x.innerHTML = err;
  }
}

function showPosition(position) {
  x.innerHTML = "Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;
}

//JS Validation
function myFunctionn() {
    const inpObj = document.getElementById("id1");
    if (!inpObj.checkValidity()) {
      alert(inpObj.validationMessage);
    } else {
      alert("Input OK");
    } 
  } 

//setItem & getItem in LocalStorage & SessionStorage
localStorage.setItem("name","James Bond");
sessionStorage.setItem("name","Rajnikant");
var FCB= ["Messi","Busquets","Alba","Pique","Ter-Stegen","Pedri","De Jong"];
localStorage.setItem("visca_el_barca", JSON.stringify(FCB)); //store colors
document.getElementById("get").innerHTML ="(Local Storage) The name is Bond... " +localStorage.getItem("name")
+"<br>" +sessionStorage.getItem("name")+" Minddd it. (Session Storage)"

//key
function myFunction() {
    var x = localStorage.key(2);
    document.getElementById("key").innerHTML = x;
  }

//web-worker
let w;

function startWorker() {
  if(typeof(w) == "undefined") {
    w = new Worker("Practice Exercise Day-6.js");
  }
  w.onmessage = function(event) {
    document.getElementById("work").innerHTML = event.data;
  };
}

function stopWorker() { 
  w.terminate();
  w = undefined;
}
  