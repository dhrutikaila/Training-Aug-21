
 
/// <reference path = "animal.ts" /> 
namespace Animal { 
   export class cat implements IAnimal { 
      public sound() { 
         console.log("Meow Meow"); 
      } 
   }
}