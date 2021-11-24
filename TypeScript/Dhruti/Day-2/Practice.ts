
//Extending Interfaces

interface Shape {
    color: string;
  }
   
  interface PenStroke {
    penWidth: number;
  }
   
  interface Square extends Shape, PenStroke {
    sideLength: number;
  }
   
  let square = {} as Square;
  square.color = "blue";
  square.sideLength = 10;
  square.penWidth = 5.0;



  //class example
  class Greeter {
    greeting: string;
   
    constructor(message: string) {
      this.greeting = message;
    }
   
    greet() {
      return "Hello, " + this.greeting;
    }
  }
   
  let greeter = new Greeter("world");



  //overriding

  class Base {
    greet() {
      console.log("Hello, world!");
    }
  }
   
  class Derived extends Base {
    greet(name?: string) {
      if (name === undefined) {
        super.greet();
      } else {
        console.log(`Hello, ${name.toUpperCase()}`);
      }
    }
  }
   
  const d = new Derived();
  d.greet();
  d.greet("reader");