"use strict";
// greeting = "Hello TypeScript";
// console.log(greeting); //Prints Hello World!
exports.__esModule = true;
// import * as Emp from "./Employee"
// console.log(Emp.age); // 20
// let empObj = new Emp.Employee("Bill Gates" , 2);
// empObj.displayEmployee(); 
var Employee_1 = require("./Employee");
var obj = new Employee_1.Employee("Deep", 7044);
obj.displayEmployee();
// /// <reference path = "Employee.ts" />  
// let TotalFee = studentCalc.AnualFeeCalc(1500, 4);  
// console.log("Output: " +TotalFee);  
function displayType(id, name) {
    console.log(typeof (id) + ", " + typeof (name));
}
displayType(1, "Steve");
var KeyValuePair = /** @class */ (function () {
    function KeyValuePair() {
    }
    KeyValuePair.prototype.setKeyValue = function (key, val) {
        this.key = key;
        this.val = val;
    };
    KeyValuePair.prototype.display = function () {
        console.log("Key = ".concat(this.key, ", val = ").concat(this.val));
    };
    return KeyValuePair;
}());
var kvp1 = new KeyValuePair();
kvp1.setKeyValue(1, "Steve");
kvp1.display(); //Output: Key = 1, Val = Steve 
