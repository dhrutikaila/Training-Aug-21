//1. Define an interface to standardize and reuse your object
interface Product {
  name: string;
  price: number;
  description: string;
}

let pen: Product = {
name: "Pen",
price: 1.43,
description: "Userful for writing"
}

let products: Product[] = [];
products.push(pen);
//...do other products.push(_) to add more objects...
console.log(products);

//2. Addition
function addNumbers(a, b) {  
  return a + b;  
}  
var sum = addNumbers(6, 48);  
console.log('Sum of the numbers is: ' + sum);  

//3. arrays

let arr:number[];   
arr = [1, 2, 3, 4]   
console.log("Array[0]: " +arr[0]);   
console.log("Array[1]: " +arr[1]);  

//array by using the Array object.  
let array:string[] = new Array("JavaTpoint","2200","Java","Abhishek");  
for(var i = 0;i<array.length;i++) {   
   console.log(array[i]);  
}  

//Passing into function
let ar:string[] = new Array("JavaTpoint", "2300", "Java", "Abhishek");   
function display(arr_values:string[]) {  
   for(let i = 0;i<arr_values.length;i++) {   
      console.log(ar[i]);  
   }    
}  
//Calling
display(ar);  

//4. Tupple
let empTuple = ["Rohit Sharma", 25, "JavaTpoint"];  
console.log("Name of the Employee is : "+empTuple [0]);  
console.log("Age of the Employee is : "+empTuple [1]);  
console.log(empTuple [0]+" is working in "+empTuple [2]);  

//5. Type Assertion
let code: any = 123; 
let employeeCode = <number> code; 
console.log(typeof(employeeCode)); //Output: number

//6. If 
let a: number = 10, b = 20;

if (a < b) 
{
    console.log('x is less than y');
}

// else if
let x: number = 10, y = 20;

if (x > y) 
{
    console.log('x is greater than y.');
} 
else if (x < y)
{
    console.log('x is less than y.'); //This will be executed
}
else if (x == y) 
{
    console.log('x is equal to y');
}

//
 class Student {
   fullName: string;
   constructor(
     public firstName: string,
     public middleInitial: string,
     public lastName: string
   ) {
     this.fullName = firstName + " " + middleInitial + " " + lastName;
   }
 }
 
 interface Person {
   firstName: string;
   lastName: string;
 }
 
 function greeter(person: Person) {
   return "Hello, " + person.firstName + " " + person.lastName;
 }
 
 let user = new Student("Jane", "M.", "User");

 document.body.textContent = greeter(user);

 function greeter(person) {
     return "Hello, " + person;
   }
   
   let user = "Srp";
   
   document.body.textContent = greeter(user);