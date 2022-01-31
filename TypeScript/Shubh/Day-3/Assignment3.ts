// This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. Reports may be required to be generated for the use of HR group.

import {vacancies} from './WebAssign';
// Creating object of vacancies
var v = new vacancies();
v.AddVacancy("Memer","Digital Marketing","5 year",48600,64800,"RadixWeb: Ahmedabad","0-1 Year","Social Media");
v.AddVacancy("Content Writer","Digital Marketing","0-5 Years",15000,25000,"RadixWeb: Ahmedabad","1","Writer")
v.ShowVacancy(); // Displaying all the vacancies

import { Applicants } from './WebAssign';
var a = new Applicants();
a.addApplicants("Shubh","Memer","Memer");
a.addApplicants("Leo","Content Writer","Content Writer");
a.addApplicants("Cristiano","Content Writer","Content Writer")
a.ShowApplicants(); // Applicants list

import { applicantData } from './WebAssign';
console.log("Details of all applicants:");
console.log(applicantData); // Applicant Data

// Interview process
import { Interview } from './WebAssign';
var i = new Interview();
i.StartInterview(["Shubh","Patel"]);
i.EndInterview(["Shubh","Patel"]);
i.ClearApplicant(["Shubh","Patel"]);
i.HireApplicant(["Shubh", "Patel"]);

i.StartInterview(["Leo","Messi"]);
i.EndInterview(["Leo","Messi"]);
i.ClearApplicant(["Leo","Messi"]);
i.HireApplicant(["Leo", "Messi"]);

i.StartInterview(["Cristiano","Ronaldo"]);
i.EndInterview(["Cristiano","Ronaldo"]);


