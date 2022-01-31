"use strict";
// This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. Reports may be required to be generated for the use of HR group.
exports.__esModule = true;
var WebAssign_1 = require("./WebAssign");
// Creating object of vacancies
var v = new WebAssign_1.vacancies();
v.AddVacancy("Memer", "Digital Marketing", "5 year", 48600, 64800, "RadixWeb: Ahmedabad", "0-1 Year", "Social Media");
v.AddVacancy("Content Writer", "Digital Marketing", "0-5 Years", 15000, 25000, "RadixWeb: Ahmedabad", "1", "Writer");
v.ShowVacancy(); // Displaying all the vacancies
var WebAssign_2 = require("./WebAssign");
var a = new WebAssign_2.Applicants();
a.addApplicants("Shubh", "Memer", "Memer");
a.addApplicants("Leo", "Content Writer", "Content Writer");
a.addApplicants("Cristiano", "Content Writer", "Content Writer");
a.ShowApplicants(); // Applicants list
var WebAssign_3 = require("./WebAssign");
var i = new WebAssign_3.Interview();
i.StartInterview(["Shubh", "Patel"]);
i.EndInterview(["Shubh", "Patel"]);
i.ClearApplicant(["Shubh", "Patel"]);
i.HireApplicant(["Shubh", "Patel"]);
i.StartInterview(["Leo", "Messi"]);
i.EndInterview(["Leo", "Messi"]);
i.ClearApplicant(["Leo", "Messi"]);
i.HireApplicant(["Leo", "Messi"]);
i.StartInterview(["Cristiano", "Ronaldo"]);
i.EndInterview(["Cristiano", "Ronaldo"]);
var WebAssign_4 = require("./WebAssign");
console.log("Details of all applicants:");
console.log(WebAssign_4.applicantData);
