"use strict";
exports.__esModule = true;
//Import
var PracticeExercise_1 = require("./PracticeExercise");
//Generic class
var student3 = new PracticeExercise_1.StudentInfo();
student3.setValue(3, "Hitesh");
student3.display();
console.log("-------------------------------------------");
//Generic class Implements generic Interface
var KvProcessor = /** @class */ (function () {
    function KvProcessor() {
    }
    KvProcessor.prototype.process = function (key, val) {
        console.log("Key: ".concat(key, ", Value: ").concat(val));
    };
    return KvProcessor;
}());
var proc = new KvProcessor();
proc.process(1, "Generic");
//NAMESPACE
var TotalFee = PracticeExercise_1.studentCalc.AnnualFeeCalc(1000, 4);
console.log(TotalFee);
