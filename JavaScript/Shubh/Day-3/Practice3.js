        //Use the getElementById method to find the <p> element, and change its text to "Hello".
        document.getElementById("1").innerHTML= "Hello" ;

        //Use the getElementsByTagName method to find the first <p> element, and change its text to "Hello".
        document.getElementsByTagName("p")[0].innerHTML = "Hello";

        //Use HTML DOM to change the value of the image's src attribute.
        document.getElementById("image").src = "../../../HTML/Shubh/Day-4/Assets/iniesta.jpg";

        //Use HTML DOM to change the value of the input field.
        document.getElementById("myText").value= "Have a nice day!";

        //Change the text color of the <p> element to "red".
        document.getElementById("0").style.color = "red";

        //Use the CSS display property to hide the p element.
        document.getElementById("2").style.display = "none";

        //Use Window.location object to navigate on another page.
        function newDoc() {
            window.location.assign("https://www.the-aiff.com/")
            }

        //Use Window.history object to move to previous url in the history list
        function goBack() {
            window.history.back()
            }

        //Try to change windows height and width using Windows object
        var myWindow;
        function openWin() {
        myWindow = window.open("", "", "width=100, height=100");
        }

        function resizeWin() {
        myWindow.resizeTo(250, 250);
        myWindow.focus();
        }