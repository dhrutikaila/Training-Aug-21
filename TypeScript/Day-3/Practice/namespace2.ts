//add namespace heree
/// <reference path="namespace1.ts" /> 
class employee {
    empId : number;
    empName : string;
    constructor(name : string, id : number) {
        this.empId = id;
        //for accessing namespace use . 
        this.empName = namespace1.ToUpper(name);
    }
    displayEmployee() {
        console.log(`Id is ${this.empId} name is ${this.empName}`)
    }
}
let emp = new employee("Shreya", 2)
let TotalFees = namespace1.AnnualCalc(1500, 3);
console.log(TotalFees)
emp.displayEmployee();