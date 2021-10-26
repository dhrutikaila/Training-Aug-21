/* This project is aimed at developing a web-based and central Recruitment Process System for the H Group 
for a company. Some features of this system will be creating vacancies, storing Applicants data, 
Interview process initiation, Scheduling Interviews, Storing Interview results for the applicant and 
finally Hiring of the applicant. Reports may be required to be generated for the use of HR group. */

class vacancies{
    constructor(numOfVacancy,jobID,position,Exp,Salary){
        this.numOfVacancy = numOfVacancy;
        this.jobID = jobID;
        this.position = position;
        this.Exp = Exp;
        this.Salary = Salary;
    }

    getDetail(){
        console.log(`Number of vacancy: ${this.numOfVacancy}, JobID: ${this.jobID}, Position: ${this.position}, Experience Require: ${this.Exp}, Salary: ${this.Salary}`)
    }
}

var vacancy1 = new vacancies(4,1,'ReactJS developer',2,50000)
var vacancy2 = new vacancies(2,2,' Senior ReactJS developer',3,60000)
var vacancy3 = new vacancies(3,3,'.net developer',2,40000)
var vacancy4 = new vacancies(5,4,'NodeJS developer',1,40000)
var vacancy5 = new vacancies(1,5,'Android developer',2,50000)


// vacancy1.getDetail();
// vacancy2.getDetail();

class Applicants{
    constructor(id,name,email,phone,exp,jobid,ExpCTC){
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.exp = exp
        this.jobid = jobid;
        this.ExpCTC = ExpCTC;
    }

    getDetail(){
        console.log(`id: ${this.id}, Name: ${this.name}, Email: ${this.email}, Phone: ${this.phone}, Experience: ${this.exp}, JobID: ${this.jobid}, Expected CTC: ${this.ExpCTC}`)
    }
}

var applicant1 = new Applicants(1,"a1","a1@gmail.com",9898767654,3,2,60000)
var applicant2 = new Applicants(2,"a2","a2@gmail.com",9898767754,2,1,55000)
var applicant3 = new Applicants(3,"a3","a3@gmail.com",9898767854,1,3,40000)
var applicant4 = new Applicants(4,"a4","a4@gmail.com",9898767954,4,2,70000)
var applicant5 = new Applicants(5,"a5","a5@gmail.com",9898767694,2,4,40000)
var applicant6 = new Applicants(6,"a6","a6@gmail.com",9898767650,1,5,55000)

// applicant1.getDetail();
// applicant2.getDetail();

var vacanciesArr = [vacancy1,vacancy2,vacancy3,vacancy4,vacancy5];
var applicantsArr = [applicant1,applicant2,applicant3,applicant4,applicant5,applicant6];
var interviewOfApplicants = [];
var rejectedApplicants = [];
var selectedApplicants = [];

for(let ap of applicantsArr){
    if(ap.exp < vacanciesArr[ap.jobid - 1].Exp){
        rejectedApplicants.push(ap);
    }else{
        interviewOfApplicants.push(ap);
    }
}

// console.log("Applicants call for interview" , interviewOfApplicants);

for(let i of interviewOfApplicants){
    if(i.ExpCTC > vacanciesArr[i.jobid - 1].Salary){
        rejectedApplicants.push(i);
    }else{
        selectedApplicants.push(i);
    }
}

// console.log("Rejected Applicants" , rejectedApplicants);
// console.log("Selected Applicants", selectedApplicants);

console.log("\n-------------------Selected Applicants-------------------------");
for(let y of selectedApplicants){
    console.log(`\nApplicant ID     :  ${y.id}`)
    console.log(`Applicant Name   :  ${y.name}`)
    console.log(`Applicant Email  :  ${y.email}`)
    console.log(`Applicant Phone  :  ${y.phone}`)
    console.log(`Applicant JobID  :  ${y.jobid}`)
    console.log('\n---------------------------------------------------------------')
}