"use strict";
exports.__esModule = true;
exports.schedule = void 0;
var schedule = /** @class */ (function () {
    function schedule(time) {
        this.interview_time = time;
    }
    schedule.prototype.dispSchedule = function () {
        console.log("titming is : ".concat(this.interview_time));
    };
    return schedule;
}());
exports.schedule = schedule;
