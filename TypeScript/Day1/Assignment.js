// Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). 
// Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the employee from the Array.
// Create one more array emp and join the value with above array. When display list combine firstname and lastname as fullname, 
// From the address field flatnumber,city,state and should be splited.PF should be computed and total salary should be display.
//store 5 employees
var employees = [
    { "ID": 1, "FirstName": "Steve", "LastName": "Jobs", "Address": "Winsconsin", "Salary": 2000000 },
    { "ID": 2, "FirstName": "Anna", "LastName": "Maria", "Address": "Corfu", "Salary": 50000 },
    { "ID": 3, "FirstName": "Ben", "LastName": "Parker", "Address": "Athens", "Salary": 700000 },
    { "ID": 4, "FirstName": "James", "LastName": "Bond", "Address": "Westchester", "Salary": 9000000 },
    { "ID": 5, "FirstName": "Jerry", "LastName": "Yemen", "Address": "New Jersey", "Salary": 400000 }
];
//Searching by index number
console.log("Search By index number");
console.log(employees[2]);
//searching by employeeid
console.log("Search By Employee ID");
var item1 = employees.filter(function (i) { return i.ID === 2; });
console.log(item1);
//Insert Employee
console.log("Insert Employee");
employees.push({ "ID": 6, "FirstName": "Raj", "LastName": "Thakkar", "Address": "Ahmedabad", "Salary": 8000 });
console.log(employees);
//Delete Employee
console.log("Delete Employee");
employees.pop();
console.log(employees);
//Create array and join with first one
console.log("Join Array");
var emp1 = [
    { "ID": 6, "FirstName": "Raj", "LastName": "Thakkar", "Address": "Ahmedabad", "Salary": 8000 },
    { "ID": 7, "FirstName": "Jerry", "LastName": "Parker", "Address": "New york", "Salary": 8000 }
];
var result = employees.concat(emp1);
console.log(result);
//Display fullname
console.log("Display modified array");
var display1 = [];
for (var _i = 0, employees_1 = employees; _i < employees_1.length; _i++) {
    var values = employees_1[_i];
    var ID = values.ID;
    var FullName = values.FirstName + " " + values.LastName;
    var Address = values.Address.split(",");
    var Salary = values.Salary;
    var PF = values.Salary * 0.12;
    display1.push({ "ID": ID, "FullName": FullName, "Address": Address, "Salary": Salary, "PF": PF });
}
console.log(display1);
