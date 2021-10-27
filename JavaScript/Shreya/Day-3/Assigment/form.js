function myFunc() {
    var empId = document.getElementById('eid').value;
    var empName = document.getElementById('ename').value;
    var empAge = document.getElementById('eage').value;
    var empGender1 = document.getElementById('male').value;
    var empGender2 = document.getElementById('female').value;
    var empEmail = document.getElementById('empEmail').value;
    var empSalary = document.getElementById('esalary').value;
    var empContactno = document.getElementById('eContactno').value;
    var empDOJ = document.getElementById('edoj').value;
    var empLocation = document.getElementById('elocation').value;
    var empDesignation = document.getElementById('edesignation').value;

    //required validation for all field

    if (empId == "") {
        alert('Please enter employee id');
        return;
    }
    var idpat = /(\d{5})/g;
    if (empId.match(idpat) == null) {
        alert('Please enter 5 digit for emp id ');
        return;
    }

    if (empName == "") {
        alert('Please enter employee name');
        return;
    }
    //name should be in character only 
    var namepat = '.*[a-zA-Z]+.*';
    if (empName.match(namepat) == null) {
        alert('Please enter only character');
        return;
    }

    if (empAge == "") {
        alert('Please enter employee age');
        return;
    }
    //for age should be in number format
    var agepat = '^[0-9]+$';
    if (empAge.match(agepat) == null) {
        alert('Please enter only number');
        return;
    }

    if (empEmail == "") {
        alert('Please enter employee email');
        return;
    }
    //for email format
    var emailPattern = '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$';
    if (empEmail.match(emailPattern) == null) {
        alert('Email must be in proper format');
        return;
    }
    if (empSalary == "") {
        alert('Please enter employee salary');
        return;
    }
    if (empContactno == "") {
        alert('Please enter employee contactno');
        return;
    }
    if (empDOJ == "") {
        alert('Please enter employee\'s joining date ');
        return;
    }
    //for date fomat 
    //var datepat = '/^([0][0-9]|11|12)\-([0-2][0-9]|30|31)\-(19|20)\d{2}$/g';
    // if (empDOJ.match(datepat) == null) {
    //     alert("Date must be in proper format")
    // }
    if (empLocation == "0") {
        alert('Please Select location ');
        return;
    }
    if (empDesignation == "") {
        alert('Please enter designation');
        return;
    }

}

function displayData() {
    var empId = window.opener.document.getElementById('eid').value;
    var empName = window.opener.document.getElementById('ename').value;
    var empAge = window.opener.document.getElementById('eage').value;
    //var empGender =window.opener.document.querySelector('input[name="gender"]:checked').value;
    var empEmail = window.opener.document.getElementById('empEmail').value;
    var empSalary = window.opener.document.getElementById('esalary').value;
    var empContactno = window.opener.document.getElementById('eContactno').value;
    var empDOJ = window.opener.document.getElementById('edoj').value;
    var empLocation = window.opener.document.getElementById('elocation').value;
    var empDesignation = window.opener.document.getElementById('edesignation').value;

    document.getElementById('eid').innerHTML = "Id is "+empId;
    document.getElementById('ename').innerHTML = "Name is "+empName;
    document.getElementById('eage').innerHTML = "Age is "+empAge;
  //  document.getElementById('empGender').innerHTML = "Id is "+;
    document.getElementById('eEmail').innerHTML = "Email is "+empEmail;
    document.getElementById('esalary').innerHTML = "Salary is "+empSalary;
    document.getElementById('eContactno').innerHTML = "Contact Number is "+empContactno;
    document.getElementById('edoj').innerHTML = "Date of Joining is "+empDOJ;
    document.getElementById('elocaton').innerHTML = "Location is "+empLocation;
    document.getElementById('edesignation').innerHTML = "Designation is "+empDesignation;
    
}