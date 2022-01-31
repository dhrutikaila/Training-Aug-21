function cal() {
    var first = parseInt(document.getElementById('num1').value);
    var second = parseInt(document.getElementById('num2').value);
    var add = document.getElementById('add');
    var sub = document.getElementById('minus');
    var multiply = document.getElementById('multi');
    var divide = document.getElementById('division');
    var result = 0;
    if (add.checked) {
        result = first + second;
        document.getElementById('result').innerHTML = ("Your Answer is: " + result);
    }
    else if (minus.checked) {
        result = first - second;
        document.getElementById('result').innerHTML = ("Your Answer is: " + result);
    }
    else if (multi.checked) {
        result = first * second;
        document.getElementById('result').innerHTML = ("Your Answer is: " + result);
    }
    else if (division.checked) {
        result = first / second;
        document.getElementById('result').innerHTML = ("Your Answer is: " + result);
    }
    else
        alert("Please Enter Numbers to Perform a Operation")
    return false;
}
function reset() {
    document.getElementById('result').innerHTML = "Your Answer is: ";
    document.getElementById('calculater').reset();


}
