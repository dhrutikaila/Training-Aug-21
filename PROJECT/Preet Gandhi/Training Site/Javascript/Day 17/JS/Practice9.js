// Practice-Exercise9

var myWindow;
function clickToOpenWindow() {
   myWindow = window.open("","","width=200,height=200");
}

function clickToResizeWindow() {
    myWindow.resizeTo(500,500);
    myWindow.focus();
}