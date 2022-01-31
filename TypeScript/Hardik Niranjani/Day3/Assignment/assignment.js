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
Add_Vacancy("React js", 2, 40000, 5);
Add_Vacancy("Node js", 3, 46000, 6);
Add_Vacancy("Machine Learning", 3, 80000, 7);
Add_Vacancy("Python", 1, 25000, 2);
Add_Vacancy("Java", 8, 250000, 1);
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
Add_Applicant("Hardik", 9898656320, "hardik@gmail.com", 5, "Python");
Add_Applicant("Kohli", 9898652323, "kohli@gmail.com", 6, "Python");
Add_Applicant("Dhoni", 9898643534, "dhoni@gmail.com", 10, "Java");
Add_Applicant("Rohit", 7776556320, "rohit@gmail.com", 1, "Node js");
Add_Applicant("Rahul", 7656756320, "rahul@gmail.com", 5, "R");
Add_Applicant("Yuvraj", 7878656320, "yuvraj@gmail.com", 5, "Machine Learning");
// show applicant data
Show_Applicant();
var newData = [];
// const newData: Array<any> = [];
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
function selected_Applicant() {
    console.log("Total no of Applicants: ".concat(newData.length, " and data \n"));
    console.log(newData);
}
selected_Applicant();
