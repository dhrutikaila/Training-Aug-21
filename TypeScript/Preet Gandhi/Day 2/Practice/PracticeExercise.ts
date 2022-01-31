//CLASSES
//Creating a simple class
class Employee {
    empCode: number; //property
    empName: string;

    constructor(code: number, name: string) { //construtor
        this.empCode = code;
        this.empName = name;
    }

    getSalary(): number { //method
        return 10000;
    }
}

let emp = new Employee(10,"Hiren Panchal");
console.log(emp.getSalary());
//--------------------------------------------------------------------
console.log("-------------------------------------------");

//Animal Class for inheritance
class Animal{
    name: string;
    constructor(theName: string){
        this.name = theName;
    }
    move(distanceInMeters: number = 0){
        console.log(`${this.name} moved ${distanceInMeters} meters`);
    }
}
//----------------------------------------------------------------------
console.log("-------------------------------------------");

//Modifiers
//Public
class Animal2{
    public name: string;

    public constructor(theName: string){
        this.name = theName;
    }

    public move(distanceInMeters: number = 0){
        console.log(`Animal moved ${distanceInMeters} meters`)
    }
}

//Private
class Employee2{
    private empCode: number = 5;
    empName: string = "Hitesh";
}

let emp2 = new Employee2();
// console.log(emp2.empCode);  //Can not access due to private 
console.log(emp2.empName) 
//-----------------------------------------------------------
console.log("-------------------------------------------");

//Readonly
class Octopus{
    readonly name: string;
    readonly numberOfLegs: number = 10;

    constructor(theName: string){
        this.name = theName;
    }
}

let octo = new Octopus("octo");
// octo.name = "Oct"; //Can not change name due to readonly
console.log(octo);


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");


//FUNCTIONS
//Creating simple function
function add(x: number, y: number): number{
    return x + y; 
}
console.log(add(4,5));
//-----------------------------------------------------------
console.log("-------------------------------------------");

//this keyword and Arrow function
class Employee3{
    empCode: number;
    empName: string;
    constructor(code: number, name: string){
        this.empCode = code;
        this.empName = name;
    }

    display = () => console.log(`Code of ${this.empName} is ${this.empCode}`);
}

let emp3 = new Employee3(5,"Jayesh");
emp3.display();
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");

//ENUMS
//numeric enum (Starts with 1 index)
enum Direction{
    Up = 1 ,Dowm,Left,Right
}
console.log(Direction.Right);

//string enum
enum PrintMedia{
    NewsPaper = "NewsPaper",
    NewsLetter = "NewsLetter",
    Magazine = "Magazine",
    Book = "Book"
}
console.log(PrintMedia.Book);

//Heterogeneous Enum
enum Status{
    Active = "Active",
    Disable = 0,
    Pending = -1
}
console.log(Status.Pending);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");


//INTERFACES
//simple interface
interface IEmployee{
    empCode: number;
    name: string;
    getSalary:(number)=> number;
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");

//TUPLES
//simple tuple
var personDetails: [string,number,string,boolean];
personDetails = ["Hiren", 34, "Male", true];
console.log(`Is Hiren Married?: ${personDetails[3]}` );

//Tuple array
var tupleArray: [number,string][];
tupleArray = [[1,"Het"], [2,"Jeet"], [3,"Meet"]];
console.log(tupleArray[1][1]);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");

//UNION
let code: (string | number);
code = 123;
code = "Hello";
// code = true; //Error because it is boolean type


//export class
export {Animal, IEmployee};

