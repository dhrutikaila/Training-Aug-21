// // Enum

// enum Category{ Biography, poetry ,Fiction}; // 0,1,2

// enum Category{ Biography1= 1, poetry1 ,Fiction1}; //1,2,3

// enum Category{ Biography2 = 5, poetry2 = 8 ,Fiction2 = 10}; // 5,8,10

// let FavCategory:Category = Category.Biography;
// console.log(FavCategory);


// // category string
// let categoryString = Category[FavCategory];
// console.log(categoryString);


// // Array
// // declaration_1
// let strArrar1:string[] = ['str1', 'str2', 'str3'];

// // declaration_2
// let strArrar2:Array<string> = ['str2', 'str3'];

// // declaration_3
// let strArray3:any[] = [23,'str',true];


// // Tuples
// let myTuples:[number, string] = [25,'truck']
// let firstElement = myTuples[0]; // 25
// let secondElement = myTuples[1]; //'truck'

// console.log(firstElement);
// console.log(secondElement);



// // Union
// /**
//  * Takes a string and adds "padding" to the left.
//  * If 'padding' is a string, then 'padding' is appended to the left side.
//  * If 'padding' is a number, then that number of spaces is added to the left side.
//  */
// function padLeft(value: string, padding: any) {
//     if (typeof padding === "number") {
//       return Array(padding + 1).join(" ") + value;
//     }
//     if (typeof padding === "string") {
//       return padding + value;
//     }
//     throw new Error(`Expected string or number, got '${typeof padding}'.`);
//   }


// // classes

// class Greeter {
//     greeting: string;
   
//     constructor(message: string) {
//       this.greeting = message;
//     }
   
//     greet() {
//       return "Hello, " + this.greeting;
//     }
//   }
   
//   let greeter = new Greeter("world");



// // Inheritance

// class Animal {
//   move(distanceInMeters: number = 0) {
//     console.log(`Animal moved ${distanceInMeters}m.`);
//   }
// }
 
// class Dog extends Animal {
//   bark() {
//     console.log("Woof! Woof!");
//   }
// }
 
// const dog = new Dog();
// dog.bark();
// dog.move(10);
// dog.bark();


// // Duck type interface 

// interface Duck {
//     walk:() => void;
//     swim:() => void;
//     quack:()=> void;
// }

// let probablyDuck = {
//   walk:() => console.log("walking like a duck"),
//   swim:()=> console.log("swim like a duck"),
//   quack:()=> console.log("quack like a duck")
// }

// function FlyOverWater(bird:Duck){}
// FlyOverWater(probablyDuck);

// // function

// // add types
// // declaration_1
// function add(x: number, y: number): number {
//   return x + y;
// }
// // declaration_2 - Anonymous function 
// let myAdd = function (x: number, y: number): number {
//   return x + y;
// };

