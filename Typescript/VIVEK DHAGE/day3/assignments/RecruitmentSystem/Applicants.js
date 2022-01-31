"use strict";
exports.__esModule = true;
exports.Applicant = void 0;
var Applicant = /** @class */ (function () {
    function Applicant(name, phone, study) {
        this.ApplicantName = name;
        this.ApplicantPhone = phone;
        this.ApplicantStudyStatus = study;
    }
    Applicant.prototype.dispApplicant = function () {
        console.log("applicant name: " + this.ApplicantName + ", Employee number: " + this.ApplicantPhone);
    };
    return Applicant;
}());
exports.Applicant = Applicant;
