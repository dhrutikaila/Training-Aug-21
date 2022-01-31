//classes
var Car = /** @class */ (function () {
    function Car(engine) {
        this.engine = engine;
    }
    Car.prototype.disp = function () {
        console.log("this is method ");
    };
    return Car;
}());
var obj = new Car("porche");
console.log("accesssing field:  " + obj.engine);
obj.disp();
function calc(num1, num2) {
    if (num2 === void 0) { num2 = 0.50; }
    console.log("numbers are", num1, num2);
}
calc(1000);
calc(1000, 0.30);
//anonymous functions
var Ano_func = function () {
    return "hello admin";
};
console.log(Ano_func());
//with parameters
var sum = function (a, b) {
    return a + b;
};
console.log(sum(12, 2));
//constructor type function
var Reslut = new Function("a", "b", "return a * b");
var x = Reslut(4, 3);
console.log(x);
var subtract = new Function("x", "y", "return x-y");
var s = subtract(5, 2);
console.log(s);
//recursion in function
function fact(num) {
    if (num <= 0) {
        return 1;
    }
    else {
        return (num * fact(num - 1));
    }
}
;
console.log(fact(5));
