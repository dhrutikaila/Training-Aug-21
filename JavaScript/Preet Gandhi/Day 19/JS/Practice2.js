// Practice_Exercise2

function rectangleArea() {
    var len = parseInt(document.getElementById("length").value);
    var wid = parseInt(document.getElementById("width").value);

    var area = new Function ("length","width","return length * width");
    var res = document.getElementById("result");
    res.value = area(len,wid);

    
}