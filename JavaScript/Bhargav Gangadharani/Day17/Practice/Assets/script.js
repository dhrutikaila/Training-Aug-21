function loadnewpage() {
    window.location.href = 'index2.html';
}

function previous() {
    window.history.back();
}

function next() {
    window.history.forward();
}

function newwindow() {
    newWin = window.open('index.html', '_blank', "width=600, height=500");
}
function resize(){
    var height = parseInt(document.getElementById('height').value);
    var width = parseInt(document.getElementById('width').value);
    window.resizeTo(width,height);
}