function checkDeatil(Emp_Id, Emp_Name, Emp_Age, Emp_Designation, Emp_Salary, Emp_Gmail, Emp_Date, Emp_PhoneNo) {
    console.log("Hii")
    var age = parseInt(Emp_Age);
    var regid = /[A-z0-9]{5,}/g.test(Emp_Id);
    //Check id length is at least 5
    if (!(/[A-z0-9]{5,}/g.test(Emp_Id))) {
        alert("Please Entered Valid Employee Id");
        return;
    }
    //check age must be proper number
    if (age < 1 || age > 150) {
        alert("Please Entered Valid Age Of Employee");
        return;
    }

    // Here Check Emp_PhoneNo is lenght is 10
    if (Emp_PhoneNo.lenght > 10 || Emp_PhoneNo.lenght < 1) {
        alert("Please Entered Valid Phone number");
        return;
    }

    //check DEsignation not a number
    if (!isNaN(Emp_Designation)) {
        alert("Please Entered Valid Designation");
        return;
    }

    var Emp_Location = document.getElementById("EmpLocation").value;

    //check the which check box user can select
    if (document.getElementById("Male").checked) {
        var Emp_Gender = "Male";
    }
    if (document.getElementById("Female").checked) {
        var Emp_Gender = "Female";
    }
    if (document.getElementById("Other").checked) {
        var Emp_Gender = "Female";
    }

    //we Display Result in another window
    var newWindow = window.open();
    newWindow.document.write('<h2 style="color:cadetblue;">Employee Details is :</h2>' +
        "<b>Employee ID : </b>" + Emp_Id +
        "<br><b>Employee Name : </b>" + Emp_Name +
        "<br><b>Employee Age : </b>" + Emp_Age +
        "<br><b>Employee Gender : </b>" + Emp_Gender +
        "<br><b>Employee Designation : </b>" + Emp_Designation +
        "<br><b>Employee Salary : </b>" + Emp_Salary +
        "<br><b>Employee Location : </b>" + Emp_Location +
        "<br><b>Employee Gmail_Id :</b>" + Emp_Gmail +
        "<br><b>Employee Date Of Joining :</b>" + Emp_Date +
        "<br><b>Employee PhoneNo :</b>" + Emp_PhoneNo);
}