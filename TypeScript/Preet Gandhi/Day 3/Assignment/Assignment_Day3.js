"use strict";
// namespace HR {
//     var vacancy: [number,string,number][];
//     vacancy = [[1,"React", 10],[2,"Node",15],[3,"Angular",20]];
exports.__esModule = true;
//     export function addVacancy(VacancyId: number, TechnologyName: string, TotalVacancies: number){
//         vacancy.push([VacancyId, TechnologyName, TotalVacancies]);
//         return vacancy;
//     }
//     // var ApplicantsData: (number | string)[];
//     // ApplicantsData = []
//     // interface IApplicantsData{
//     //     ApplicantName: string;
//     //     ApplicantContact: number;
//     //     ApplicantEmail: string;
//     // }
//     // var applicantsData: Array<IApplicantsData> = [{"Dilip",12345,"abc@gmail.com"}];
//     var applicantsData: [string,number,string][];
//     applicantsData = [["Hiren", 12345, "h@gmail.com"]];
//     export function addApplicants(ApplicantName: string, ApplicantContact: number, ApplicantEmail: string){
//         applicantsData.push([ApplicantName,ApplicantContact,ApplicantEmail]);
//         return applicantsData;
//     }
// }
var Assignment_Classes_1 = require("./Assignment_Classes");
var vacancyData = [];
//Function to add vacancy
function addVacancy(technology, vacancies, experience) {
    var vacancyDetails = new Assignment_Classes_1.Vacancies(technology, vacancies, experience);
    vacancyData.push(vacancyDetails);
    // vacancyDetails.displayVacancies();
}
addVacancy("React", 5, 2);
addVacancy("Node", 7, 1);
addVacancy("Angular", 10, 0);
console.log("Vacancy Details:");
console.log(vacancyData);
console.log("----------------------");
//function to add applicant
var applicantData = [];
function addApplicants(name, contact, technology, experience, selected) {
    var applicantDetails = new Assignment_Classes_1.Applicants(name, contact, technology, experience, selected);
    applicantData.push(applicantDetails);
}
addApplicants("Hiren", 12345, "React", 3, false);
addApplicants("Jai", 67890, "Node", 0, false);
addApplicants("Jeet", 46457, "Angular", 2, false);
console.log("Applicants Details:");
console.log(applicantData);
console.log("----------------------");
//Selection Process
applicantData.forEach(function (applicant) {
    vacancyData.forEach(function (vacancy) {
        if (applicant.Appliedtechnology == vacancy.TechnologyName) {
            if (applicant.Experince > vacancy.ExperienceRequired) {
                applicant.Selected = true;
            }
        }
    });
});
//function for selected applicants
function getSelectedApplicants() {
    return applicantData.filter(function (applicant) {
        return applicant.Selected;
    });
}
//Returning Report
console.log("Selected Applicants");
console.log(getSelectedApplicants());
