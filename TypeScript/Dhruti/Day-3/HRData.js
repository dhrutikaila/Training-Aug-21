"use strict";
// import file
// compile file $ tsc --module commonjs app.ts  
//$ node ./app.js 
 
exports.__esModule = true;
exports.GetReport = exports.GetHiredApplicantsList = exports.GetInterviewResult = exports.GetApplicantsList = exports.GetInterviewDetails = exports.GetVacancyDetails = exports.HireApplicants = exports.AddInterviewResult = exports.StoreApplicant = exports.ScheduleInterview = exports.AddVacancy = exports.Designation = exports.Departments = void 0;
var Departments;
(function (Departments) {
    Departments[Departments[".Net"] = 0] = ".Net";
    Departments[Departments["PHP"] = 1] = "PHP";
    Departments[Departments["C++"] = 2] = "C++";
    Departments[Departments["C#"] = 3] = "C#";
})(Departments = exports.Departments || (exports.Departments = {}));
var Designation;
(function (Designation) {
    Designation[Designation["Trainee"] = 0] = "Trainee";
    Designation[Designation["Jr.Developer"] = 1] = "Jr.Developer";
    Designation[Designation["Sr.Developer"] = 2] = "Sr.Developer";
})(Designation = exports.Designation || (exports.Designation = {}));
var Applicant = /** @class */ (function () {
    function Applicant(applicantId, applicantName, Email, BirthDate, qualification, experience, jobId) {
        this.applicantId = applicantId;
        this.applicantName = applicantName;
        this.Email = Email;
        this.BirthDate = BirthDate;
        this.qualification = qualification;
        this.experience = experience;
        this.jobId = jobId;
    }
    return Applicant;
}());
var Vacancy = /** @class */ (function () {
    function Vacancy(jobId, department, designation, avilableOpenings, lastDateToApply, description) {
        this.jobId = jobId;
        this.department = department;
        this.designation = designation;
        this.avilableOpenings = avilableOpenings;
        this.lastDateToApply = lastDateToApply;
        this.description = description;
    }
    return Vacancy;
}());
var Interview = /** @class */ (function () {
    function Interview(interviewId, jobId, interviewer, interviewDate) {
        this.interviewId = interviewId;
        this.jobId = jobId;
        this.interviewer = interviewer;
        this.interviewDate = interviewDate;
    }
    return Interview;
}());
var InterviewResult = /** @class */ (function () {
    function InterviewResult(resultId, interviewId, shortlistedApplicants) {
        this.resultId = resultId;
        this.interviewId = interviewId;
        this.shortlistedApplicants = shortlistedApplicants;
    }
    return InterviewResult;
}());
var vacancyarr = [];
var interviews = [];
var applicants = [];
var interviewResult = [];
var hiredApplicants = [];
function AddVacancy(jobId, department, designation, avilableOpenings, lastDateToApply, description) {
    if (department in Departments && designation in Designation) {
        vacancyarr.push(new Vacancy(jobId, department, designation, avilableOpenings, lastDateToApply, description));
    }
    else {
        console.log("Department or Designation is wrong!");
    }
}
exports.AddVacancy = AddVacancy;
function ScheduleInterview(interviewId, jobId, interviewer, interviewDate) {
    for (var _i = 0, vacancyarr_1 = vacancyarr; _i < vacancyarr_1.length; _i++) {
        var i = vacancyarr_1[_i];
        if (i.jobId == jobId) {
            interviews.push(new Interview(interviewId, jobId, interviewer, interviewDate));
            return;
        }
    }
    console.log("No jobid  trying to schedule an interview!");
}
exports.ScheduleInterview = ScheduleInterview;
function StoreApplicant(applicantId, applicantName, Email, BirthDate, qualification, experience, jobId) {
    for (var _i = 0, vacancyarr_2 = vacancyarr; _i < vacancyarr_2.length; _i++) {
        var i = vacancyarr_2[_i];
        if (i.jobId == jobId) {
            applicants.push(new Applicant(applicantId, applicantName, Email, BirthDate, qualification, experience, jobId));
            return;
        }
    }
    console.log("No jobid found for which you are trying to apply!");
}
exports.StoreApplicant = StoreApplicant;
function AddInterviewResult(resultId, interviewId, shortlistedApplicants) {
    var verifyApplicants = false;
    for (var _i = 0, interviews_1 = interviews; _i < interviews_1.length; _i++) {
        var i = interviews_1[_i];
        if (i.interviewId == interviewId) {
            for (var _a = 0, shortlistedApplicants_1 = shortlistedApplicants; _a < shortlistedApplicants_1.length; _a++) {
                var j = shortlistedApplicants_1[_a];
                for (var _b = 0, applicants_1 = applicants; _b < applicants_1.length; _b++) {
                    var k = applicants_1[_b];
                    if (k.applicantId == j) {
                        verifyApplicants = true;
                        break;
                    }
                    verifyApplicants = false;
                }
            }
            if (verifyApplicants == true) {
                interviewResult.push(new InterviewResult(resultId, interviewId, shortlistedApplicants));
            }
            else {
                console.log("Something wrong in shortlisted applicants!");
            }
            return;
        }
    }
    console.log("No interviewid found for  add result!");
}
exports.AddInterviewResult = AddInterviewResult;
function HireApplicants() {
    for (var _i = 0, interviewResult_1 = interviewResult; _i < interviewResult_1.length; _i++) {
        var i = interviewResult_1[_i];
        for (var _a = 0, _b = i.shortlistedApplicants; _a < _b.length; _a++) {
            var j = _b[_a];
            hiredApplicants.push(j);
        }
        for (var _c = 0, interviews_2 = interviews; _c < interviews_2.length; _c++) {
            var k = interviews_2[_c];
            if (k.interviewId == i.interviewId) {
                for (var _d = 0, vacancyarr_3 = vacancyarr; _d < vacancyarr_3.length; _d++) {
                    var m = vacancyarr_3[_d];
                    if (k.jobId == m.jobId) {
                        m.avilableOpenings -= i.shortlistedApplicants.length;
                    }
                }
            }
        }
    }
}
exports.HireApplicants = HireApplicants;
function GetVacancyDetails() {
    vacancyarr.forEach(function (i) {
        console.log("JobId : ".concat(i.jobId, ", Department : ").concat(i.department, ", Designation : ").concat(i.designation, ", Openings : ").concat(i.avilableOpenings, ", LastDate : ").concat(i.lastDateToApply, ",\n        Description : ").concat(i.description));
    });
}
exports.GetVacancyDetails = GetVacancyDetails;
function GetInterviewDetails() {
    interviews.forEach(function (i) {
        console.log("InterviewId : ".concat(i.interviewId, ", Interview Date : ").concat(i.interviewDate, ", JobId : ").concat(i.jobId, ", Interviewers : ").concat(i.interviewer));
    });
}
exports.GetInterviewDetails = GetInterviewDetails;
function GetApplicantsList() {
    var today = new Date();
    applicants.forEach(function (i) {
        console.log("ApplicantId : ".concat(i.applicantId, ", Name : ").concat(i.applicantName, ", Email : ").concat(i.Email, ", Age : ").concat(today.getFullYear() - i.BirthDate.getFullYear(), ", Qualification : ").concat(i.qualification, ", Experience : ").concat(i.experience, ", JobId : ").concat(i.jobId));
    });
}
exports.GetApplicantsList = GetApplicantsList;
function GetInterviewResult() {
    interviewResult.forEach(function (i) {
        console.log("ResultId : ".concat(i.resultId, ", InterviewId : ").concat(i.interviewId, ", Shortlisted Applicants : ").concat(i.shortlistedApplicants));
    });
}
exports.GetInterviewResult = GetInterviewResult;
function GetHiredApplicantsList() {
    console.log("Hired Applicants : ");
    hiredApplicants.forEach(function (i) {
        console.log(i);
    });
}
exports.GetHiredApplicantsList = GetHiredApplicantsList;
function GetReport() {
    GetVacancyDetails();
    GetInterviewDetails();
    GetApplicantsList();
    GetInterviewResult();
    GetHiredApplicantsList();
}
exports.GetReport = GetReport;
