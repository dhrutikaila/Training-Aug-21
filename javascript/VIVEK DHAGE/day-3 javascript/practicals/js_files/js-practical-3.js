var myWindow;

function openwin() {
  myWindow = window.open("", "", "width=105, height=80");
}

function resizewin() {
  myWindow.resizeTo(1000, 2000);
  myWindow.focus();
}

function goBack() {
  window.history.back()
}
function goForward() {
  window.history.forward()
}
function f(){
  alert("working")
}
function win() {
  window.location.assign("https://www.uefa.com")
}
