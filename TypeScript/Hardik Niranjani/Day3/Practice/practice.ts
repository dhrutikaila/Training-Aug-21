// // generics
// // Hello World of Generics
// function identity(arg: number): number {
//     return arg;
//   }

// //   using the any type
// function identity1(arg: any): any {
//     return arg;
//   }

// // generics type
// function identity2<T>(arg: T): T {
//     return arg;
//   }


// //   Generic Classes
// class GenericNumber<T> {
//     zeroValue: T;
//     add: (x: T, y: T) => T;
//   }
   
//   let myGenericNumber = new GenericNumber<number>();
//   myGenericNumber.zeroValue = 0;
//   myGenericNumber.add = function (x, y) {
//     return x + y;
//   };

// //   Using Class Types in Generics
// class BeeKeeper {
//     hasMask: boolean;
//   }
   
//   class ZooKeeper {
//     nametag: string;
//   }
   
//   class Animal {
//     numLegs: number;
//   }
   
//   class Bee extends Animal {
//     keeper: BeeKeeper;
//   }
   
//   class Lion extends Animal {
//     keeper: ZooKeeper;
//   }
   
//   function createInstance<A extends Animal>(c: new () => A): A {
//     return new c();
//   }
   
//   createInstance(Lion).keeper.nametag;
//   createInstance(Bee).keeper.hasMask;

// //   Modules 

// // Exporting a declaration
//     // StringValidator.ts file name 
// export interface StringValidator {
//     isAcceptable(s: string): boolean;
//   }

// //   ZipCodeValidator.ts file name 
//   import { StringValidator } from "./StringValidator";
// export const numberRegexp = /^[0-9]+$/;
// export class ZipCodeValidator implements StringValidator {
//   isAcceptable(s: string) {
//     return s.length === 5 && numberRegexp.test(s);
//   }
// }

// // Export statements
// class ZipCodeValidator implements StringValidator {
//     isAcceptable(s: string) {
//       return s.length === 5 && numberRegexp.test(s);
//     }
//   }
//   export { ZipCodeValidator };
//   export { ZipCodeValidator as mainValidator };



// //   Import a single export from a module
// import { ZipCodeValidator } from "./ZipCodeValidator";
// let myValidator = new ZipCodeValidator();

// // Import a module for side-effects only
// import "./my-module.js";


// // Namespaces
// // Namespaced Validators
// namespace Validation {
//     export interface StringValidator {
//       isAcceptable(s: string): boolean;
//     }
//     const lettersRegexp = /^[A-Za-z]+$/;
//     const numberRegexp = /^[0-9]+$/;
//     export class LettersOnlyValidator implements StringValidator {
//       isAcceptable(s: string) {
//         return lettersRegexp.test(s);
//       }
//     }
//     export class ZipCodeValidator implements StringValidator {
//       isAcceptable(s: string) {
//         return s.length === 5 && numberRegexp.test(s);
//       }
//     }
//   }
//   // Some samples to try
//   let strings = ["Hello", "98052", "101"];
//   // Validators to use
//   let validators: { [s: string]: Validation.StringValidator } = {};
//   validators["ZIP code"] = new Validation.ZipCodeValidator();
//   validators["Letters only"] = new Validation.LettersOnlyValidator();
//   // Show whether each string passed each validator
//   for (let s of strings) {
//     for (let name in validators) {
//       console.log(
//         `"${s}" - ${
//           validators[name].isAcceptable(s) ? "matches" : "does not match"
//         } ${name}`
//       );
//     }
//   }