// Generic

// function identity<T>(arg: T): T {    
//     return arg;    
// }    
// let output1 = identity<string>("myString");    
// let output2 = identity<number>( 100 );  
// console.log(output1);  
// console.log(output2);  

// // Multi-type variables

// function displayDataType<T, U>(id:T, name:U): void {   
//     console.log("DataType of Id: "+typeof(id) + "\nDataType of Name: "+ typeof(name));    
//   }  
//   displayDataType<number, string>(101, "Abhishek");  

// //   Generic with non-generic Type

// // function displayDataType<T>(id:T, name:string): void {   
// //     console.log("DataType of Id: "+typeof(id) + "\nDataType of Name: "+ typeof(name));    
// //   }  
// //   displayDataType<number>(1, "Abhishek");  


// //   Generics Classes

//   class StudentInfo<T,U>  
// {   
//     private Id: T;  
//     private Name: U;  
//     setValue(id: T, name: U): void {   
//         this.Id = id;  
//         this.Name = name;  
//     }  
//     display():void {   
//         console.log(`Id = ${this.Id}, Name = ${this.Name}`);  
//     }  
// }  
// let st = new StudentInfo<number, string>();  
// st.setValue(101, "Virat");  
// st.display();  
// let std = new StudentInfo<string, string>();  
// std.setValue("201", "Rohit");  
// std.display();

// namespace

///<reference path="namespaces.ts" />


// var data = employee.salary.DisplaySalary(23);
// console.log(data);

// var display = employee.displayDataType(2323);


// module

// export let age : number = 20;
// export class Employee {
//     empCode: number;
//     empName: string;
//     constructor(name: string, code: number) {
//         this.empName = name;
//         this.empCode = code;
//     }
//     displayEmployee() {
//         console.log ("Employee Code: " + this.empCode + ", Employee Name: " + this.empName );
//     }
// }
// let companyName:string = "XYZ";

// import

// import { Employee } from "./Employee";
// let empObj = new Employee("Steve Jobs", 1);
// empObj.displayEmployee(); //Output: Employee Code: 1, Employee Name: Steve Jobs  