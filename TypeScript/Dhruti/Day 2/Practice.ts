/**
 * Takes a string and adds "padding" to the left.
 * If 'padding' is a string, then 'padding' is appended to the left side.
 * If 'padding' is a number, then that number of spaces is added to the left side.
 */
 function padLeft(value: string, padding: any) {
    if (typeof padding === "number") {
      return Array(padding + 1).join(" ") + value;
    }
    if (typeof padding === "string") {
      return padding + value;
    }
    throw new Error(`Expected string or number, got '${typeof padding}'.`);
  }
   
  padLeft("Hello world", 4); // returns "    Hello world"

  /**
 * Takes a string and adds "padding" to the left.
 * If 'padding' is a string, then 'padding' is appended to the left side.
 * If 'padding' is a number, then that number of spaces is added to the left side.
 */
function padLeft(value: string, padding: string | number) {
    // ...
  }
   
  let indentedString = padLeft("Hello world", true);
  Argument of type 'boolean' is not assignable to parameter of type 'string | number'.

  
  interface Bird {
    fly(): void;
    layEggs(): void;
  }
   
  interface Fish {
    swim(): void;
    layEggs(): void;
  }
   
  declare function getSmallPet(): Fish | Bird;
   
  let pet = getSmallPet();
  pet.layEggs();
   
  // Only available in one of the two possible types
  pet.swim();
  Property 'swim' does not exist on type 'Bird | Fish'.
    Property 'swim' does not exist on type 'Bird'.