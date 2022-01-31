//Vacancy class
class Vacancies {
    TechnologyName: string;
    TotalVacancies: number;
    ExperienceRequired: number;

    constructor(technology: string, vacancies: number, experience: number){
        this.TechnologyName = technology;
        this.TotalVacancies = vacancies;
        this.ExperienceRequired = experience;
    }
}


//Applicants class
class Applicants {
    ApplicantName: string;
    ContactNo: number;
    Appliedtechnology: string;
    Experince: number;
    Selected: boolean

    constructor(name:string, contact:number, technology:string,experience: number, selected:boolean){
        this.ApplicantName = name;
        this.ContactNo = contact;
        this.Appliedtechnology = technology;
        this.Experince = experience;
        this.Selected = selected;
    }
}

export {Vacancies, Applicants}