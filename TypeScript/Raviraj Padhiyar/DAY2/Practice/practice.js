//enums 
// enum Direction {
//     Up,
//     Down,
//     Left,
//     Right,
// }
//Up is by intialized with 0 down with 1 and so on
var Direction;
(function (Direction) {
    Direction[Direction["Up"] = 1] = "Up";
    Direction[Direction["Down"] = 2] = "Down";
    Direction[Direction["Left"] = 3] = "Left";
    Direction[Direction["Rigth"] = 4] = "Rigth";
})(Direction || (Direction = {}));
//now up is intialized with value 1 and Down with value 2 and so on
var UserResponse;
(function (UserResponse) {
    UserResponse[UserResponse["No"] = 1] = "No";
    UserResponse[UserResponse["Yes"] = 0] = "Yes";
})(UserResponse || (UserResponse = {}));
function respond(recipient, message) {
    console.log(`Mr. ${recipient} voted for ${UserResponse}`);
}
respond("Luke Skywalker", UserResponse.Yes);
//Computed and constant members
var FileAccess;
(function (FileAccess) {
    //constant members
    FileAccess[FileAccess["None"] = 0] = "None";
    FileAccess[FileAccess["Read"] = 2] = "Read";
    FileAccess[FileAccess["Write"] = 4] = "Write";
    FileAccess[FileAccess["ReadWrite"] = 6] = "ReadWrite";
    //computed member
    FileAccess[FileAccess["nameLenght"] = "raviraj".length] = "nameLenght";
})(FileAccess || (FileAccess = {}));
//classes
class Greeter {
    constructor(message) {
        this.greeting = message;
    }
    greet() {
        return "hello " + this.greeting;
    }
}
let greeter = new Greeter("world");
console.log(greeter.greet());
//
class Point {
    location() {
        console.log(`your geo coordinate are  ${this.x} latitude ${this.y} longitude`);
    }
}
let pt = new Point();
pt.x = 23.72;
pt.y = 72.6;
pt.location();
// pt.x = "0" throw error as   -->Type 'string' is not assignable to type 'number'.
class GreeterG {
    constructor(othername) {
        this.name = "world";
        if (othername !== undefined) {
            this.name = othername;
        }
    }
}
const g = new GreeterG();
// g.name = "also not ok"; --> thorw error as g.name is string only
//constructor
class Point2 {
    constructor(x = 0, y = 0) {
        this.x = x;
        this.y = y;
    }
}
//class inheritance
class Animal {
    move(distanceInMeters = 0) {
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
        console.log("meow! meow");
    }
}
const dog = new Dog();
dog.bark();
dog.move(10);
dog.bark();
const cat = new Cat();
cat.meow();
cat.meow();
cat.move(20);
//getter / setter
class C {
    constructor() {
        this._length = 0;
    }
    get length() {
        return this._length;
    }
    set length(value) {
        this._length = value;
    }
}
class Sonar {
    ping() {
        console.log("Ping! Ping!");
    }
}
// class Ball implements Pingable {
//     pong() {
//         console.log("Pong! Pong!");
//     }
// } throw error as we need implement ping method bcuz of implements clause
//extends clause
//Classes may extend from a base class. A derived class has all the properties and methods of its base class, and also define additional members.
class Pet {
    move() {
        console.log("Moving along!");
    }
}
class Doggy extends Pet {
    woof(times) {
        for (let i = 0; i < times; i++) {
            console.log("Woof! ");
        }
    }
}
const doggy = new Doggy();
doggy.move();
doggy.woof(5);
//overriding methods
class Shape {
    area() {
        return 0;
    }
}
class Circle extends Shape {
    area(radius) {
        return 3.14 * radius * radius;
    }
}
const c = new Circle();
console.log(c.area(2));
//super keyword runs constructor of parent class
class Base {
    constructor() {
        console.log("hello from base");
    }
}
class Child extends Base {
    constructor() {
        super();
        console.log("hello from child");
    }
}
//access modifiers
//public : defualt visibility modifies of class
//protected : only visiable to subclass
//private: restrict access to the members even for a subclass
class BaseClass {
    constructor() {
        console.log(`x : ${this.x}
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
    static printX() {
        console.log(MyClass.x);
    }
}
MyClass.x = 0;
console.log(MyClass.x);
MyClass.printX();
//special static names
//certain static names can't be used. Function properties like name,length,call aren't valid to define as Static members.
//static blocks
//Static blocks allow you to write a sequence of statements with their own scope that can access private fields within the containing class.
//abstract
//Classes and Members
class BaseAbClass {
    printName() {
        console.log("Hello, " + this.getName());
    }
}
// const b = new BaseAbClass();  : Cannot create an instance of an abstract class.ts(2511)
class DerivedAbClass extends BaseAbClass {
    getName() {
        return "Raviraj";
    }
}
const b = new DerivedAbClass();
b.printName();
// Object Types
//In JavaScript, the fundamental way that we group and pass around data is through objects. In TypeScript, we represent those through object types.
function greet(person) {
    return "Hello " + person.name;
}
console.log(greet({ name: "Raviraj", age: 21 }));
function greetWithInterface(person) {
    person.contactNumber ? console.log("calling u") : console.log(" calling not avaialable");
    return "Hello" + person.name;
}
console.log(greetWithInterface({ name: "Raviraj", age: 21 }));
function printCoord(pt) {
    console.log(`your geo coordinate are  ${pt.x} latitude ${pt.y} longitude`);
}
printCoord({ x: 100, y: 100 });
//union and intersection
var phoneNumber;
