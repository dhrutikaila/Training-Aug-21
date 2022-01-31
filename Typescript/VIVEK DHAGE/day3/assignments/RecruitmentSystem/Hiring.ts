/*
This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company.
Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling
 Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. Reports may be required
to be generated for the use of HR group. */


import { Interview } from "./Interview";
import { schedule } from './Scheduling';
import { vacancy } from './vacancies';
import { Applicant } from './Applicants';



let obj1 = new Interview<number,string>(9, "aakash");
obj1.dispInterview(); 

let obj2 = new schedule<string>("9:00");
obj2.dispSchedule(); 


let obj3 = new vacancy();
obj3.dispVacancy(); 

let obj4 = new Applicant<string,number,string>("pavan",9383746585,"B.E.");
obj4.dispApplicant();


