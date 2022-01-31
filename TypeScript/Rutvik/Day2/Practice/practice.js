//Class
var Employee = /** @class */ (function () {
    function Employee(Id, Name) {
        this.EmployeeID = Id;
        this.EmployeeName = Name;
    }
    Employee.prototype.getSalary = function () {
        return 25000;
    };
    return Employee;
}());
var empObj = new Employee(1, "Rutvik Kalasha");
console.log(empObj.getSalary());
//Function
function add(a, b) {
    return a + b;
}
//anonymous function
var total = function (a, b) {
    return a + b;
};
console.log(total(1, 20));
//Enum
var Status;
(function (Status) {
    Status[Status["success"] = 0] = "success";
    Status[Status["fail"] = 1] = "fail";
})(Status || (Status = {}));
var s;
var statusVal = Status.success;
console.log(statusVal);
var Employees = /** @class */ (function () {
    function Employees() {
    }
    Employees.prototype.GetEmployeeFullName = function (firstName, lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
        return firstName + " " + lastName;
    };
    return Employees;
}());
var empObject = new Employees();
console.log(empObject.GetEmployeeFullName("Nayan", "Kalasha"));
function addKeyValue(key, value) {
    return console.log("Key : " + key + " Value : " + value);
}
var kvp = addKeyValue;
kvp(1, "Rutvik");
var EmployeeObj = {
    Name: "Rutvik",
    Age: 20,
    empId: 1
};
//Tuples
var a;
a = [1, "Rutvik"];
console.log(a);
var employee;
employee = [[1, "Nayan"], [2, "Ankit"], [3, "Darshan"]];
console.log(employee[0]);
//Union
var unionVar;
unionVar = 12;
console.log(unionVar);
unionVar = "Tarak";
console.log(unionVar);
unionVar = true;
console.log(unionVar);
