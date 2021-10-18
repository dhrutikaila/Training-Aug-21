//client-side validation example in ppt
function correct() {
    var input_object = document.getElementById('serial');
    var value = input_object.value;
    var current_length = value.length;
    if (current_length) {
        var last_char = value.substring(current_length - 1);
        switch (current_length) {
            case 4:
            case 8:
            case 11:
                if (last_char != '-') {
                    value = value.substring(0, current_length - 1);
                }
                break;
            default:
                if (!/\d/.test(last_char)) {
                    value.value.substring(0, current_length - 1);
                }
        }
        if (current_length > 12) {
            value = value.substring(current_length - 1);
        }
        current_length = value.length;
        switch (current_length) {
            case 3:
            case 7:
            case 10:
                value += "-"
        }
        input_object.value = value;
        
    }
}


document.getElementById("demo").innerHTML = "Hello";
//Use the getElementsByTagName method to find the first <p> element, and change its text to "Hello".
document.getElementsByTagName("p")[1].innerHTML = "Hello";


//Change the text of the first element that has the class name "test".

document.getElementsByClassName("test")[0].innerHTML = "Hello";


//Use HTML DOM to change the value of the image's src attribute.
document.getElementById("image").src = "pic_mountain.jpg";

//Use HTML DOM to change the value of the input field
document.getElementById("myText").value = "Have a nice day!";

//Change the text color of the <p> element to "red
document.getElementById("demo3").style.color = "red";

//Change the font size of the p element to 40 pixels
document.getElementById("demo4").style.fontSize = "40px";

//Use the CSS display property to hide the p element
document.getElementById("demo5").style.display = "none";

//Use the eventListener to assign an onclick event to the <button> element.
document.getElementById("demo6").addEventListener("click", resizing());

//Use Window.location object to navigate on another page
function navigate() {
  window.location.assign("https://www.google.com")
}

//Use Window.history object to move to previous url in the history list
function goBack() {
  window.history.back()
}

//Try to change windows height and width using Windows object
function resizing() {
    window.innerWidth = 700;
    window.innerHeight = 700;

    window.resizeBy(250 ,250);
}
