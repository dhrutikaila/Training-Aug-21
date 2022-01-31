"use strict";
exports.__esModule = true;
exports.Animal = void 0;
//CLASSES
//Creating a simple class
var Employee = /** @class */ (function () {
    function Employee(code, name) {
        this.empCode = code;
        this.empName = name;
    }
    Employee.prototype.getSalary = function () {
        return 10000;
    };
    return Employee;
}());
var emp = new Employee(10, "Hiren Panchal");
console.log(emp.getSalary());
//--------------------------------------------------------------------
console.log("-------------------------------------------");
//Animal Class for inheritance
var Animal = /** @class */ (function () {
    function Animal(theName) {
        this.name = theName;
    }
    Animal.prototype.move = function (distanceInMeters) {
        if (distanceInMeters === void 0) { distanceInMeters = 0; }
        console.log("".concat(this.name, " moved ").concat(distanceInMeters, " meters"));
    };
    return Animal;
}());
exports.Animal = Animal;
//----------------------------------------------------------------------
console.log("-------------------------------------------");
//Modifiers
//Public
var Animal2 = /** @class */ (function () {
    function Animal2(theName) {
        this.name = theName;
    }
    Animal2.prototype.move = function (distanceInMeters) {
        if (distanceInMeters === void 0) { distanceInMeters = 0; }
        console.log("Animal moved ".concat(distanceInMeters, " meters"));
    };
    return Animal2;
}());
//Private
var Employee2 = /** @class */ (function () {
    function Employee2() {
        this.empCode = 5;
        this.empName = "Hitesh";
    }
    return Employee2;
}());
var emp2 = new Employee2();
// console.log(emp2.empCode);  //Can not access due to private 
console.log(emp2.empName);
//-----------------------------------------------------------
console.log("-------------------------------------------");
//Readonly
var Octopus = /** @class */ (function () {
    function Octopus(theName) {
        this.numberOfLegs = 10;
        this.name = theName;
    }
    return Octopus;
}());
var octo = new Octopus("octo");
// octo.name = "Oct"; //Can not change name due to readonly
console.log(octo);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");
//FUNCTIONS
//Creating simple function
function add(x, y) {
    return x + y;
}
console.log(add(4, 5));
//-----------------------------------------------------------
console.log("-------------------------------------------");
//this keyword and Arrow function
var Employee3 = /** @class */ (function () {
    function Employee3(code, name) {
        var _this = this;
        this.display = function () { return console.log("Code of ".concat(_this.empName, " is ").concat(_this.empCode)); };
        this.empCode = code;
        this.empName = name;
    }
    return Employee3;
}());
var emp3 = new Employee3(5, "Jayesh");
emp3.display();
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");
//ENUMS
//numeric enum (Starts with 1 index)
var Direction;
(function (Direction) {
    Direction[Direction["Up"] = 1] = "Up";
    Direction[Direction["Dowm"] = 2] = "Dowm";
    Direction[Direction["Left"] = 3] = "Left";
    Direction[Direction["Right"] = 4] = "Right";
})(Direction || (Direction = {}));
console.log(Direction.Right);
//string enum
var PrintMedia;
(function (PrintMedia) {
    PrintMedia["NewsPaper"] = "NewsPaper";
    PrintMedia["NewsLetter"] = "NewsLetter";
    PrintMedia["Magazine"] = "Magazine";
    PrintMedia["Book"] = "Book";
})(PrintMedia || (PrintMedia = {}));
console.log(PrintMedia.Book);
//Heterogeneous Enum
var Status;
(function (Status) {
    Status["Active"] = "Active";
    Status[Status["Disable"] = 0] = "Disable";
    Status[Status["Pending"] = -1] = "Pending";
})(Status || (Status = {}));
console.log(Status.Pending);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
console.log("+++++++++++++++++++++++++++++++++++++++++++");
//TUPLES
//simple tuple
var personDetails;
personDetails = ["Hiren", 34, "Male", true];
console.log("Is Hiren Married?: ".concat(personDetails[3]));
//Tuple array
var tupleArray;
tupleArray = [[1, "Het"], [2, "Jeet"], [3, "Meet"]];
console.log(tupleArray[1][1]);
