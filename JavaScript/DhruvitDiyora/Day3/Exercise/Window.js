//alert
function msg(){  
 alert("Hello Alert Box");  
}

//confirm
function delet() {
    var v = confirm("Are u sure?");
    if (v == true) {
        alert("ok");
    }
    else {
        alert("cancel");
    }
}

//prompt
function promt(){  
    var v= prompt("Who are you?");  
    alert("I am "+v);  
  
}

//open
function opens(){  
open("http://www.google.com");  
}

function timeout(){  
    setTimeout(  
        function(){  
            alert("Welcome to site after 2 seconds")  
    },2000);  
  
} 
//window location
document.getElementById("paragraph1").innerHTML = "Page location is " + window.location.href;

//window hostname
document.getElementById("paragraph2").innerHTML = "Hostname is " + window.location.hostname;

//Location Pathname
document.getElementById("paragraph3").innerHTML = "Pathname is " + window.location.pathname;

//location protocol
document.getElementById("paragraph4").innerHTML = "Page location protocol is " + window.location.protocol;

//location port
document.getElementById("paragraph5").innerHTML = "port number is " + window.location.port;

//assign location 
function newDoc() {
  window.location.assign("https://www.google.com")
}