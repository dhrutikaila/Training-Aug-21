//Class
class Employee{
    EmployeeID:number;
    EmployeeName:string;

    public constructor(Id:number,Name:string)
    {
        this.EmployeeID = Id;
        this.EmployeeName = Name
    }

    getSalary():number{
        return 25000;
    }
}
var empObj = new Employee(1,"Rutvik Kalasha");
console.log(empObj.getSalary());

//Function
function add(a:number,b:number):number
{
    return a+b;
}

//anonymous function
var total = function(a:number,b:number):number{
    return a+b;
}
console.log(total(1,20));

//Enum
enum Status{
    success,
    fail
}
var s:Status;
var statusVal = Status.success;
console.log(statusVal);


//Interface
interface IEmployee{
    GetEmployeeFullName:(a:string,b:string)=>string;
}

class Employees implements IEmployee
{
    firstName:string;
    lastName:string;

    GetEmployeeFullName(firstName:string,lastName:string)
    {
        this.firstName = firstName;
        this.lastName = lastName;
        return firstName + " " +lastName;
    }
}
var empObject = new Employees()
console.log(empObject.GetEmployeeFullName("Nayan","Kalasha"));

//interface function type
interface keyValueProcessor
{
    (key:number,value:string):void;
}
function addKeyValue(key:number,value:string)
{
    return console.log("Key : "+key+" Value : "+value);
}
let kvp:keyValueProcessor = addKeyValue;
kvp(1,"Rutvik");



//interface for creating properties
interface properties{
    name:string,
    Id:number,
    IsDone?:boolean //optional
    readonly SSN:string;
}
//interface extend another interface
interface Iperson{
    Name:string,
    Age:number
}
interface IEmp extends Iperson
{
    empId:number
}
var EmployeeObj:IEmp = {
    Name:"Rutvik",
    Age:20,
    empId:1
}


//Tuples
var a:[number,string];
a=[1,"Rutvik"];
console.log(a);

var employee : [number,string][];
employee = [[1,"Nayan"],[2,"Ankit"],[3,"Darshan"]];
console.log(employee[0]);

//Union
var unionVar : number|string|boolean;
unionVar=12;
console.log(unionVar);

unionVar="Tarak";
console.log(unionVar);

unionVar=true;
console.log(unionVar);
