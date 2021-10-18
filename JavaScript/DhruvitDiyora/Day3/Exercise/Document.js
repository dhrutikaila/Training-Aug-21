//p-1: changing text byy id:
const element = document.getElementById("1");
element.innerHTML = "New Heading";

//p-2: fetching current date
document.getElementById("2").innerHTML = "Today's date is: " + Date();

//p-3: form validation-number validation on key-press event
function validateForm() {
  let x = document.forms["myForm"]["fname"].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
}

function isNumberKey(evt) {
  var charCode = evt.which ? evt.which : event.keyCode;
  if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
    alert("Enter Number");
    return false;
  }
  return true;
}

//p-4: DOM CSS
document.getElementById("2").style.color = "blue";

//p-5: DOM Events
function changeText(id) {
  id.innerHTML = "Ooops!";
}

function displayDate() {
  document.getElementById("date").innerHTML = Date();
}

function mOver(obj) {
  obj.innerHTML = "Thank You";
}

function mOut(obj) {
  obj.innerHTML = "Mouse Over Me";
}

function mDown(obj) {
  obj.style.backgroundColor = "#1ec5e5";
  obj.innerHTML = "Released";
}

function mUp(obj) {
  obj.style.backgroundColor = "#D94A38";
  obj.innerHTML = "Thank You";
}

//p-6 event listner
document.getElementById("alertbtn").addEventListener("click", myFunction);

function myFunction() {
  alert("Hello World!!");
}
