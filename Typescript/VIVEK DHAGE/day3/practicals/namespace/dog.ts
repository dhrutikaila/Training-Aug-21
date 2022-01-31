

/// <reference path = "animal.ts" /> 
namespace Animal { 
   export class dog implements IAnimal { 
      public sound() { 
         console.log("woof woof"); 
      }
    }
}  