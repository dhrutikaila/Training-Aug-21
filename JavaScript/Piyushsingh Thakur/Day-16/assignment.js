function checkDate() {
    var date = document.getElementById('date').value;

    if (date == "") {
        alert("enter Date");
        return false;
    }

    var dt = /\d{2}-\d{2}-\d{4}$/;
    if (!dt.test(date)) {
        alert("Enter Date in Proper Formate");
        return false;
    }

    var date1 = date.split('-');

    var m = date1[0];
    var d = date1[1];
    var y = date1[2];

    if (y <= 0) {
        alert("Please enter valid year");
        return false;
    }

    if (m <= 0 || m > 12) {
        alert("Please enter valid month");
        return false;
    }

    if ((d <= 0 || d > 31) || ((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) || (m == 2 && d > 29)) {
        alert("Plaese enter valid day");
        return false;
    }

    var leapYear = false;

    if ((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0)) {
        leapYear = true;
    }

    if (!leapYear && d > 28 && m == 2) {
        alert("Enter valid date" + y + "is not a leap year");
        return false;
    }

    alert("Valid date");
}
