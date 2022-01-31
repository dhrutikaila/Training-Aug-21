// Use the getElementById method to find the <p> element, and change its text to "Hello".

document.getElementById("demo").innerHTML = "Hello";

// Use the getElementsByTagName method to find the first <p> element, and change its text to "Hello".

document.getElementsByTagName("h1")[1].innerHTML = "hello is getElementsByTagName";

// Change the text of the first element that has the class name "test".

document.getElementsByClassName("test")[0].innerHTML = "hello"

// Use HTML DOM to change the value of the image's src attribute.


document.getElementById("image").src = "pic_mountain.jpg";

// Use HTML DOM to change the value of the input field.


document.getElementById("myText").value = "Have a nice day!";

// Change the text color of the <p> element to "red".

document.getElementById("demo").style.color = "red";

// Change the font size of the p element to 40 pixels.

document.getElementById("demo").style.fontSize = "40px";

// Use the CSS display property to hide the p element.

document.getElementById("demo").style.display = "none";

// Use the eventListener to assign an onclick event to the <button> element.

document.getElementById("demo").addEventListener("click", newfun()); function newfun() { }


// window.open
function newtab() {
    window.open("https://www.google.com/")
}

// window.close
function closetab() {
    window.close()
}

// window.history.back
function backpage() {
    window.history.back()
}

// window.history.forward
function nextpage() {
    window.history.forward()
}

// window.location.href
document.getElementById("location1").innerHTML = "The full URL of this page is:<br>" + window.location.href;

// window.location.hostname;
document.getElementById("location2").innerHTML = "Page hostname is :" + window.location.hostname;

// window.location.pathname
document.getElementById("location3").innerHTML = "Page path is :" + window.location.pathname;

// window.location.protocol
document.getElementById("location4").innerHTML = "Page protocol is :" + window.location.protocol;

// window.location.port
document.getElementById("location5").innerHTML = "Port number is :" + window.location.port;

// window.innerWidth & window.innerHeight
function hight_width() {
    document.getElementById("location6").innerHTML =
        "Browser inner window width: " + window.innerWidth + "px<br>" +
        "Browser inner window height: " + window.innerHeight + "px";
}