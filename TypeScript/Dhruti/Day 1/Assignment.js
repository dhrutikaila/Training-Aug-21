//Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). 
//Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the employee from the Array. 
//Create one more array emp and join the value with above array. When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.
//PF should be computed and total salary should be display.
var employees = [{ id: 1, firstName: 'dhruti', lastName: 'patel', address: 'ahemdabad', salary: 3000 },
    { id: 2, firstName: 'avni', lastName: 'patel', address: 'ahemdabad', salary: 3000 },
    { id: 3, firstName: 'khushi', lastName: 'kaila', address: 'ahemdabad', salary: 3000 },
    { id: 4, firstName: 'gopi', lastName: 'patel', address: 'ahemdabad', salary: 3000 },
    { id: 5, firstName: 'meena', lastName: 'patel', address: 'ahemdabad', salary: 3000 }
];
//Searching an employee
console.log("Search employee by Employee ID : 1");
var employee = employees.filter(function (e) { return e.ID == 1; });
console.log(employee);
//Inserting new employee
console.log("Inserting new employee");
employee.push({ ID: 6, FirstName: "neha", LastName: "patel", Address: "601, Mumbai, Maharashtra", Salary: 40000 });
//  console output
for (var _i = 0, employee_1 = employee; _i < employee_1.length; _i++) {
    var item = employee_1[_i];
    console.log(item);
}
//Deleting an Employee
console.log("Deleting the employee of index number 3");
var removed = employee.splice(3, 1);
console.log(removed);
for (var i in employee) {
    console.log(employee[i]);
}
// Concate another array of employee
var emp = [{ ID: 7, FirstName: "Janice", LastName: "Singh", Address: "701, Pune, Maharashtra", Salary: 50000 },
    { ID: 8, FirstName: "Jaqueline", LastName: "Chopra", Address: "1101, Thane, Maharashtra", Salary: 80000 }];
console.log("Inserting new employees");
employee = employee.concat(emp);
for (var _a = 0, employee_2 = employee; _a < employee_2.length; _a++) {
    var item = employee_2[_a];
    console.log(item);
}
console.log("Employee Record");
// When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited
for (var _b = 0, employee_3 = employee; _b < employee_3.length; _b++) {
    var item = employee_3[_b];
    var add = item.Address;
    //console.log(add);
    var address = add.split(',');
    var PF = Number(item.Salary) * 0.12;
    console.log("* ID: ".concat(item.ID, " -- EmployeeName: ").concat(item.FirstName, " ").concat(item.LastName));
    console.log("--> Address: FlatNumber: ".concat(address[0], " City:").concat(address[1], " State:").concat(address[2]));
    console.log("--> Salary: Basic Salary ".concat(item.Salary, " PF:").concat(PF));
    console.log("-----------------------------------------------------");
}
