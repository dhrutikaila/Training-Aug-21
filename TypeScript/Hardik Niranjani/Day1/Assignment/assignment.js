//  Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). Do the operation searching by indexnumber, 
// EmployeeID, Insert the employee, delete the employee from the Array.Create one more array emp and join the value with 
// above array. When display list combine firstname and lastname as fullname, From the address field flatnumber,city,
// state and should be splited.PF should be computed and total salary should be
function GetAllEmployess() {
    var employee = [
        { "ID": 1, "FirstName": "Hardik", "LastName": "Pandya", "Address": "403,Ahemedabd,Gujarat", "Salary": 25000 },
        { "ID": 2, "FirstName": "Virat", "LastName": "Kohli", "Address": "301,Mumbai,Maharastra", "Salary": 40000 },
        { "ID": 3, "FirstName": "Sachine", "LastName": "Tendulkar", "Address": "503,Mumbai,Maharastra", "Salary": 73000 },
        { "ID": 4, "FirstName": "Rahul", "LastName": "Dravid", "Address": "101,Mumbai,Maharastra", "Salary": 50000 },
        { "ID": 5, "FirstName": "Mahendra Singh", "LastName": "Dhoni", "Address": "234,Mumbai,Maharastra", "Salary": 56000 }
    ];
    return employee;
}

// search indexnumber,EmployeeID
var allEmployees = GetAllEmployess();
console.log(allEmployees[4].ID);


// Insert employee
var addEmployee = GetAllEmployess();
addEmployee.push({ "ID": 6, "FirstName": "Hardik", "LastName": "Niranjani", "Address": "Address_6", "Salary": 66000 });
console.log(addEmployee);


// delete employee
var deleteEmployee = GetAllEmployess();
deleteEmployee.pop();
console.log(deleteEmployee);


// join 
var employeeData = GetAllEmployess();
var newArray = [];
for (var _i = 0, employeeData_1 = employeeData; _i < employeeData_1.length; _i++) {
    var employee = employeeData_1[_i];
    var Id = employee.ID;
    var FullName = employee.FirstName + " " + employee.LastName;
    var Address = employee.Address.split(",");
    var Total_Salary = employee.Salary - employee.Salary * 0.14;
    newArray.push({ "ID": Id, "FullName": FullName, "Address_1": Address, "Salary": Total_Salary });
}
console.log(newArray);
