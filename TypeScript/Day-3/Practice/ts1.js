"use strict";
exports.__esModule = true;
exports.Employee = exports.age = void 0;
//module 
exports.age = 20;
var Employee = /** @class */ (function () {
    function Employee(name, id) {
        this.empName = name;
        this.empID = id;
    }
    Employee.prototype.displayEmployee = function () {
        console.log("Employee Code: " + this.empID + ", Employee Name: " + this.empName);
    };
    return Employee;
}());
exports.Employee = Employee;
var companyName = "RadixWeb";
