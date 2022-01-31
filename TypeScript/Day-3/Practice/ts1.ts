//module 
export let age:number = 20;
export class Employee {
    empID: number;
    empName: string;
    constructor(name: string, id: number) {
        this.empName = name;
        this.empID = id;
    }
    displayEmployee() {
        console.log ("Employee Code: " + this.empID + ", Employee Name: " + this.empName );
    }
}
let companyName:string = "RadixWeb";