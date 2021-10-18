function validateDate(date)
{
    //regex for pattern
    var dateformat = /^(0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])[\/\-]\d{4}$/;

    //checking for date and splitting
    if (date.match(dateformat)) {
        var date2 = date.split('-');
    }
    else {
        alert('Please Enter the Date in valid format !');
        return;        
    }
    if (date2.length > 1 && date2.length < 4) {
        var dDate = date.split('-');
        console.log(dDate);
    }

    //getting month date and year
    var mm  = parseInt(dDate[0]);
    var dd = parseInt(dDate[1]);
    var yy = parseInt(dDate[2]);
    
    if (!isNaN(yy)) {
        debugger;
        if (mm > 0 && mm < 13) {
            if (mm == 01 || mm == 03 || mm == 05 || mm == 07 || mm == 08 || mm == 10 || mm == 12) {
                if (dd > 31 || dd<01) {
                    alert(mm + " month should have days between 0 to 31")
                    return;
                }
            }
            if (mm == 04 || mm == 06 || mm == 09 || mm == 11) {
                if (dd > 30 || dd<01) {
                    alert(mm + " month should have days between 0 to 30");
                    return;
                }
            }
            if (mm == 02) {
                if (leapyear(yy)) {
                    if (dd > 29 || dd<01) {
                        alert(mm + " month should have days between 0 to 29 ");
                        return;
                    }                    
                }
                else {
                    if (dd > 28 || dd<01) {
                        alert(mm + " month should have days between 0 to 28 ");
                        return;
                    }
                }
                
            }

            
        }
        else {
            alert('Month should be less than 12 !');
            return;
        }
    }
    console.log(date)
}
function leapyear(year)
{
    return (year % 100 === 0) ? (year % 400 === 0) : (year % 4 === 0);
}