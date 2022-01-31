//interfaces


interface IPerson { 
    firstName:string, 
    lastName:string, 
    fun1: ()=>string 
 } 
 
 var customer:IPerson = { 
    firstName:"gagan",
    lastName:"yadav", 
    fun1: ():string =>{
        return "Hi there"
    } 
 } 
  
 console.log(customer.firstName) 
 console.log(customer.lastName) 
 console.log(customer.fun1())  
 
 var employee:IPerson = { 
    firstName:"ramesh",
    lastName:"srivastav", 
    fun1: ():string =>{return "Hello!!!"} 
 } 
   
 console.log(employee.firstName);
 console.log(employee.lastName);

 //keypair in interface

 interface KeyPairExample{
     key:number;
     value:string;
 }

 let First1:KeyPairExample = {
     key:1,
     value:"robert"
    };


 //interface in functions

 interface Interface_Fun{
     (num:number,name:string):void
 }

 function fun1(num:number,name:string):void{
     console.log('number is'+num+'name is '+name);
 }

 let result:Interface_Fun = fun1;
 fun1(33,"avinash");