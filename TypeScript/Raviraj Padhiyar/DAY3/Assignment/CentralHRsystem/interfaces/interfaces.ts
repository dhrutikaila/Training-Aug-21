//create vaccancies

interface IVaccancies {
    Id:number;
    Job_Title:string;
    post_strength:number;
    recruiter: IRecruiter;
    Data_Posted: Date;
    Status : Status; // open close
}

interface IRecruiter {
    Id:number;
    firstName:string;
    lastName:string;
}

//storing application data

interface IApplicant {
    Id:number;
    firstName:string;
    lastName:string;
    contact_no:number | string;
    email:string;
    address:string;
    resume_link:string;
    applied_on:Date;
    applied_for:IVaccancies;
}

//Interview Process

interface IInterview {
    Id:number;
    applicant:IApplicant;
    status:Status; // new,inprogress,completed
}

interface IInterviewSchedule  extends IInterview {
    schedule_date : Date;
}

//status interface

enum Status {
    open= 0,
    close,
    Initiated,
    inProgress,
    completed,
    qualified,
    onHold,
    disqualified
}

//storing Interview results

interface IInterviewResult extends IInterview {
    resultStatus : Status; // qualified, on-hold, disqualified
}

//Hiring of the Applicant

interface IHire {
    applicant:IApplicant;
    employee:IEmployee;
}

//employee interface

interface IEmployee {
    emp_Id:number;
    firstName:string;
    lastName:string;
    contact_number:number | string;
    emial:string;
    address:string;
    salary:number;
    Hire_Date:Date;
}

export { IVaccancies, IRecruiter, IApplicant , IInterview , IInterviewSchedule, IInterviewResult , Status, IHire , IEmployee};