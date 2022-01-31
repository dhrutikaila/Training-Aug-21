
export class Applicant<T,U,V> {
    ApplicantName: T;
    ApplicantPhone: U;
    ApplicantStudyStatus:V;

    constructor(name: T, phone: U, study:V) {
        this.ApplicantName = name;
        this.ApplicantPhone = phone;
        this.ApplicantStudyStatus=study;
    }
    dispApplicant() {
        console.log("Applicants:")
        console.log ("applicant name: " + this.ApplicantName + ", Employee number: " + this.ApplicantPhone );
    }
}
