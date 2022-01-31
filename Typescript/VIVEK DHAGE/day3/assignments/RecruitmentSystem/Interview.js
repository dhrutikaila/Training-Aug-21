"use strict";
exports.__esModule = true;
exports.Interview = void 0;
var Interview = /** @class */ (function () {
    function Interview(rate, name) {
        this.PerformanceRate = rate;
        this.Interviewer = name;
    }
    Interview.prototype.dispInterview = function () {
        console.log("performance: " + this.PerformanceRate + ", interviewer " + this.Interviewer);
    };
    return Interview;
}());
exports.Interview = Interview;
