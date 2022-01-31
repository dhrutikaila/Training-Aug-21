//tuples
var empdataTuple = [1,"shreya",2,"diya"]
console.log(empdataTuple)
console.log("Employee id is "+empdataTuple[0])
console.log("Employee name is "+empdataTuple[1])

//operation in tuple

//push
console.log("before adding the element "+empdataTuple.length)
empdataTuple.push("Dharal")
console.log("After adding the element "+ empdataTuple.length)

//pop()

console.log("before pop "+empdataTuple.length)
empdataTuple.pop()
console.log("After pop "+ empdataTuple.length)

//update tuple
empdataTuple[1]="Dhyanavi";
console.log("ID is "+ empdataTuple[0])
console.log("After updating the value "+ empdataTuple[1])

//clear tuples
empdataTuple=[];
console.log(empdataTuple)

//destructing the tuple
var empdataTuple = [1,"shreya",2,"diya",3]
var [empid,empname]=empdataTuple;
console.log(empid);
console.log(empname);

//passing tuple to function 
function display(tuple_value:any[]){
    for(var i=0;i<empdataTuple.length;i++){
        console.log(empdataTuple[i])
    }
}
display(empdataTuple)

//union 
let empnames : string|number;
empnames = "Shreya";
console.log("Name of the employee is " + empnames)
empnames = 1;
console.log("Id of the employee is " + empnames)

//passing value to the function 

function displayData(value :(number|string)){
    if(typeof(value)==="number"){
        console.log("The given value is of type number")}
    else if(typeof(value)==="string"){
        console.log('The given value is of type string.');  
        }
    }
displayData(123);
displayData("shreya");

//passing union type to an array
var arrType : number[]|string[];
arrType=[1,2,3,4]

for(var i =0 ;i<arrType.length;i++){
       console.log(arrType[i])
}
arrType=["Diya","Shreya"]

for(var i =0 ;i<arrType.length;i++){
    console.log(arrType[i])
}

//conditional statement

//if statement
var num = 10 , num2=20;
if(num < num2){
    console.log(`${num} is less than ${num2}`)
}

//if-else statement
if(num > 0){
    console.log(`${num} is Positive Number`)
}
else{
    console.log(`${num} is negative Number`)
}

//else if ladder

var marks = 56;
if(marks < 35){
    console.log(`Fail because your marks is ${marks}`)
}
else if(marks > 35 && marks<60){
    console.log("D grade")
}
else if(marks > 60 && marks < 70){
    console.log("C grade")
}
else if(marks > 70 && marks < 80){
    console.log("B grade")
}
else if(marks > 80 && marks < 90){
    console.log("A grade")
}
else if(marks > 90 && marks < 100){
    console.log("A+ grade")
}
else{
    console.log("Invalid!!!")
}
//function practice 

function FunExample(){
    console.log("Hello world")
}
FunExample();

//parameterize function
function Sum(x : number , y:number){
    return x+y;
}
console.log(Sum(12,122))

//anonymous function

var printData = function(){
    console.log("Calling anonymous function")
}
printData();

let Add = function(num:number , num1 : number){
    return num + num1;
}
console.log(Add(12,21));

function Greetings(greeting : string , name : string): string{
    return greeting + ' '+ name;
}
console.log(Greetings("hey","Shreya")) //no error
//console.log(Greetings("hey","Shreya","Diya")) //which gives error 

//optional parameter 
function greets(greeting:string , name? : string):string{
    return greeting +' '+name
}
console.log(greets("hey","Shreya"))
console.log(greets("hey") +"The second parameter is optional")

//default parameter 
function DefParameter( name : string , greeting : string = "hello"):string{
            return greeting +' '+name;
}
console.log(DefParameter("Shreya"));
console.log(DefParameter("Shreya" , "Hi"));

//Arrow function

var sum = (x:number , y : number):number=>{
    return x+y;
}
console.log(sum(10,20))

var data =()=>console.log("Print by arrow function")
data();

var sum = (x: number , y : number)=> x+y;
console.log(sum(10,50))

class employee{
    empId:number;
    empName : string

    constructor(id:number , name : string) {
        this.empId = id;
        this.empName = name;
    }
    display = () => console.log(`Employee Id is ${this.empId} Employee name is ${this.empName}`) 
}
var emp = new employee(1 , "Shreya");
emp.display();

//function overloading 

function ConcateString(a:string , b: string):string;
function ConcateString(a:number , b: number):number;
function ConcateString(a:any , b:any){
    return a + b;
}
console.log(ConcateString("hello","world"))
console.log(ConcateString(19,11))

//class example

class ClassExample{
    x:number = 20;
    y:number = 10;
}
const sum1 = new ClassExample();//creating object
console.log(sum1.x + sum1.y)

class employee1{
    empId:number;
    empName : string

    constructor(id:number , name : string) {
        this.empId = id;
        this.empName = name; 
        console.log(`Employee Id is ${id} Employee name is ${name}`) 
    }
    getSalary() : number{
        return 10000;
    }
}
//creating object
var emp1 = new employee1(12,"Shreya");
console.log(emp1.getSalary());

class student1{
    id:number;
    name : string;
    display = () => {
            console.log("Student Id is "+ this.id);
            console.log("Student name is "+ this.name);
            
    }
}
var stu = new student1();
stu.id = 101;
stu.name ="Shreya";
stu.display();

//inheritance

class car{
    color : string;
    constructor(color : string){
        this.color= color;
    }
}
class Audi extends car {
    price : number ;
    constructor(color:string , price:number){
        super(color);
        this.price = price;
    }
    display():void {  
        console.log("Color of Audi car: " + this.color);  
        console.log("Price of Audi car: " + this.price);  
    }  
}
var car1 = new Audi("white",850000);
car1.display();

//interface 

interface Iperson{
    name : string 
    age : number 
}

//access modifier
