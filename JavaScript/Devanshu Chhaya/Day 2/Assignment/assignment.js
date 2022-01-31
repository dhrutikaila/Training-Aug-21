function out(date){
    var dateformat=/\d{2}\-\d{2}\-\d{4}$/;
    
    var month= /^(0[1-9]|1[0-2])$/
    var mon=date.substr(0,2)
 
    var dayofmonth=date.substr(3,2)
    var year=date.substr(6,4)
  
    
    function validate_date(mon,year){
        if (mon == 01 || mon == 03 || mon == 05 || mon == 07 || mon == 08 || mon == 10 || mon == 12)
        {
            return 31;              
        }
        else if (mon == 04 || mon == 06 || mon == 09 || mon == 11)
        {
            return 30;        
        }
        else
        {    
            if ((year % 4 == 0) || (year % 400 == 0 && year % 100 != 0))
            {    
                return 29;          
            }
            else 
            {
                return 28;              
            }
        }    
    }

    
    if(!dateformat.test(date)){
        document.getElementById("res").innerHTML="Please enter a valid date as per the mentioned format"    
    }

    else if(!month.test(mon)||mon==00)
    {
        document.getElementById("res").innerHTML="Please enter valid month"
    }

    else if(dayofmonth>validate_date(mon,year))
    {
        document.getElementById("res").innerHTML="Please enter a valid date"
    }
    
}
