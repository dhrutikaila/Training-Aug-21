const empName = document.getElementById("EmployeeName");

function chkName(value) {
    if (value.length >= 5) {
        empName.classList.add("is-valid");
        empName.classList.remove("is-invalid");

    }
}


const empId = document.getElementById("EmployeeID");
const empAge = document.getElementById("age");
const designation = document.getElementById("designation");
const empSalary = document.getElementById("salary");
const emplocation = document.getElementById("location");
const email = document.getElementById("email");
const DateofJoin = document.getElementById("dateOfJoin");
const contact = document.getElementById("contact");




const submit = document.getElementById("submit");

submit.addEventListener("click", () => {
    var empGender;
    var gender = document.getElementsByName("gender");
    for (ele of gender) {
        // console.log(ele.value);
        if (ele.checked) {
            empGender = ele;
        }
    }

    var tabledata = `
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,
         initial-scale=1.0">
        <title>table Data</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    </head>
    
    <body>
    <table class="table">
    <thead class="table-dark">
        <tr>
            <th> empId </th>
            <th> empName </th>
            <th> empAge </th>
            <th> gender </th>
            <th> designation </th>
            <th> empSalary </th>
            <th> location </th>
            <th> email </th>
            <th> DateofJoin </th>
            <th> contact </th>
        </tr>
    </thead>
    <tbody>
        <tr id="tbldata">
            <td>${empId.value}</td>
            <td>${empName.value}</td>
            <td>${empAge.value}</td>
            <td>${empGender.value}</td>
            <td>${designation.value}</td>
            <td>${empSalary.value}</td>
            <td>${emplocation.value}</td>
            <td>${email.value}</td>
            <td>${DateofJoin.value}</td>
            <td>${contact.value}</td>
        </tr>
    </tbody>
    <table>
    </body>
    
    </html>
`
    // console.log(tabledata);

    //open table window
    myWindow = window.open("http://localhost:5500/Assignment/tabledata.html", "width=700", "height=500");
    myWindow.document.write(tabledata);
})
