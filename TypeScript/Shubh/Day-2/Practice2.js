// ie: 1 class
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var Greeter = /** @class */ (function () {
    function Greeter(message) {
        this.greeting = message;
    }
    Greeter.prototype.greet = function () {
        return "Welcome " + this.greeting;
    };
    return Greeter;
}());
var greeter = new Greeter("to Jumanji!");
console.log(greeter.greet());
// ie: 2 class
var Point = /** @class */ (function () {
    function Point() {
    }
    Point.prototype.person = function () {
        console.log("Your name is: ".concat(this.x, "\nYour age is: ").concat(this.y));
    };
    return Point;
}());
var pt = new Point();
pt.x = "Shubh";
pt.y = 22;
pt.person();
// ie: 3 Abstract Classes and Members
var BaseAbClass = /** @class */ (function () {
    function BaseAbClass() {
    }
    BaseAbClass.prototype.printName = function () {
        console.log("Hello, " + this.getName() + "COngratulations for winning 2020-2021's Balon D'Or");
    };
    return BaseAbClass;
}());
var DerivedAbClass = /** @class */ (function (_super) {
    __extends(DerivedAbClass, _super);
    function DerivedAbClass() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    DerivedAbClass.prototype.getName = function () {
        return "Leo Messi";
    };
    return DerivedAbClass;
}(BaseAbClass));
var b = new DerivedAbClass();
b.printName();
//Computed and constant members
var FileAccess;
(function (FileAccess) {
    //constant members
    FileAccess[FileAccess["None"] = 0] = "None";
    FileAccess[FileAccess["Read"] = 2] = "Read";
    FileAccess[FileAccess["Write"] = 4] = "Write";
    FileAccess[FileAccess["ReadWrite"] = 6] = "ReadWrite";
    //computed member
    FileAccess[FileAccess["nameLength"] = "Shubh".length] = "nameLength";
})(FileAccess || (FileAccess = {}));
//constructor
var Point2 = /** @class */ (function () {
    function Point2(x, y) {
        if (x === void 0) { x = 0; }
        if (y === void 0) { y = 0; }
        this.x = x;
        this.y = y;
    }
    return Point2;
}());
//class inheritance
var Animal = /** @class */ (function () {
    function Animal() {
    }
    Animal.prototype.moving = function (distanceInMeters) {
        if (distanceInMeters === void 0) { distanceInMeters = 0; }
        console.log("Animal moved ".concat(distanceInMeters));
    };
    return Animal;
}());
var Dog = /** @class */ (function (_super) {
    __extends(Dog, _super);
    function Dog() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Dog.prototype.bark = function () {
        console.log("Woof! Woof!");
    };
    return Dog;
}(Animal));
var Cat = /** @class */ (function (_super) {
    __extends(Cat, _super);
    function Cat() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Cat.prototype.meow = function () {
        console.log("meow! meow");
    };
    return Cat;
}(Animal));
var dog = new Dog();
dog.bark();
dog.moving(10);
dog.bark();
var cat = new Cat();
cat.meow();
cat.moving(20);
cat.meow();
var Sonar = /** @class */ (function () {
    function Sonar() {
    }
    Sonar.prototype.ping = function () {
        console.log("Ping! Ping!");
    };
    return Sonar;
}());
// Extending clause, Classes may extend from a base class. A derived class has all the properties and methods of its base class, and also define additional members.
var Pet = /** @class */ (function () {
    function Pet() {
    }
    Pet.prototype.move = function () {
        console.log("On walk");
    };
    return Pet;
}());
var Doggy = /** @class */ (function (_super) {
    __extends(Doggy, _super);
    function Doggy() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Doggy.prototype.woof = function (times) {
        for (var i = 0; i < times; i++) {
            console.log("Woof! ");
        }
    };
    return Doggy;
}(Pet));
var Tiger = /** @class */ (function (_super) {
    __extends(Tiger, _super);
    function Tiger() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Tiger.prototype.roar = function (times) {
        for (var i = 0; i < times; i++) {
            console.log("Roarrr ");
        }
    };
    return Tiger;
}(Pet));
var doggy = new Doggy();
doggy.move();
doggy.woof(5);
var tigress = new Tiger();
tigress.move();
tigress.roar(6);
//overriding methods
var Shape = /** @class */ (function () {
    function Shape() {
    }
    Shape.prototype.area = function () {
        return 0;
    };
    return Shape;
}());
var Circle = /** @class */ (function (_super) {
    __extends(Circle, _super);
    function Circle() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Circle.prototype.area = function (radius) {
        return 3.14 * radius * radius;
    };
    return Circle;
}(Shape));
var c = new Circle();
console.log(c.area(2));
//super keyword runs constructor of parent class
var Base = /** @class */ (function () {
    function Base() {
        console.log("Parent says hi!");
    }
    return Base;
}());
var Child = /** @class */ (function (_super) {
    __extends(Child, _super);
    function Child() {
        var _this = _super.call(this) || this;
        console.log("Hello Parent this is child!");
        return _this;
    }
    return Child;
}(Base));
//access modifiers
//public : defualt visibility modifies of class
//protected : only visiable to subclass
//private: restrict access to the members even for a subclass
var BaseClass = /** @class */ (function () {
    function BaseClass() {
        console.log("x : ".concat(this.x, "\n        y : ").concat(this.y, "\n        z : ").concat(this.z));
    }
    return BaseClass;
}());
var Derived = /** @class */ (function (_super) {
    __extends(Derived, _super);
    function Derived() {
        var _this = _super.call(this) || this;
        console.log("x : ".concat(_this.x, "\n        y : ").concat(_this.y));
        return _this;
        //this.z throw erro as z is private members and can only be acces inside Base class
    }
    return Derived;
}(BaseClass));
var derivedInstance = new Derived();
console.log(derivedInstance.x); //return 2
// console.log(derivedInstance.y); //throw error
// console.log(derivedInstance.z); //throw error
//static members : Classes may have static members. These members aren’t associated with a particular instance of the class
var MyClass = /** @class */ (function () {
    function MyClass() {
    }
    MyClass.printX = function () {
        console.log(MyClass.x);
    };
    MyClass.x = 0;
    return MyClass;
}());
console.log(MyClass.x);
MyClass.printX();
//special static names
//certain static names can't be used. Function properties like name,length,call aren't valid to define as Static members.
//static blocks
//Static blocks allow you to write a sequence of statements with their own scope that can access private fields within the containing class.
// Object Types
//In JavaScript, the fundamental way that we group and pass around data is through objects. In TypeScript, we represent those through object types.
function greet(person) {
    return "Hello " + person.name;
}
console.log(greet({ name: "Shubh", age: 22 }));
function greetWithInterface(person) {
    return "Hello" + person.name;
}
console.log(greetWithInterface({ name: "Shubh", age: 21, sports: "Football" }));
