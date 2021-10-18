//Check Employee Id
function checkid( id)
{
    var pattern = /^E\-\d{3,}/g;
    var id = document.getElementById("id").value;
    if(pattern.test(id) == false)
    {
            alert("Invalid Employee Id!");
    }
    else
    {
        id = id.split("-");
        var id1 = parseInt(id[1]);
        if(id1 < 001)
        {
            alert("Invalid Employee Id!");
        }
    }
}

//Check age
function checkage(age)
{
    var age = document.getElementById("age").value;
    if(isNaN(age) == true)
    {
        alert("Age should be a number!");
    }
}

//Check email
function checkemail(email)
{
    var email = document.getElementById("email").value;
    var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/g;
    email = email.toLowerCase();
    if(pattern.test(email) == false)
    {
        alert("Invalid email id!");
    }             

}

//Check Date
function checkdate(date)
{
    var date = document.getElementById("joiningdate").value;
    var pattern = /^(0?[1-9]|[12][0-9]|3[01])\-(0?[1-9]|1[012])\-\d{4}$/;
            
            if(pattern.test(date) == false)
            {
                alert("Invalid Date");
            }
            else
            {
                var date = date.split("-");
                var dd = parseInt(date[0]);
                var mm = parseInt(date[1]);
                var yyyy = parseInt(date[2]);
                
                //Check month & day & year
                if (mm < 1 || mm > 12 || yyyy <= 0000 || yyyy >= 9999)
                {
                    alert("Invalid Date!");
                }
                else if (mm == 2)
                {
                    //Check leap year
                    if (((yyyy%4 != 0 && yyyy%100 == 0) || (yyyy%400 != 0)) && (dd < 1 || dd > 29))
                    {
                        alert("Invalid Date!");
                    }
                }
                //Month having 30 days
                else if ((mm == 4 || mm == 6 || mm == 9 || mm == 11) && (dd < 1 && dd > 30))
                {
                    alert("Invalid Date");
                }
                //Month having 31 days
                else if ((mm == 1 || mm == 3 || mm == 5 || mm == 7 || mm == 8 || mm == 10 || mm == 12)  && (dd < 1 && dd > 31))
                {
                    alert("Invalid Date");
                } 
            }
}

// Check if any field is empty
function isempty()
{
    var id = document.getElementById("id").value;
    var name = document.getElementById("name").value;
    var age = document.getElementById("age").value;
    var designation = document.getElementById("designation").value;
    var salary = document.getElementById("salary").value;
    var email = document.getElementById("email").value;
    var joiningdate = document.getElementById("joiningdate").value;
    var contact = document.getElementById("contact").value;
    if( id == "")
    {
        alert("Id should not be empty!");
    }
    else if( name == "")
    {
        alert("Name should not be empty!");
    }
    else if( age == "")
    {
        alert("Age should not be empty!");
    }
    else if( designation == "")
    {
        alert("Designation should not be empty!");
    }
    else if( salary == "")
    {
        alert("Salary should not be empty!");
    }
    else if( email == "")
    {
        alert("Email should not be empty!");
    }
    else if( joiningdate == "")
    {
        alert("Date of Joining should not be empty!");
    }
    else if( contact == "")
    {
        alert("Contact Number should not be empty!");
    }
    else
    {
        window.open("http://127.0.0.1:5500/Day3/Assignment/formvalues.html");
    }
}

//Display form data in new page
function display()
{
    //Store form data from previous page
    var id = window.opener.document.getElementById("id").value;
    var name = window.opener.document.getElementById("name").value;
    var age = window.opener.document.getElementById("age").value;
    var gender = window.opener.document.querySelector('input[name="gender"]:checked').value;
    var designation = window.opener.document.getElementById("designation").value;
    var salary = window.opener.document.getElementById("salary").value;
    var location = window.opener.document.getElementById("location").value;
    var email = window.opener.document.getElementById("email").value;
    var joiningdate = window.opener.document.getElementById("joiningdate").value;
    var contact = window.opener.document.getElementById("contact").value;

    document.getElementById("id").innerHTML = "Employee id : "+id;
    document.getElementById("name").innerHTML = "Name : "+name;
    document.getElementById("age").innerHTML = "Age : "+age;
    document.getElementById("gender").innerHTML = "Gender : "+gender;
    document.getElementById("designation").innerHTML = "Designation : "+designation;
    document.getElementById("salary").innerHTML = "Salary : "+salary;
    document.getElementById("location").innerHTML = "Location : "+location;
    document.getElementById("email").innerHTML = "Email : "+email;
    document.getElementById("joiningdate").innerHTML = "Date of Joining : "+joiningdate;
    document.getElementById("contact").innerHTML = "Contact Number : "+contact;
}

