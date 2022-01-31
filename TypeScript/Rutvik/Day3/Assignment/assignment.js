"use strict";
// This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. 
// Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, 
// Scheduling Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. 
// Reports may be required to be generated for the use of HR group.
exports.__esModule = true;
// create empty Array
var vacancy_Data = [];
// add vacancy function
function Add_Vacancy(Tech, Exp, Sal, Total_Vac) {
    vacancy_Data.push({ Technology: Tech, Experience: Exp, Salary: Sal, Total_Vacancies: Total_Vac });
}
// show data 
function show_Vacancy() {
    console.log(vacancy_Data);
}
// create vacancy data
Add_Vacancy("Machine Learning", 2, 40000, 5);
Add_Vacancy("Java", 3, 46000, 6);
Add_Vacancy("Python", 3, 80000, 7);
Add_Vacancy("DotNat", 1, 25000, 2);
Add_Vacancy("Cloud", 8, 250000, 1);
// show vacancy data
show_Vacancy();
// create empty Array
var Applicant_Data = [];
// add applicant data function
function Add_Applicant(Name, PhoneNo, Email, Exp, Tech) {
    Applicant_Data.push({ Name: Name, PhoneNumber: PhoneNo, Email: Email, Experience: Exp, Technology: Tech });
}
// show data function
function Show_Applicant() {
    console.log(Applicant_Data);
}
// create applicant data
Add_Applicant("Rutvik", 9898656320, "rutvik1@gmail.com", 5, "Python");
Add_Applicant("Nayan", 9898652323, "nayan1@gmail.com", 6, "Python");
Add_Applicant("Darshan", 9898643534, "darshan1@gmail.com", 10, "Java");
Add_Applicant("Ankit", 7776556320, "ankit1@gmail.com", 1, "Node js");
Add_Applicant("Yash", 7656756320, "yash1@gmail.com", 5, "R");
Add_Applicant("Akash", 7878656320, "akash1@gmail.com", 5, "Machine Learning");
// show applicant data
Show_Applicant();
var newData = [];
function Add_Applicant1(Name, PhoneNo, Email, Exp, Tech) {
    newData.push({ Name: Name, PhoneNumber: PhoneNo, Email: Email, Experience: Exp, Technology: Tech });
}
// interview call for applicant data
Applicant_Data.forEach(function (a) {
    vacancy_Data.forEach(function (v) {
        if (a.Experience >= v.Experience) {
            if (a.Technology == v.Technology) {
                Add_Applicant1(a.Name, a.PhoneNumber, a.Email, a.Experience, a.Technology);
            }
        }
    });
});
// function for calling for interview 
function interviewCall() {
    console.log("Total no of Applicants: ".concat(newData.length, " and data \n"));
    console.log(newData);
}
interviewCall();
