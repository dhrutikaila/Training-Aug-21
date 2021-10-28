function namecheck(Name) {
  // for name
  var element = document.getElementById("EmployeeName");
  var patt = /[A-Za-z]{5,}/g;
  if (patt.test(Name) == 1) {
    element.classList.add("is-valid");
    element.classList.remove("is-invalid");
    return true;
  } else {
    element.classList.remove("is-VALID");
    element.classList.add("is-invalid");
    return false;
  }
}

// for age
function agecheck(age) {
  var element1 = document.getElementById("age");
  if (isNaN(age)) {
    element1.classList.remove("is-valid");
    element1.classList.add("is-invalid");
    return false;
  } else {
    element1.classList.remove("is-invalid");
    element1.classList.add("is-valid");
    return true;
  }
}

// for Email_ID
function Emailcheck(Email_ID) {
  var EmailID = Email_ID;
  var epatt= /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
  var elemente = document.getElementById("Email_ID");
  if (epatt.test(EmailID) == 1) {
    elemente.classList.add("is-valid");
    elemente.classList.remove("is-invalid");
    return true;
  } else {
    elemente.classList.remove("is-valid");
    elemente.classList.add("is-invalid");
    return false;
  }
}

//null check
function isnull(DATA) {
  var val = document.getElementById(DATA).value;
  var element1 = document.getElementById(DATA);
  if (val.length == 0) {
    element1.classList.remove("is-valid");
    element1.classList.add("is-invalid");
    return false;
  } else {
    element1.classList.remove("is-invalid");
    element1.classList.add("is-valid");
    return true;
  }
}





function onsub(event) {
  var id = document.getElementById("EmployeeID").value;
  var Name = document.getElementById("EmployeeName").value;
  var age = parseInt(document.getElementById("age").value);
  var Gender = document.querySelector('input[name="Gender"]:checked').value;
  var Designation = document.getElementById("Designation").value;
  var salary = document.getElementById("salary").value;
  var location = document.getElementById("location").value;
  var Email_ID = document.getElementById("Email_ID").value;
  var Date_of_Joining = document.getElementById("Date_of_Joining").value;
  var Contact_Number = document.getElementById("Contact_Number").value;

  if (isnull("EmployeeID") && namecheck(Name) && agecheck(age) && isnull("EmployeeName") && isnull("age") && isnull("Designation") && isnull("salary") && isnull("location") && isnull("Email_ID") && Emailcheck(Email_ID) &&  isnull("Date_of_Joining") && ("Contact_Number")) 
  {
    var myWindow = window.open("");
    myWindow.document.write(
      "<div  style='border: 3px solid blue;padding:20px;'><h1 style='text-align: center;'>Employee form Deatils</h1><h3>EmployeeID :-   " +
        id +
        "</h3><br><h3>EmployeeName :-   " +
        Name +
        "</h3><br><h3>age :-   " +
        age +
        "</h3><br><h3>Gender :-   " +
        Gender +
        "</h3><br><h3>Designation :-   " +
        Designation +
        "</h3><br><h3>Salary :-   " +
        salary +
        "</h3><br><h3>location :-   " +
        location +
        "</h3><br><h3>Email ID :-   " +
        Email_ID +
        "</h3><br><h3>Date of Joining :-   " +
        Date_of_Joining +
        "</h3><br><h3>Contact_Number :-   " +
        Contact_Number +
        "</h3><br></div>"
    );
  }
}
