// ie: 1 class

class Greeter 
{
    greeting: string;
    constructor(message: string) 
    {
        this.greeting = message;
    }
    greet():string 
    {
        return "Welcome " + this.greeting;
    }
}
let greeter = new Greeter("to Jumanji!");
console.log(greeter.greet());




// ie: 2 class
class Point 
{
    x:string;
    y:number;
    person():void 
    {
        console.log(`Your name is: ${this.x}\nYour age is: ${this.y}`);
    }
}
let pt = new Point();
pt.x = "Shubh";
pt.y = 22;
pt.person();

// ie: 3 Abstract Classes and Members
abstract class BaseAbClass {
    abstract getName() : string;

    printName() {
        console.log("Hello, " + this.getName() + "COngratulations for winning 2020-2021's Balon D'Or");
    }
}

class DerivedAbClass extends BaseAbClass {
    getName() {
        return "Leo Messi";
    }
}

const b = new DerivedAbClass();
b.printName();

//Computed and constant members

enum FileAccess {
    //constant members
    None,
    Read = 1 << 1,
    Write = 1 << 2,
    ReadWrite = Read | Write,
    //computed member
    nameLength = "Shubh".length,
}
//constructor

class Point2 {
    x: number;
    y: number;

    constructor(x = 0, y = 0) {
      this.x = x;
      this.y = y;
    }
}

//class inheritance

class Animal {
    moving(distanceInMeters: number = 0){
        console.log(`Animal moved ${distanceInMeters}`);
    }
}

class Dog extends Animal {
    bark() {
        console.log("Woof! Woof!");
    }
}

class Cat extends Animal {
    meow() {
        console.log("meow! meow")
    }
}


const dog = new Dog();
dog.bark();
dog.moving(10);
dog.bark();

const cat = new Cat();
cat.meow();
cat.moving(20);
cat.meow();


//getter / setter

// class C {
//     _length = 0;
//     get length() {
//         return this._length;
//     }

//     set length(value) {
//         this._length = value;
//     }
// }


//implement clause
interface Pingable {
    ping():void;
}

class Sonar implements Pingable {
    ping() {
        console.log("Ping! Ping!");
    }
}

// Extending clause, Classes may extend from a base class. A derived class has all the properties and methods of its base class, and also define additional members.
class Pet {
    move() {
        console.log("On walk");
    }
}

class Doggy extends Pet {
    woof(times:number){
        for (let i = 0; i < times; i++) {
            console.log("Woof! ");
        }
    }
}

class Tiger extends Pet {
    roar(times:number){
        for (let i = 0; i < times; i++) {
            console.log("Roarrr ");
        }
    }
}

const doggy = new Doggy();
doggy.move();
doggy.woof(5);
const tigress = new Tiger();
tigress.move();
tigress.roar(6);


//overriding methods

class Shape {
    area() {
        return 0;
    }
}

class Circle extends Shape {
    area(radius?:number) {
        return 3.14 * radius * radius;
    }
}

const c = new Circle();
console.log(c.area(2));


//super keyword runs constructor of parent class

class Base {
    constructor() {
        console.log("Parent says hi!");
    }
}

class Child extends Base {
    constructor() {
        super();
        console.log("Hello Parent this is child!");
    }
}


//access modifiers

//public : defualt visibility modifies of class

//protected : only visiable to subclass

//private: restrict access to the members even for a subclass


class BaseClass {
    //members 
    public x : 2;
    protected y : 3;
    private z : 5;

    constructor() {
        console.log(
        `x : ${this.x}
        y : ${this.y}
        z : ${this.z}`);
    }

}

class Derived extends BaseClass {
    
    constructor() {
        super();
        console.log(`x : ${this.x}
        y : ${this.y}`);
        //this.z throw erro as z is private members and can only be acces inside Base class
    }
}

const derivedInstance = new Derived();
console.log(derivedInstance.x); //return 2
// console.log(derivedInstance.y); //throw error
// console.log(derivedInstance.z); //throw error


//static members : Classes may have static members. These members aren’t associated with a particular instance of the class

class MyClass {
    public static x = 0;
    public static printX() {
        console.log(MyClass.x);
    }
}

console.log(MyClass.x);
MyClass.printX();

//special static names
//certain static names can't be used. Function properties like name,length,call aren't valid to define as Static members.

//static blocks
//Static blocks allow you to write a sequence of statements with their own scope that can access private fields within the containing class.





// Object Types
//In JavaScript, the fundamental way that we group and pass around data is through objects. In TypeScript, we represent those through object types.

function greet(person: { name: string; age: number }) {
    return "Hello " + person.name;
}


console.log(greet({name:"Shubh",age:22}));

//the above approach with interface

interface Person {
    name:string;
    age:number;
    sports:string
}

function greetWithInterface(person:Person) {
    return "Hello" + person.name;
}

console.log(greetWithInterface({name:"Shubh",age:21,sports:"Football"}));