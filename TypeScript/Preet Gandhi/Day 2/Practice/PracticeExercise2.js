"use strict";
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
exports.__esModule = true;
//import class 
var PracticeExercise_1 = require("./PracticeExercise");
//inheritance
var Cat = /** @class */ (function (_super) {
    __extends(Cat, _super);
    function Cat(name) {
        return _super.call(this, name) || this;
    }
    Cat.prototype.move = function (distanceInMeters) {
        if (distanceInMeters === void 0) { distanceInMeters = 5; }
        console.log("Meow...");
        _super.prototype.move.call(this, distanceInMeters);
    };
    return Cat;
}(PracticeExercise_1.Animal));
var Horse = /** @class */ (function (_super) {
    __extends(Horse, _super);
    function Horse(name) {
        return _super.call(this, name) || this;
    }
    Horse.prototype.move = function (distanceInMeters) {
        if (distanceInMeters === void 0) { distanceInMeters = 100; }
        console.log("Galloping...");
        _super.prototype.move.call(this, distanceInMeters);
    };
    return Horse;
}(PracticeExercise_1.Animal));
var sam = new Cat("Sam");
sam.move();
var tom = new Horse("Tom");
tom.move();
//---------------------------------------------------------------
console.log("-------------------------------------------");
//INTERFACES
var Employee4 = /** @class */ (function () {
    function Employee4(code, name) {
        this.empCode = code;
        this.name = name;
    }
    Employee4.prototype.getSalary = function (empCode) {
        return 20000;
    };
    return Employee4;
}());
var emp = new Employee4(5, "Jason");
console.log(emp.getSalary(20000));
