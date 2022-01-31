"use strict";
// /// <reference path = "./Assignment_Day3.ts" />
// let addVac = HR.addVacancy(4,"Java",5);
// console.log(addVac);
exports.__esModule = true;
exports.Applicants = exports.Vacancies = void 0;
// let addApp = HR.addApplicants("Hiren",1234567,"abc@gmail.com");
// console.log(addApp);
var Vacancies = /** @class */ (function () {
    function Vacancies(technology, vacancies, experience) {
        this.TechnologyName = technology;
        this.TotalVacancies = vacancies;
        this.ExperienceRequired = experience;
    }
    return Vacancies;
}());
exports.Vacancies = Vacancies;
var Applicants = /** @class */ (function () {
    function Applicants(name, contact, technology, experience, selected) {
        this.ApplicantName = name;
        this.ContactNo = contact;
        this.Appliedtechnology = technology;
        this.Experince = experience;
        this.Selected = selected;
    }
    return Applicants;
}());
exports.Applicants = Applicants;
