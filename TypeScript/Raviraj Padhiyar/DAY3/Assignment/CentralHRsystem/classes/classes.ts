import  { IVaccancies, IRecruiter, IApplicant , IInterview , Status , IHire , IEmployee } from '../interfaces/interfaces';

class vaccancies implements IVaccancies {
    static lastkey :number = 0;
    Id: number;
    Job_Title: string;
    post_strength: number;
    recruiter: IRecruiter;
    Data_Posted: Date;
    Status: Status;

    constructor(JobTitle:string, post_availabe:number, recruiter: IRecruiter ) {
        //assign and increment Id;
        this.Id = vaccancies.lastkey++;

        this.Job_Title = JobTitle;
        this.post_strength = this.post_strength;
        this.recruiter = recruiter;
        this.Data_Posted = new Date();

        this.Status = Status.open;
    }


}

class recruiter implements IRecruiter {
    private static laskkey:number = 0;
    Id: number;
    firstName: string;
    lastName: string;

    constructor(firstName : string,lastName : string){
        this.Id = recruiter.laskkey++;
        this.firstName = firstName;
        this.lastName = lastName;
    }
}

class Applicant implements IApplicant {
    private static lastkey:number = 0;
    Id: number;
    firstName: string;
    lastName: string;
    contact_no: string | number;
    email: string;
    address: string;
    resume_link: string;
    applied_on: Date;
    applied_for: IVaccancies;

    constructor (firstName:string,lastName:string,contactNumber:string | number,email : string,address:string,resumeLink:string,appliedFor:IVaccancies) {
        this.Id = Applicant.lastkey++;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contact_no = contactNumber;
        this.email = email;
        this.address = address;
        this.resume_link = resumeLink;
        this.applied_on = new Date();
        this.applied_for = appliedFor;
    }
}


class Interview implements IInterview {
    private static lastkey:number = 0;
    Id: number;
    applicant: IApplicant;
    status: Status;

    schedule_Date ?: Date;

    constructor(applicant: Applicant) {
        this.Id = Interview.lastkey++;

        this.applicant = applicant;

        this.status = Status.Initiated;
    }

    scheduleInterview() {
        this.schedule_Date = new Date( new Date().setDate(15) );
        this.status = Status.inProgress;
    }

    concludeInterview() {
        let a = Math.random() * 10;

        if(a < 5) {
            this.status = Status.qualified;
        }
        else {
            this.status = Status.disqualified;
        }
    }

}

// class InterviewSchedule extends Interview {
//     schedule_date : Date;

//     constructor(interview: Interview) {
//         super();
//     }
// }


// class InterviewResult extends Interview {
//     result:Status
// }    

class Employee implements IEmployee {
    private static lastKey :number = 0;
    salary: number;
    Hire_Date: Date;
    emp_Id: number;
    firstName: string;
    lastName: string;
    contact_number: string | number;
    emial: string;
    address: string;

    constructor(applicant:Applicant){
        this.emp_Id = Employee.lastKey++;
        this.firstName = applicant.firstName;
        this.lastName = applicant.lastName;
        this.contact_number = applicant.contact_no;
        this.emial = applicant.email;
        this.address = applicant.address;

        this.salary = 25000;
        this.Hire_Date = new Date();
    }
}

class Hire implements IHire {
    applicant: IApplicant;
    employee: IEmployee;

    constructor(applicant:Applicant) {
        this.applicant = applicant;
        this.employee = new Employee(this.applicant);
    }
}

export { vaccancies, recruiter , Applicant, Interview , Employee , Hire };

