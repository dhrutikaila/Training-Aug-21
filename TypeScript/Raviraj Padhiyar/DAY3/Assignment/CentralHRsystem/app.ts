import {
    IVaccancies,
    IRecruiter,
    IApplicant,
    IInterview,
    Status,
    IHire,
    IEmployee
} from './interfaces/interfaces';

import {
    vaccancies,
    recruiter,
    Applicant,
    Interview,
    Employee,
    Hire
} from "./classes/classes";

//recruiter

function createRecruiter(firstName: string, lastName: string): recruiter {
    let newRecruiter = new recruiter(firstName, lastName);
    console.log(`recruiter ${newRecruiter.firstName} ${newRecruiter.lastName} is been looking for talent `);
    return newRecruiter;

}


let dotenetRecruiter = createRecruiter("Ronak","Patel");

//open a vaccancy

function createNewVaccancy(jobTitle:string,post_strength:number,post_recruiter:recruiter) : vaccancies {
    let newVaccancy = new vaccancies(jobTitle,post_strength,post_recruiter);
    console.log(`on ${newVaccancy.Data_Posted.toString() } there is new position opening of ${newVaccancy.Job_Title} of total hiring of ${newVaccancy.post_strength} people under the management of ${newVaccancy.recruiter.firstName} contact for more details`);
    return newVaccancy

}

let dotenetVaccancy = createNewVaccancy("software engineer", 5, dotenetRecruiter);

// applicant data

function applyforVaccancy(firstName:string,lastName:string,contactNumber:string | number,email : string,address:string,resumeLink:string,appliedFor:IVaccancies) : Applicant {
    let newApplicant = new Applicant(firstName,lastName,contactNumber,email,address,resumeLink,appliedFor);

    console.log(`mr. ${newApplicant.firstName} has succesfully applied for ${newApplicant.applied_for.Job_Title} on ${newApplicant.applied_on.toString() }`)

    return newApplicant;
}

let maheshTheApplicant = applyforVaccancy("Mahesh","Parmar","9925299252","mahes@mahes.com","ranip,ahmedabad","www.mahesh.com/resume",dotenetVaccancy);

//Interview process initiation,

function intiateInterview(applicant:Applicant) : Interview {
    let newInterview = new Interview(applicant);

    console.log(`congrats ${newInterview.applicant.firstName} your interview process has been intiated`);

    return newInterview;
}

let interviewformahesh = intiateInterview(maheshTheApplicant);

//Scheduling Interviews

function InterviewSchedule(interview : Interview) : void {
    interview.scheduleInterview();

    console.log(`congrats ${interview.applicant.firstName} your interview process has schedule on date ${interview.schedule_Date}`);
}

InterviewSchedule(interviewformahesh);

//Storing Interview results

function concludeInterview(interview: Interview) : void {
    interview.concludeInterview();
    if(interview.status == Status.qualified) {
        console.log(`congrats ${interview.applicant.firstName} you  are qualified for the psot stay tuned for further information we will call you `);
    }
    else {
        console.log(`sorry ${interview.applicant.firstName} you are not qualified for the post better luck next time`);
    }
}

concludeInterview(interviewformahesh);

//Hiring of the applicant

if(interviewformahesh.status == Status.qualified) {
    let newHire = new Hire(maheshTheApplicant);

    console.log(`congrats new employee your employee Id Is ${newHire.employee.emp_Id} and salary is ${newHire.employee.salary}`);
}

