
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