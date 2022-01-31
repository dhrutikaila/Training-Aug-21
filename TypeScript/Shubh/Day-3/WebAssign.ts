type Applcants = {
    fullname: string; role: string; interest: string; applicationDate: Date;
    interViewStart?: boolean; interViewDate?: Date; interViewEnd?: boolean; cleared?: boolean; hired?: boolean; joiningDate?: Date;
}
export var applicantData: Applcants[]=[];

export class Applicants{
    public addApplicants(fname: string, role:string, intr: string): void{
        try {
            applicantData.push({ fullname: fname, role: role, interest: intr, applicationDate:new Date()});
            console.log(`Dear ${fname}, your application for ${role} has been received successfully, we will contact you soon after reviewing your application.`);
        }
        catch (e) {
            console.error(e);
        }
    }
    public ShowApplicants(): void{
        console.log("Applicants list:");
        console.log(applicantData)
    }
}

export class Interview{
    public StartInterview(startedName:string[]) {
        startedName.forEach(element => {
            applicantData.forEach(appl => {
                if (appl.fullname == element) {
                    appl.interViewDate = new Date();
                    appl.interViewStart = true;
                }
            });            
        });
    }
    public EndInterview(endName:string[]) {
        endName.forEach(element => {
            applicantData.forEach(appl => {
                if (appl.fullname == element) {
                    appl.interViewEnd = true;
                }
            });
            
        });
    }
    public HireApplicant(hireedName:string[]) {
        hireedName.forEach(element => {
            applicantData.forEach(appl => {
                if (appl.fullname == element) {
                    appl.hired = true;
                    appl.joiningDate = new Date();
                }
            });
            
        });
    }
    public ClearApplicant(clearedName:string[]) {
        clearedName.forEach(element => {
            applicantData.forEach(appl => {
                if (appl.fullname == element) {
                    appl.cleared = true;
                }
            });
            
        });
    }
}
type vacancy = {
    role: string; department:string; exp: string; minSalary: number; maxSalary: number; location: string; joining: string; technology: string;
    }
var vacancyData: vacancy[]=[];
export class vacancies{
    public AddVacancy(rol: string,dept: string, xp: string, minS: number, maxS: number, loc: string, join: string, tech: string): void{
        try {
            vacancyData.push({ role: rol, department: dept, exp: xp, minSalary: minS, maxSalary: maxS, location: loc, joining: join, technology: tech });
            console.log("VacancyData Added\n");
        }
        catch (e) {
            console.error(e);
        }
    }
    public ShowVacancy(): void{
        vacancyData.forEach(vacant => {
            console.log(`Hello there fresh minds! Are you looking for an opportunity to xpand your knowledge and to work on project based on latest technologies?
            \nWe are having an opening for
            \nRole: ${vacant.role}
            \nTechnology: ${vacant.technology}
            \nDepartment: ${vacant.department}
            \nexp required: ${vacant.exp} years
            \nSalary: ${vacant.minSalary}-${vacant.maxSalary}
            \nCompany: ${vacant.location}
            \nWe will be glad to work with you! All the best.\n`);                       
        });
    }
}