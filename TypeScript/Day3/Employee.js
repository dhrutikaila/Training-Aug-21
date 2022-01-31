"use strict";
// var greeting : string = "Hello World!";
exports.__esModule = true;
exports.Employee = exports.age = void 0;
exports.age = 20;
var Employee = /** @class */ (function () {
    function Employee(name, code) {
        this.empName = name;
        this.empCode = code;
    }
    Employee.prototype.displayEmployee = function () {
        console.log("Employee Code: " + this.empCode + ", Employee Name: " + this.empName);
    };
    return Employee;
}());
exports.Employee = Employee;
var companyName = "XYZ";
// var employeeSalary:number=30000;
// namespace studentCalc{  
// export function AnualFeeCalc(feeAmount: number, term: number){  
// return feeAmount * term;  
// }  
// }
