interface IApplicant{
    Name: string,
    PhoneNumber:number,
    Email:string,
    Experience:number,
    Technology:string,
    
}

// var Applicant_Data: IApplicant[] = [];

class Applicant1 implements IApplicant{
    Name: string;
    PhoneNumber:number;
    Email:string;
    Experience:number;
    Technology:string;
    


    constructor(Name:string,PhoneNo:number,Email:string,Exp:number,Tech:string){
                this.Name=Name;
                this.PhoneNumber = PhoneNo;
                this.Email = Email;
                this.Experience = Exp;
                this.Technology =Tech;
                
    }
}

// export class Applicant{
//     // add applicant data function
//         Add_Applicant(Name:string, PhoneNo:number,Email:string,Exp:number,Tech:string):void {
//             Applicant_Data.push({Name:Name, PhoneNumber:PhoneNo, Email:Email,Experience:Exp,Technology:Tech})
//         }
//     // show data function
//         Show_Applicant():void {
//             console.log(Applicant_Data)
//         }
// }

export{Applicant1}