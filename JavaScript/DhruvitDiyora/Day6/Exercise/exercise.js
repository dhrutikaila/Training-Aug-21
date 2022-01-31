//Web Storage API
// Store
localStorage.setItem("lastname", "Diyora");
localStorage.setItem("firstname", "Dhruvit");

// Retrieve
document.getElementById("result").innerHTML = localStorage.getItem("lastname");
document.getElementById("fname").innerHTML = localStorage.getItem("firstname");

//remove
localStorage.removeItem("firstname");
document.getElementById("fname2").innerHTML = localStorage.getItem("firstname");



//geolocation API
var x = document.getElementById("location");

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  x.innerHTML = "Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude +
    "<br>Accuracy: " + position.coords.accuracy +
    "<br>Altitude: " + position.coords.altitude +
    "<br>AltitudeAccuracy: " + position.coords.altitudeAccuracy +
    "<br>Heading: " + position.coords.heading +
    "<br>Speed: " + position.coords.speed +
    "<br>Timestamp: " + position.timestamp;
}

