//enums 

// enum Direction {
//     Up,
//     Down,
//     Left,
//     Right,
// }

//Up is by intialized with 0 down with 1 and so on

enum Direction {
    Up = 1,
    Down,
    Left,
    Rigth,
}

//now up is intialized with value 1 and Down with value 2 and so on


enum UserResponse {
    No = 1,
    Yes = 0,
}

function respond(recipient:string,message:UserResponse): void {
    console.log(`Mr. ${recipient} voted for ${UserResponse}`);
}

respond("Luke Skywalker",UserResponse.Yes);

//Computed and constant members

enum FileAccess {
    //constant members
    None,
    Read = 1 << 1,
    Write = 1 << 2,
    ReadWrite = Read | Write,
    //computed member
    nameLenght = "raviraj".length,
}



//classes

class Greeter {
    greeting: string;

    constructor(message: string) {
        this.greeting = message;
    }

    greet():string {
        return "hello " + this.greeting;
    }
}

let greeter = new Greeter("world");

console.log(greeter.greet());




//
class Point {
    x:number;
    y:number;
    z?:number;


    location():void {
        console.log(`your geo coordinate are  ${this.x} latitude ${this.y} longitude`);
    }
}

let pt = new Point();
pt.x = 23.72;
pt.y = 72.6;

pt.location();

// pt.x = "0" throw error as   -->Type 'string' is not assignable to type 'number'.



class GreeterG {
    readonly name:string = "world";

    constructor(othername?:string) {
        if(othername !== undefined) {
            this.name = othername;
        }
    }

    // err() {
    //     this.name = "not ok"
    // }

}

const g = new GreeterG();

// g.name = "also not ok"; --> thorw error as g.name is string only


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
    move(distanceInMeters: number = 0){
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
dog.move(10);
dog.bark();

const cat = new Cat();
cat.meow();
cat.meow();
cat.move(20);


//getter / setter

class C {
    _length = 0;
    get length() {
        return this._length;
    }

    set length(value) {
        this._length = value;
    }
}


//implement cluase

interface Pingable {
    ping():void;
}

class Sonar implements Pingable {
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
    woof(times:number){
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
    area(radius?:number) {
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



//abstract
//Classes and Members

abstract class BaseAbClass {
    abstract getName() : string;

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

function greet(person: { name: string; age: number }) {
    return "Hello " + person.name;
}


console.log(greet({name:"Raviraj",age:21}));

//the above approach with interface

interface Person {
    name:string;
    age:number;

    //optional properties
    readonly contactNumber ?: number;
}

function greetWithInterface(person:Person) {
    person.contactNumber ? console.log("calling u") : console.log(" calling not avaialable") ;
    return "Hello" + person.name;
}

console.log(greetWithInterface({name:"Raviraj",age:21}));




//interface

interface Pointinterface {
    x:number;
    y:number;
}

function printCoord(pt: Pointinterface) {
    console.log(`your geo coordinate are  ${pt.x} latitude ${pt.y} longitude`);
}

printCoord({x:100,y:100});


//type alias are similar to interface with like

//but interface can reopened to add property

interface Animal {
    name:string;
}

type Animal2 = {
    name:string;
}

//adding property lifespan

interface Animal {
    lifespan:number;
}

// type Animal2 {
//     lifespan:number;
// }
//above code throw error as we cannot reopen a type alias


//extending the interface

interface Address {
    name ?: string;
    street : string;
    city : string;
    country : string;
    postalCode : string;
}

//for interface with home number

interface AddressWithHomeNumber extends Address {
    homeNumber : number;
}

//union and intersection

var phoneNumber : string | number;

// | signifies a union between type string and number
//which means a phone number can reprsented using a string or number


//intersection

interface Height {
    height : number;
}

interface Weight {
    weight : number;
}

type peronsPhysics = Height & Weight;

