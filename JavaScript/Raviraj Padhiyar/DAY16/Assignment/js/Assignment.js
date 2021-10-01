// var str = prompt("enter date in form mm-dd-yyyy");
var str = "09-30-2021";


var month, day, year;


function chkDate(dateStr) {
    //date string contain digits and "-" only

    var datepattern = /^\d{2}\-\d{2}\-\d{4}$/
    if (!(datepattern.test(dateStr))) {
        return false;
    }

    //check month range
    month = dateStr.slice(0, 2);
    if (!(month <= 12 && month >= 1)) return false;

    //check day
    day = dateStr.slice(3, 5);
    if (!(day <= 31 && day >= 1)) return false;

    //check day for month is right or not

    if (day == 31 && !((month <= 7 && month & 1) || (month >= 8 && !(month & 1)))) return false;

    //febrauary case

    if (month == 2 && day > 28) return false;

    year = dateStr.slice(6);

    //leap year

    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) && month == 2 && day > 29) return false;

    return true;
}

function validDate() {
    if (chkDate(str)) {

        alert("the date you entered is valid");

        var date = new Date(year, month - 1, day);

        document.getElementById("date").innerHTML = date.toDateString();
    }
    else {
        alert("wrong date");
    }
}
