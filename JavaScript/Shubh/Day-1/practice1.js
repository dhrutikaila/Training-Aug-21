
function findGreater() {
    var num1 = parseInt(prompt("Enter Number1 : ", 0));
    var num2 = parseInt(prompt("Enter Number2 : ", 0));
    var num3 = parseInt(prompt("Enter Number3 : ", 0));
    var total = 0;

    if (num1 > num2 && num1 > num3) {
        alert("Num1 is Greater : " + num1);
    }
    else if (num2 > num1 && num2 > num3) {
        alert("Num2 is Greater : " + num2);
    }
    else if (num1 == num2 && num2 == num3) {
        alert("All numbers are equal " + num1);
    }
    else {
        alert("Num3 is Greater : " + num3);
    }

    if (num1 > 40) {
        total += num1;
    }

    if (num2 > 40) {
        total += num2;
    }

    if (num3 > 40) {
        total += num3;
    }

    alert("Total of numbers which is greater than 40 : " + total);
}
