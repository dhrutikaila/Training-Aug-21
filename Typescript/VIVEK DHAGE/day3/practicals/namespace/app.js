// FileName :dog.ts 
/// <reference path = "animal.ts" /> 
var Animal;
(function (Animal) {
    var dog = /** @class */ (function () {
        function dog() {
        }
        dog.prototype.sound = function () {
            console.log("woof woof");
        };
        return dog;
    }());
    Animal.dog = dog;
})(Animal || (Animal = {}));
// FileName :Triangle.ts 
/// <reference path = "animal.ts" /> 
var Animal;
(function (Animal) {
    var cat = /** @class */ (function () {
        function cat() {
        }
        cat.prototype.sound = function () {
            console.log("Meow Meow");
        };
        return cat;
    }());
    Animal.cat = cat;
})(Animal || (Animal = {}));
// FileName : TestShape.ts 
/// <reference path = "animal.ts" />   
/// <reference path = "dog.ts" /> 
/// <reference path = "cat.ts" />  
function AllAnimal(play) {
    play.sound();
}
AllAnimal(new Animal.dog());
AllAnimal(new Animal.cat());
