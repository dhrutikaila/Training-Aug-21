/*Store 5 Employee Data(ID,Name,City,DOJ) in one Array. Search the employee with ID.
Search the employees who has joined after year 2020
Search the employee who has joined after year 2020 and stays in Mumbai city*/
let Employee = [
    { "EmployeeId": 1, "EmployeeName": "Shreya", "City": "AHmedabad", "DateOfjoining": new Date("2018-01-18") },
    { "EmployeeId": 2, "EmployeeName": "Diya", "City": "Mumbai", "DateOfjoining": new Date("2017-01-18") },
    { "EmployeeId": 3, "EmployeeName": "Dharal", "City": "Rajkot", "DateOfjoining": new Date("2021-01-18") },
    { "EmployeeId": 4, "EmployeeName": "Bhavya", "City": "Vadodara", "DateOfjoining": new Date("2020-01-18") },
    { "EmployeeId": 5, "EmployeeName": "Riya", "City": "Mumbai", "DateOfjoining": new Date("2021-01-18") }
];
console.log("-------Searching element by using id------");
var emp_id = Employee.filter(function (find) {
    return find.EmployeeId == 1;
});
for (var i of emp_id) {
    console.log(i);
}
console.log("-------Employees whose joining date is after 2020------");
var emp = Employee.filter(function (find) {
    return find.DateOfjoining.getFullYear() > 2020;
});
for (var i of emp) {
    console.log(i);
}
console.log("-------Employees whose joining date is after 2020 and live in Mumbai------");
var emp1 = Employee.filter(function (find) {
    return find.DateOfjoining.getFullYear() > 2020 && find.City == "Mumbai";
});
for (var i of emp1) {
    console.log(i);
}
