"use strict";
exports.__esModule = true;
exports.studentCalc = exports.StudentInfo = void 0;
//GENERIC
//Generic function
function display(arg) {
    return arg;
}
var output1 = display("Welcome");
var output2 = display(50);
var output3 = display(true);
console.log("".concat(output1, ", ").concat(output2, ", ").concat(output3));
console.log("-------------------------------------------");
//Generic class
var StudentInfo = /** @class */ (function () {
    function StudentInfo() {
    }
    StudentInfo.prototype.setValue = function (id, name) {
        this.Id = id;
        this.Name = name;
    };
    StudentInfo.prototype.display = function () {
        console.log("Id= ".concat(this.Id, " and Name= ").concat(this.Name));
    };
    return StudentInfo;
}());
exports.StudentInfo = StudentInfo;
var student = new StudentInfo();
student.setValue(1, "Hiren");
student.display();
var student2 = new StudentInfo();
student2.setValue("Two", "Jeet");
student2.display();
console.log("-------------------------------------------");
var Kv1 = { key: 1, value: "One" };
var Kv2 = { key: "Two", value: "Two" };
console.log("-------------------------------------------");
function studentData(id, value) {
    console.log("Id: ".concat(id, ", Value: ").concat(value));
}
var std = studentData;
std(15, "Hiren Panchal");
console.log("-------------------------------------------");
//Array using generic
function getArray(items) {
    return new Array().concat(items);
}
var myStrArr = getArray(["Hiii", "Hello"]);
// myStrArr.push(5); //Error due to string data type
myStrArr.push("Hey");
console.log(myStrArr);
var myNumArr = getArray([5, 7]);
// myNumArr.push("Hey"); //Error due to number data type
myNumArr.push(10);
console.log(myNumArr);
console.log("+++++++++++++++++++++++++++++++++");
;
//NAMESPACES
var studentCalc;
(function (studentCalc) {
    function AnnualFeeCalc(feeAmount, term) {
        return feeAmount * term;
    }
    studentCalc.AnnualFeeCalc = AnnualFeeCalc;
})(studentCalc || (studentCalc = {}));
exports.studentCalc = studentCalc;
