let text = "Leo Messi Leo Messi Leo Messi Goal Goal Goalllll";
document.getElementById("0").innerHTML = "The string : " +text;

document.getElementById("1").innerHTML = "The string length is: " +text.length;

document.getElementById("2").innerHTML = "Splitted string is: " +text.split(" ");

document.getElementById("3").innerHTML = "Sliced string is: " +text.slice(20,47);

var today = new Date();
document.getElementById("4").innerHTML = "Current date is: " +today.getDate();

let FCB = ["Messi(c)","Ter-Stegen(gk)","Busquets","Alba","Pique","De Jong","Pedri","Ansu Fati","Depay","Demir"];
document.getElementById("5").innerHTML = "The team strength is: " +FCB.length;
let x= FCB.push("Segino Dest");
document.getElementById("6").innerHTML = "Team strength after Push op: " +x;
let y= FCB.pop();
document.getElementById("7").innerHTML = "Pop op: " +y;
let z = FCB.shift();
document.getElementById("8").innerHTML = "Shift op: " +z;
document.getElementById("9").innerHTML = "Delete op: " +delete FCB[1];
