"use strict";
//This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. 
//Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, 
//Storing Interview results for the applicant and finally Hiring of the applicant.
// Reports may be required to be generated for the use of HR group.

exports.__esModule = true;
var interviewModule = require("./HRData");
console.log("\nRecruitment Portal - Radixweb Company");
console.log("\n1.Add vacancy\n2.Store Appliant\n3.Schedule Interview\n4.Add Interview Result\n5.Hire Applicants");
console.log("6.Get vacancy details\n7.Get applicants list\n8.Get interview details\n9.Get interview result");
console.log("10.Get hired applicants list\n11.Get report");
var choice = 1;
var jobId = 0;
var interviewId = 0;
switch (choice) {
    case 1:
        jobId = 1;
        var department = interviewModule.Departments["C++"];
        var designation = interviewModule.Designation.Trainee;
        var lastDateToApply = new Date("2021-12-20");
        var avilableOpenings = 15;
        var description = "30/B Adarsh Society, Near Kaashi Parekh Complex, Swastik Cross Road, C G Road, Ahmedabad, Gujarat 380009 , Contact : 027-222-333, Email : abc.recruitment@gmail.com";
        interviewModule.AddVacancy(jobId, department, designation, avilableOpenings, lastDateToApply, description);
        break;
    case 2:
        var applicantId = 1;
        var applicantName = "dhruti patel";
        var Email = "dhruti@gmail.com";
        var BirthDate = new Date("2000-2-11");
        var qualification = ["B.Tech Computer Science", "M.Tech Information Security"];
        var experience = [];
        jobId = 1;
        interviewModule.StoreApplicant(applicantId, applicantName, Email, BirthDate, qualification, experience, jobId);
        break;
    case 3:
        interviewId = 1;
        jobId = 1;
        var interviewer = ["sneha sharma", "meet patel"];
        var interviewDate = new Date("2021-11-18");
        interviewModule.ScheduleInterview(interviewId, jobId, interviewer, interviewDate);
        break;
    case 4:
        interviewId = 1;
        var resultId = 1;
        var shortlistedApplicants = [1, 2, 3];
        interviewModule.AddInterviewResult(resultId, interviewId, shortlistedApplicants);
        break;
    case 5:
        interviewModule.HireApplicants();
        break;
    case 6:
        interviewModule.GetVacancyDetails();
        break;
    case 7:
        interviewModule.GetApplicantsList();
        break;
    case 8:
        interviewModule.GetInterviewDetails();
        break;
    case 9:
        interviewModule.GetInterviewResult();
        break;
    case 10:
        interviewModule.GetHiredApplicantsList();
        break;
    case 11:
        interviewModule.GetReport();
        break;
    default:
        console.log("Invalid choice!!");
        break;
}
