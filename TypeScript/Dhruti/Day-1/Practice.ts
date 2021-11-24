var age:number=44;
var Name :string ="dhruti";
var isUpdated: boolean=true;
console.log( age);
console.log(Name);
console.log(isUpdated);

let fullName: string = 'Bob Bobbington';
let age1: number = 37;
let sentence: string = 'Hello, my name is ${fullName}';

 //enum
 enum Color {
    Red = 1,
    Green,
    Blue,
  }
  let colorName: string = Color[2];
   
  // Displays 'Green'
  console.log(colorName);

// Declare a tuple type
let x: [string, number];
// Initialize it
x = ["hello", 10]; // OK
// Initialize it incorrectly
x = [10, "hello"]; // Error
Type 'number' is not assignable to type 'string'.
Type 'string' is not assignable to type 'number'.