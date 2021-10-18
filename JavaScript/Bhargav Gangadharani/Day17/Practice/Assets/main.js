function DomainName() {
    document.getElementById("domain").innerHTML = document.domain;
}

function url() {
    document.getElementById("url").innerHTML = document.URL
}

var colors = ['red', 'blue', 'yellow', 'orange', 'purple'];
count = -1;

function change(element) {
  element.style.background = colors[++count % colors.length]; 
}

function color(element){
var myVar = setInterval(changecolor, 1000);

function changecolor() {
  element.style.background = colors[++count % colors.length]; 
}}

function myStopFunction() {
  clearInterval(myVar);
}

function search(){
  window.location.assign("https://www.google.com/")
}


