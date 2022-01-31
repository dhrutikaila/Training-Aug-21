// Enum
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
var Category;
(function (Category) {
    Category[Category["Biography"] = 0] = "Biography";
    Category[Category["poetry"] = 1] = "poetry";
    Category[Category["Fiction"] = 2] = "Fiction";
})(Category || (Category = {}));
; // 0,1,2
(function (Category) {
    Category[Category["Biography1"] = 1] = "Biography1";
    Category[Category["poetry1"] = 2] = "poetry1";
    Category[Category["Fiction1"] = 3] = "Fiction1";
})(Category || (Category = {}));
; //1,2,3
(function (Category) {
    Category[Category["Biography2"] = 5] = "Biography2";
    Category[Category["poetry2"] = 8] = "poetry2";
    Category[Category["Fiction2"] = 10] = "Fiction2";
})(Category || (Category = {}));
; // 5,8,10
var FavCategory = Category.Biography;
console.log(FavCategory);
// category string
var categoryString = Category[FavCategory];
console.log(categoryString);
// Array
// declaration_1
var strArrar1 = ['str1', 'str2', 'str3'];
// declaration_2
var strArrar2 = ['str2', 'str3'];
// declaration_3
var strArray3 = [23, 'str', true];
// Tuples
var myTuples = [25, 'truck'];
var firstElement = myTuples[0]; // 25
var secondElement = myTuples[1]; //'truck'
console.log(firstElement);
console.log(secondElement);
// Union
/**
 * Takes a string and adds "padding" to the left.
 * If 'padding' is a string, then 'padding' is appended to the left side.
 * If 'padding' is a number, then that number of spaces is added to the left side.
 */
function padLeft(value, padding) {
    if (typeof padding === "number") {
        return Array(padding + 1).join(" ") + value;
    }
    if (typeof padding === "string") {
        return padding + value;
    }
    throw new Error("Expected string or number, got '".concat(typeof padding, "'."));
}
// classes
var Greeter = /** @class */ (function () {
    function Greeter(message) {
        this.greeting = message;
    }
    Greeter.prototype.greet = function () {
        return "Hello, " + this.greeting;
    };
    return Greeter;
}());
var greeter = new Greeter("world");
// Inheritance
var Animal = /** @class */ (function () {
    function Animal() {
    }
    Animal.prototype.move = function (distanceInMeters) {
        if (distanceInMeters === void 0) { distanceInMeters = 0; }
        console.log("Animal moved ".concat(distanceInMeters, "m."));
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
var dog = new Dog();
dog.bark();
dog.move(10);
dog.bark();
var probablyDuck = {
    walk: function () { return console.log("walking like a duck"); },
    swim: function () { return console.log("swim like a duck"); },
    quack: function () { return console.log("quack like a duck"); }
};
function FlyOverWater(bird) { }
FlyOverWater(probablyDuck);
// function
// add types
// declaration_1
function add(x, y) {
    return x + y;
}
// declaration_2 - Anonymous function 
var myAdd = function (x, y) {
    return x + y;
};
