// FileName :dog.ts 
/// <reference path = "animal.ts" /> 
var Animal;
(function (Animal) {
    var dog = /** @class */ (function () {
        function dog() {
        }
        dog.prototype.sound = function () {
            console.log("Circle is drawn");
        };
        return dog;
    }());
    Animal.dog = dog;
})(Animal || (Animal = {}));
