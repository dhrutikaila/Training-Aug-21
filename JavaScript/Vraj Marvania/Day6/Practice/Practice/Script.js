// Web Storage API
// The localStorage Object
// setItem()
localStorage.setItem("name", "vraj marvania");
// getItem()
var fullname = localStorage.getItem("name");
console.log(fullname);

// The sessionStorage Object
sessionStorage.setItem("name", "vraj marvania");

// getItem()
var fullname = sessionStorage.getItem("name");
console.log(fullname);

// The key() method returns name of the key
localStorage.setItem("mytime", Date.now());
localStorage.setItem("myname", "John");
localStorage.setItem("myage", 36);

for (i = 0; i < localStorage.length; i++) {
  x = localStorage.key(i);
  console.log(x);
}

// length function for length
console.log(sessionStorage.length);

// removeItem()
localStorage.removeItem("name");

// Remove all local storage items:

localStorage.clear();
console.log(localStorage.length);

console.log("Web Fetch API");

// Web Fetch API

async function getText(file) {
  var demo = await fetch("./dem.txt");
  let myText = await demo.text();
  console.log(myText);
}
getText();

// get current location
function getLocation2() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition2);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition2(position) {
  document.write(
    "Latitude: " +
      position.coords.latitude +
      "<br>Longitude: " +
      position.coords.longitude
  );
}

getLocation2();

// watchPosition() - Returns the current position of the user and continues to return
// updated position as the user moves (like the GPS in a car).

var x = document.getElementById("demo");
function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.watchPosition(showPosition);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}
function showPosition(position) {
  document.write(
    "Latitude: " +
      position.coords.latitude +
      "<br>Longitude: " +
      position.coords.longitude +
      "<br>"
  );
}
