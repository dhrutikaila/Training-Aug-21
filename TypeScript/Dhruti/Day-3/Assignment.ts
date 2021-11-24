//This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. 
//Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, 
//Storing Interview results for the applicant and finally Hiring of the applicant.
// Reports may be required to be generated for the use of HR group.

import * as interviewModule from "./HRData";

console.log("\nRecruitment Portal - Radixweb Company")
console.log("\n1.Add vacancy\n2.Store Appliant\n3.Schedule Interview\n4.Add Interview Result\n5.Hire Applicants")
console.log("6.Get vacancy details\n7.Get applicants list\n8.Get interview details\n9.Get interview result")
console.log("10.Get hired applicants list\n11.Get report")

var choice: number = 1
var jobId: number = 0
var interviewId: number = 0

switch (choice) {
    case 1:
        jobId = 1
        var department: interviewModule.Departments = interviewModule.Departments["C++"]
        var designation: interviewModule.Designation = interviewModule.Designation.Trainee
        var lastDateToApply: Date = new Date("2021-12-20")
        var avilableOpenings: number = 15
        var description: string = "15,V.J.Road,Near SBI Bank,Ahmedabad,Gujarat, Contact : 027-222-333, Email : abc.recruitment@gmail.com"
        interviewModule.AddVacancy(jobId, department, designation, avilableOpenings, lastDateToApply, description)
        break
    case 2:
        var applicantId: number = 1
        var applicantName: string = "Avinash Yadav"
        var Email: string = "avinash@gmail.com"
        var BirthDate: Date = new Date("2000-2-10")
        var qualification: string[] = ["B.Tech Computer Science", "M.Tech Information Security"]
        var experience: string[] = []
        jobId = 1
        interviewModule.StoreApplicant(applicantId, applicantName, Email, BirthDate, qualification, experience, jobId)
        break
    case 3:
        interviewId = 1
        jobId = 1
        var interviewer: string[] = ["Sarad Maheta", "Vishal Shah"]
        var interviewDate: Date = new Date("2021-12-25")
        interviewModule.ScheduleInterview(interviewId, jobId, interviewer, interviewDate)
        break
    case 4:
        interviewId = 1
        var resultId: number = 1
        var shortlistedApplicants: number[] = [1, 2, 3]
        interviewModule.AddInterviewResult(resultId, interviewId, shortlistedApplicants)
        break
    case 5:
        interviewModule.HireApplicants()
        break
    case 6:
        interviewModule.GetVacancyDetails()
        break
    case 7:
        interviewModule.GetApplicantsList()
        break
    case 8:
        interviewModule.GetInterviewDetails()
        break
    case 9:
        interviewModule.GetInterviewResult()
        break
    case 10:
        interviewModule.GetHiredApplicantsList()
        break
    case 11:
        interviewModule.GetReport()
        break
    default:
        console.log("Invalid choice!!")
        break
}

