// //generics

// function gene_1<T>(arg: T): T {    
//     return arg;    
// }    
// let output1 = gene_1<string>("myString");    
// let output2 = gene_1<number>( 100 );  
// console.log(output1);  
// console.log(output2);  



// function displayDataType<T>(id:T, name:string): void {   
//     console.log("DataType of Id: "+typeof(id) + "\nDataType of Name: "+ typeof(name));    
//   }  
//   displayDataType<number>(1, "Abhishek");  

//   interface StudentInfo<T, U>  
// {  
//     (id: T, value: U): void;  
// };  
// function studentData(id: number, value:string):void {   
//     console.log('Id = '+ id + ', \nName = ' + value)  
// }  
// let std: StudentInfo<number, string> = studentData;  
// std(11, "Rohit Sharma");  

// //generics

// function disp<A>(a:A):A{
//     return a;
// }

// var am = disp<string>("Five");
// var am2 = disp<number>(5);

// //class generics

// class students<T,U>{
//     id:T;
//     name:U;

//     // constructor(ID:T,NAME:U){
//     //     this.id=ID;
//     //     this.name=NAME
//     // }
//     setvalue(ID:T,NAME:U):void{
//         this.id=ID;
//         this.name=NAME
//     }

//     display():void{
//         console.log(`id is: ${this.id} and name is : ${this.name}`);
//     }
// }

// let st1 = new students<number,string>();
// st1.setvalue(33,"hello");
// st1.display();