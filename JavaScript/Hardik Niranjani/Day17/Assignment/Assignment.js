function submit_data(){
    var EmpId = document.getElementById("empId").value;
    var EmpName = document.getElementById("name").value;
    var Age = document.getElementById("age").value;
    var Description = document.getElementById("designation").value;
    var Salary = document.getElementById("salary").value;
    var Email = document.getElementById("email").value;
    var Date = document.getElementById("date").value;
    var PhoneNumber = document.getElementById("phoneNumber").value;
    var Location = document.getElementById("location").value;

    
    var genderData = document.getElementsByClassName("radio");

    for(let i = 0; i < genderData.length; i++) { 
        if(genderData[i].checked){
            var gender=genderData[i].value;
        }
    }


    var newWindow = window.open();

    var EmployeeData =
    "EmployeeID: " +
    EmpId +"<br>"+

    "EmployeeName: " +
    EmpName +"<br>"+

    "Age: " +
    Age +"<br>"+

    "Gender: " +
    gender +"<br>"+

    "Designation: " +
    Description +"<br>"+

    "Salary: " +
    Salary +"<br>" +

    "Email: " +
    Email +"<br>"+

    "Date of Joining: " +
    Date +"<br>" +

    "<br> Phone: " +
    PhoneNumber +"<br>"+

    "Location: " +
    Location +"<br>";

    newWindow.document.write(EmployeeData);
}