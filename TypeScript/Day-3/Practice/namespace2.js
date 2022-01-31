//namespace example
var namespace1;
(function (namespace1) {
    function ToUpper(str) {
        return str.toUpperCase();
    }
    namespace1.ToUpper = ToUpper;
    function ToLower(str) {
        return str.toLowerCase();
    }
    namespace1.ToLower = ToLower;
    function AnnualCalc(fee, term) {
        return fee * term;
    }
    namespace1.AnnualCalc = AnnualCalc;
})(namespace1 || (namespace1 = {}));
/// <reference path="namespace1.ts" />
class employee {
    /**
     *
     */
    constructor(name, id) {
        this.empId = id;
        this.empName = namespace1.ToUpper(name);
    }
    displayEmployee() {
        console.log(`Id is ${this.empId} name is ${this.empName}`);
    }
}
let emp = new employee("Shreya", 2);
let TotalFees = namespace1.AnnualCalc(1500, 3);
console.log(TotalFees);
emp.displayEmployee();
