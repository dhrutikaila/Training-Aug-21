"use strict";
/*
This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company.
Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling
 Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. Reports may be required
to be generated for the use of HR group. */
exports.__esModule = true;
var Interview_1 = require("./Interview");
var Scheduling_1 = require("./Scheduling");
var vacancies_1 = require("./vacancies");
var Applicants_1 = require("./Applicants");
var obj1 = new Interview_1.Interview(9, "aakash");
obj1.dispInterview();
var obj2 = new Scheduling_1.schedule("9:00");
obj2.dispSchedule();
var obj3 = new vacancies_1.vacancy();
obj3.dispVacancy();
var obj4 = new Applicants_1.Applicant("pavan", 9383746585, "B.E.");
obj4.dispApplicant();
