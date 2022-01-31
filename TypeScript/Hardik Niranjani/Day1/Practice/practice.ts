// // declare variable 

// var age: number = 44;
// var demoname: string = "name1"
// var isUpdate: boolean = true;

// // TypeScript Number Type Variables
// let first:number = 123; // number 
// let second: number = 0x37CF;  // hexadecimal
// let third:number=0o377 ;      // octal
// let fourth: number = 0b111001;// binary  

// console.log(first);  // 123 
// console.log(second); // 14287
// console.log(third);  // 255
// console.log(fourth); // 57 


// // Number Methods :- toExponential()
// let myNumber: number = 123456;

// myNumber.toExponential(); // returns 1.23456e+5
// myNumber.toExponential(1); //returns 1.2e+5
// myNumber.toExponential(2); //returns 1.23e+5
// myNumber.toExponential(3); //returns 1.235e+5


// // Number Methods :- toFixed()
// let myNumber1: number = 10.8788;

// myNumber1.toFixed(); // returns 11
// myNumber1.toFixed(1); //returns 10.9
// myNumber1.toFixed(2); //returns 10.88
// myNumber1.toFixed(3); //returns 10.879
// myNumber1.toFixed(4); //returns 10.8788


// // Array
// let list: number[] = [1, 2, 3];
// // second way
// let list1: Array<number> = [1, 2, 3];

// // Tuple
// // Declare a tuple type
// let x: [string, number];
// // Initialize it
// x = ["hello", 10]; // OK
// // Initialize it incorrectly
// // x = [10, "hello"]; // Error


// // Any
// declare function getValue(key: string): any;
// // OK, return value of 'getValue' is not checked
// const str: string = getValue("myString");
// let looselyTyped: any = 4;
// // OK, ifItExists might exist at runtime
// looselyTyped.ifItExists();
// // OK, toFixed exists (but the compiler doesn't check)
// looselyTyped.toFixed();
 
// let strictlyTyped: unknown = 4;
// // strictlyTyped.toFixed(); //error

// // Void
// function warnUser(): void {
//     console.log("This is my warning message");
//   }

