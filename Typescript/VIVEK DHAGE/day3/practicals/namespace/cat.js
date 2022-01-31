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
