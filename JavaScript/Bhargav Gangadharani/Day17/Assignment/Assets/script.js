function success(element){
    element.classList.remove("is-invalid");
    element.classList.add("is-valid");
}
function failure(element){
    element.classList.remove("is-valid");
    element.classList.add("is-invalid");
}    

function checkId(id){
    if(!id.value.match(/[A-Z0-9]{5}/g)){
        id.style.color = "red";
        failure(id);
        return false;
    }else{
        id.style.color = "green";
        success(id);
        return true;
    }
}

function checkEmail(email){
    if(!email.value.match(/^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$/g)){
        email.style.color = "red";
        failure(email);
        return false;
    }else{
        email.style.color = "green";
        success(email);
        return true;
    }
}

function checkName(name){
    var arr = name.value.split(" ");
    if(arr.length < 2){
        name.style.color = "red";
        failure(name);
        return false;
    }
    else{
        name.style.color = "green";
        success(name);
        return true;
    }
}

function checkAge(age){
    if(age.value<18){
        age.style.color = "red";
        failure(age);
        return false;
    }
    else if(isNaN(age.value)){
        age.style.color = "red";
        failure(age);
        return false;
    }
    else{
        age.style.color = "green";
        success(age);
        return true;
    }
}

function regEmployee(){
    var empID = document.forms[0].empID
    var empName = document.forms[0].empName
    var empEmail = document.forms[0].empEmail
    var empPhone = document.forms[0].empPhone
    var empAge = document.forms[0].empAge
    var empLocation = document.forms[0].empLocation
    var empDesignation = document.forms[0].empDesignation
    var empSalary = document.forms[0].salary
    var empDoj = document.forms[0].doj
    var empGenderMale = document.forms[0].male
    var empGenderFemale = document.forms[0].female
    
    
    if(empID.value == ""){
        empID.style.color = "red";
        failure(empID);
        return false;
    }
        else{
            success(empID);
        }

    if(empName.value == ""){
        empName.style.color = "red";
        failure(empName);
        return false;
    }
        else{
            empName.style.color = "green";
            success(empName);
        }

    if(empEmail.value == ""){
        empEmail.style.color = "red";
        failure(empEmail);
        return false;
    }
        else{
            empEmail.style.color = "green";
            success(empEmail);
        }

    if(empPhone.value == ""){
        empPhone.style.color = "red";
        failure(empPhone);
        return false;
    }
        else{
            empPhone.style.color = "green";
            success(empPhone);
        }

    if(empAge.value == ""){
        empAge.style.color = "red";
        failure(empAge);
        return false;
    }
        else{
            empAge.style.color = "green";
            success(empAge);
        }

    if(empLocation.value == ""){
        empLocation.style.color = "red";
        failure(empLocation);
        return false;
    }
        else{
            empLocation.style.color = "green";
            success(empLocation);
        }

    if(empDesignation.value == ""){
        empDesignation.style.color = "red";
        failure(empDesignation);
        return false;
    }
        else{
            empDesignation.style.color = "green";
            success(empDesignation);
        }

    if(empSalary.value == ""){
        empSalary.style.color = "red";
        failure(empSalary);
        return false;
    }
        else{
            empSalary.style.color = "green";
            success(empSalary);
        }

    if(empDoj.value == ""){
        empDoj.style.color = "red";
        failure(empDoj);
        return false;
    }
        else{
            empDoj.style.color = "green";
            success(empDoj);
        }

    if(empGenderMale.checked == false && empGenderFemale.checked == false){
        failure(empGenderMale);
        failure(empGenderFemale);
        return false;
    }
        else{
            success(empGenderMale);
            success(empGenderFemale);
        }

    if(empGenderMale.checked == true){
        var empGender = "Male" ; 
    }
    if(empGenderFemale.checked == true){
        var empGender = "Female" ; 
    }

    newWin = window.open('','NewWin', 'toolbar=no,status=no,width=300,height=200')
    var formdata = "EmployeeID: " + empID.value + "<br> EmployeeName: " +empName.value + "<br> Email: " + empEmail.value + 
    "<br> Phone: " + empPhone.value + "<br> Age: " + empAge.value + "<br> Gender: " + empGender  + "<br> Location: " + empLocation.value +
     "<br> Designation: " + empDesignation.value + "<br> Date of Joining: " + empDoj.value + "<br> Salary: " + empSalary.value ; 
     console.log(formdata)
    newWin.document.write(formdata);

}