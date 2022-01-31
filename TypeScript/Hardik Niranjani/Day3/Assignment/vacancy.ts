interface IVacancy {
    Technology:string,
    Experience:number,
    Salary:number,
    Total_Vacancies:number,
}



class Vacancy1 implements IVacancy {
    Technology:string;
    Experience:number;
    Salary:number;
    Total_Vacancies:number

    constructor(Tech:string,Exp:number,Sal:number,Total_v:number){
        this.Technology =Tech;
        this.Experience =Exp;
        this.Salary = Sal;
        this.Total_Vacancies = Total_v;
    }
 
}


// class Vacancy{
//     // add vacancy function
//         Add_Vacancy(Tech:string, Exp:number,Sal:number,Total_Vac:number):void {
//             Vacancy_Data.push({Technology:Tech, Experience:Exp, Salary:Sal ,Total_Vacancies:Total_Vac})
//         }
//     // show data 
//         show_Vacancy():void {
//             console.log(Vacancy_Data)
//         }
// }


export {Vacancy1}