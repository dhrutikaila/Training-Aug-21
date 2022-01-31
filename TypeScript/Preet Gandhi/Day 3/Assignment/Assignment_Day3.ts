// This project is aimed at developing a web-based and central Recruitment Process System for the HR Group 
// for a company. Some features of this system will be creating vacancies, storing Applicants data, 
// Interview process initiation, Scheduling Interviews, Storing Interview results for the applicant and 
// finally Hiring of the applicant. Reports may be required to be generated for the use of HR group.


import { Vacancies, Applicants} from "./Assignment_Classes";

var vacancyData:Vacancies[] = [];

//Function to add vacancy
function addVacancy(technology: string, vacancies: number, experience: number){
    var vacancyDetails = new Vacancies(technology, vacancies, experience);
    vacancyData.push(vacancyDetails);
    // vacancyDetails.displayVacancies();
}

addVacancy("React", 5, 2);
addVacancy("Node", 7, 1);
addVacancy("Angular", 10, 0);

console.log("Vacancy Details:");
console.log(vacancyData);
console.log("----------------------");



var applicantData: Applicants[] = [] 

//function to add applicant
function addApplicants(name: string, contact: number, technology: string, experience: number, selected: boolean) {
    var applicantDetails = new Applicants(name, contact, technology, experience, selected);
    applicantData.push(applicantDetails);
}

addApplicants("Hiren", 12345, "React",3, false);
addApplicants("Jai", 67890, "Node",0, false);
addApplicants("Jeet", 46457, "Angular",2, false);

console.log("Applicants Details:");
console.log(applicantData);
console.log("----------------------");


//Selection Process
applicantData.forEach(applicant => {
    vacancyData.forEach(vacancy => {
        if(applicant.Appliedtechnology == vacancy.TechnologyName){
            if(applicant.Experince >= vacancy.ExperienceRequired){
                applicant.Selected = true;
            }
        }
    });
});

//function for selected applicants
function getSelectedApplicants(){
    return applicantData.filter((applicant) => {
        return applicant.Selected;
    })
}

//Returning Report
console.log("Selected Applicants");
console.log(getSelectedApplicants());




