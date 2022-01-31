"use strict";
exports.__esModule = true;
exports.vacancies = exports.Interview = exports.Applicants = exports.applicantData = void 0;
exports.applicantData = [];
var Applicants = /** @class */ (function () {
    function Applicants() {
    }
    Applicants.prototype.addApplicants = function (fname, role, intr) {
        try {
            exports.applicantData.push({ fullname: fname, role: role, interest: intr, applicationDate: new Date() });
            console.log("Dear ".concat(fname, " Your application for ").concat(role, " has been submmitted successfully, we will contact you after reviewing your application."));
        }
        catch (e) {
            console.error(e);
        }
    };
    Applicants.prototype.ShowApplicants = function () {
        console.log("Applicants list:");
        console.log(exports.applicantData);
    };
    return Applicants;
}());
exports.Applicants = Applicants;
// import { applicantData } from "./ApplicantData";
var Interview = /** @class */ (function () {
    function Interview() {
    }
    Interview.prototype.StartInterview = function (startedName) {
        startedName.forEach(function (element) {
            exports.applicantData.forEach(function (appl) {
                if (appl.fullname == element) {
                    appl.interViewDate = new Date();
                    appl.interViewStart = true;
                }
            });
        });
    };
    Interview.prototype.EndInterview = function (endName) {
        endName.forEach(function (element) {
            exports.applicantData.forEach(function (appl) {
                if (appl.fullname == element) {
                    appl.interViewEnd = true;
                }
            });
        });
    };
    Interview.prototype.HireApplicant = function (hireedName) {
        hireedName.forEach(function (element) {
            exports.applicantData.forEach(function (appl) {
                if (appl.fullname == element) {
                    appl.hired = true;
                    appl.joiningDate = new Date();
                }
            });
        });
    };
    Interview.prototype.ClearApplicant = function (clearedName) {
        clearedName.forEach(function (element) {
            exports.applicantData.forEach(function (appl) {
                if (appl.fullname == element) {
                    appl.cleared = true;
                }
            });
        });
    };
    return Interview;
}());
exports.Interview = Interview;
var vacancyData = [];
var vacancies = /** @class */ (function () {
    function vacancies() {
    }
    vacancies.prototype.AddVacancy = function (rol, dept, exp, minS, maxS, loc, join, tech) {
        try {
            vacancyData.push({ role: rol, department: dept, experience: exp, minSalary: minS, maxSalary: maxS, location: loc, joining: join, technology: tech });
            console.log("VacancyData Added\n");
        }
        catch (e) {
            console.error(e);
        }
    };
    vacancies.prototype.ShowVacancy = function () {
        vacancyData.forEach(function (vacant) {
            console.log("Hello there fresh minds! Are you looking for an opportunity to expand your knowledge and to work on project based on latest technologies?\n            \nWe are having an opening for\n            \nRole: ".concat(vacant.role, "\n            \nTechnology: ").concat(vacant.technology, "\n            \nDepartment: ").concat(vacant.department, "\n            \nExperience required: ").concat(vacant.experience, " years\n            \nSalary: ").concat(vacant.minSalary, "-").concat(vacant.maxSalary, "\n            \nCompany: ").concat(vacant.location, "\n            \nWe will be glad to work with you! All the best.\n"));
        });
    };
    return vacancies;
}());
exports.vacancies = vacancies;
