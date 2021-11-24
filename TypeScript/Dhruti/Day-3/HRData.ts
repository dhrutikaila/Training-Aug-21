// import file
// compile file  tsc --module commonjs app.ts  
// node ./app.js  


export enum Departments {
    ".Net",
    "PHP",
    "C++",
    "C#"
}

export enum Designation {
    "Trainee",
    "Jr.Developer",
    "Sr.Developer"
}

class Applicant {
    applicantId: number
    applicantName: string
    Email: string
    BirthDate: Date
    qualification: string[]
    experience: string[]
    jobId: number

    constructor(applicantId: number, applicantName: string, Email: string, BirthDate: Date, qualification: string[], experience: string[], jobId: number) {
        this.applicantId = applicantId
        this.applicantName = applicantName
        this.Email = Email
        this.BirthDate = BirthDate
        this.qualification = qualification
        this.experience = experience
        this.jobId = jobId
    }
}

class Vacancy {
    jobId: number
    department: number
    designation: number
    lastDateToApply: Date
    avilableOpenings: number
    description: string

    constructor(jobId: number, department: number, designation: number, avilableOpenings: number, lastDateToApply: Date, description: string) {
        this.jobId = jobId
        this.department = department
        this.designation = designation
        this.avilableOpenings = avilableOpenings
        this.lastDateToApply = lastDateToApply
        this.description = description
    }
}

class Interview {
    interviewId: number
    jobId: number
    interviewer: string[]
    interviewDate: Date

    constructor(interviewId: number, jobId: number, interviewer: string[], interviewDate: Date) {
        this.interviewId = interviewId
        this.jobId = jobId
        this.interviewer = interviewer
        this.interviewDate = interviewDate
    }
}

class InterviewResult {
    resultId: number
    interviewId: number
    shortlistedApplicants: number[]

    constructor(resultId: number, interviewId: number, shortlistedApplicants: number[]) {
        this.resultId = resultId
        this.interviewId = interviewId
        this.shortlistedApplicants = shortlistedApplicants
    }
}

var vacancyarr: Vacancy[] = []
var interviews: Interview[] = []
var applicants: Applicant[] = []
var interviewResult: InterviewResult[] = []
var hiredApplicants: number[] = []

export function AddVacancy(jobId: number, department: Departments, designation: Designation, avilableOpenings: number, lastDateToApply: Date, description: string): void {
    if (department in Departments && designation in Designation) {
        vacancyarr.push(new Vacancy(jobId, department, designation, avilableOpenings, lastDateToApply, description))
    }
    else {
        console.log("Department or Designation is wrong!")
    }
}

export function ScheduleInterview(interviewId: number, jobId: number, interviewer: string[], interviewDate: Date): void {
    for (var i of vacancyarr) {
        if (i.jobId == jobId) {
            interviews.push(new Interview(interviewId, jobId, interviewer, interviewDate))
            return
        }
    }
    console.log("No jobid found for which you are tying to schedule an interview!")
}

export function StoreApplicant(applicantId: number, applicantName: string, Email: string, BirthDate: Date, qualification: string[], experience: string[], jobId: number): void {
    for (var i of vacancyarr) {
        if (i.jobId == jobId) {
            applicants.push(new Applicant(applicantId, applicantName, Email, BirthDate, qualification, experience, jobId))
            return
        }
    }
    console.log("No jobid found for which you are tying to apply!")
}

export function AddInterviewResult(resultId: number, interviewId: number, shortlistedApplicants: number[]): void {
    var verifyApplicants: boolean = false
    for (var i of interviews) {
        if (i.interviewId == interviewId) {
            for (var j of shortlistedApplicants) {
                for (var k of applicants) {
                    if (k.applicantId == j) {
                        verifyApplicants = true
                        break
                    }
                    verifyApplicants = false
                }
            }
            if (verifyApplicants == true) {
                interviewResult.push(new InterviewResult(resultId, interviewId, shortlistedApplicants))
            }
            else {
                console.log("Something wrong in shortlisted applicants!")
            }
            return
        }
    }
    console.log("No interviewid found for which you are tying to add result!")
}

export function HireApplicants(): void {
    for (var i of interviewResult) {
        for (var j of i.shortlistedApplicants) {
            hiredApplicants.push(j)
        }
        for (var k of interviews) {
            if (k.interviewId == i.interviewId) {
                for (var m of vacancyarr) {
                    if (k.jobId == m.jobId) {
                        m.avilableOpenings -= i.shortlistedApplicants.length
                    }
                }
            }
        }
    }
}

export function GetVacancyDetails(): void {
    vacancyarr.forEach(i => {
        console.log(`JobId : ${i.jobId}, Department : ${i.department}, Designation : ${i.designation}, Openings : ${i.avilableOpenings}, LastDate : ${i.lastDateToApply},
        Description : ${i.description}`)
    });
}

export function GetInterviewDetails(): void {
    interviews.forEach(i => {
        console.log(`InterviewId : ${i.interviewId}, Interview Date : ${i.interviewDate}, JobId : ${i.jobId}, Interviewers : ${i.interviewer}`)
    });
}

export function GetApplicantsList(): void {
    var today: Date = new Date()
    applicants.forEach(i => {
        console.log(`ApplicantId : ${i.applicantId}, Name : ${i.applicantName}, Email : ${i.Email}, Age : ${today.getFullYear() - i.BirthDate.getFullYear()}, Qualification : ${i.qualification}, Experience : ${i.experience}, JobId : ${i.jobId}`)
    });
}

export function GetInterviewResult(): void {
    interviewResult.forEach(i => {
        console.log(`ResultId : ${i.resultId}, InterviewId : ${i.interviewId}, Shortlisted Applicants : ${i.shortlistedApplicants}`)
    });
}

export function GetHiredApplicantsList(): void {
    console.log("Hired Applicants : ")
    hiredApplicants.forEach(i => {
        console.log(i)
    });
}

export function GetReport(): void {
    GetVacancyDetails()
    GetInterviewDetails()
    GetApplicantsList()
    GetInterviewResult()
    GetHiredApplicantsList()
}