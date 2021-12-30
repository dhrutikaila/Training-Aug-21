var age:number = 44;
var isValid:boolean = true;

console.log(age);

console.log("hello");

function fun1():void{
    alert("hello there");
}

console.log(fun1);




let value:any;
value = 55;
value = "fifty five";

let color: string = "blue";
color = 'red';

let list: number[] = [1, 2, 3];


function employee(id:number,name:string) { 
    this.id = id 
    this.name = name 
 } 
 
 var emp = new employee(123,"Smith") 
 employee.prototype.email = "smith@abc.com" 
 
 console.log("Employee 's Id: "+emp.id) 
 console.log("Employee's name: "+emp.name) 
 console.log("Employee's Email ID: "+emp.email)


 var name1= "Jai";
console.log(typeof name1);