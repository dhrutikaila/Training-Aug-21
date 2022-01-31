// Practice_Exercise 1

function circleArea(){
    var area = function(rad){
        var PI = 3.14;
        var res = document.getElementById("result");
        res.value = PI * rad * rad;
    }

    var userInput = document.getElementById("radius").value;
    area(userInput);
}

