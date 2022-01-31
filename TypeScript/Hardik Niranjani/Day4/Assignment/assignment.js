// Store 5 Employee Data(ID,Name,City,DOJ) in one Array. Search the employee with ID.
// Search the employees who has joined after year 2020
// Search the employee who has joined after year 2020 and stays in Mumbai city
var Employee = /** @class */ (function () {
    function Employee(id, name, city, doj) {
        this.Id = id;
        this.Name = name;
        this.City = city;
        this.DOJ = doj;
    }
    return Employee;
}());
var employee_Data = [];
function addEmployee(empId, empName, empCity, empDOJ) {
    employee_Data.push({ Id: empId, Name: empName, City: empCity, DOJ: empDOJ });
}
function showEmployee() {
    console.log(employee_Data);
}
addEmployee(1, "virat", "Mumbai", new Date("05/16/2020"));
addEmployee(2, "kohli", "Mumbai", new Date("04/17/2021"));
addEmployee(3, "Dhoni", "Delhi", new Date("10/25/2018"));
addEmployee(4, "Rahul", "Mumbai", new Date("12/18/2021"));
addEmployee(5, "Pandya", "Gujarat", new Date("03/19/2021"));
console.log("*************************************************");
console.log("Employee Data");
showEmployee();
// Search the employee with ID.
function SearchEmployeeID(empId) {
    employee_Data.filter(function (e) {
        if (e.Id == empId) {
            console.log("\n Employee Id:- ".concat(e.Id, " ,\n Employee Name:- ").concat(e.Name, ",\n Employee City:- ").concat(e.City, ", \n Employee Joining Date:- ").concat(e.DOJ));
        }
    });
}
console.log("*************************************************");
console.log("Employee whose Id is 2");
SearchEmployeeID(2);
// Search the employees who has joined after year 2020
function SearchEmployeeByYear() {
    employee_Data.filter(function (e) {
        if (e.DOJ.getFullYear() > 2020) {
            console.log("\n Employee Id:- ".concat(e.Id, " ,\n Employee Name:- ").concat(e.Name, ",\n Employee City:- ").concat(e.City, ", \n Employee Joining Date:- ").concat(e.DOJ));
        }
    });
}
console.log("*************************************************");
console.log("Employee who joined after 2020");
SearchEmployeeByYear();
// Search the employee who has joined after year 2020 and stays in Mumbai city
function SearchEmployeeByYearAndCity() {
    employee_Data.filter(function (e) {
        if ((e.DOJ.getFullYear() > 2020) && (e.City == "Mumbai")) {
            console.log("\n Employee Id:- ".concat(e.Id, " ,\n Employee Name:- ").concat(e.Name, ",\n Employee City:- ").concat(e.City, ", \n Employee Joining Date:- ").concat(e.DOJ));
        }
    });
}
console.log("*************************************************");
console.log("Employee who joined after 2020 and stay in Mumbai");
SearchEmployeeByYearAndCity();
