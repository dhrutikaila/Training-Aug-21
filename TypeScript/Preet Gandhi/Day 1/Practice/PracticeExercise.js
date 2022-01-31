//Datatypes 
//1)Number
var age = 44;
console.log(age);
//2)String
var PersonName = "Hiren";
console.log(PersonName);
//3)Boolean
var bool = true;
console.log(bool);
//Number Methods
//1)toExponential()
var num1 = 5.3735;
console.log(num1.toExponential(2));
//2)toFixed()
var num2 = 3.45454;
console.log(num2.toFixed(3));
//3)toLocaleString()
var num3 = 4.435745;
console.log(num3.toLocaleString());
//4)toPrecision()
var num4 = 2.56445;
console.log(num4.toPrecision(4));
//Template String
var FirstName = "Hiren";
var LastName = "Panchal";
var FullName = "Firstname is: ".concat(FirstName, " and Lastname is: ").concat(LastName);
console.log(FullName);
//String Method
//1)CharAt()
var char = "Hiren";
console.log(char.charAt(1));
//2)concat()
console.log(FirstName.concat(" ", LastName));
//3)indexOf()
var str = "We are learning indexOf() method in TypeScript";
console.log(str.indexOf("method", 20));
//4)split()
var splitStrting = str.split(" ");
console.log(splitStrting);
//5)ToUpperCase()
var str2 = "Hello";
console.log(str2.toUpperCase());
//5)ToLowerCase()
var str3 = "WORLD";
console.log(str3.toLowerCase());
//6)Slice
var res = str.slice(0, 15);
console.log(res);
//7)substr()
console.log(str.substr(16, 45));
//8)sunString()
console.log(str.substring(7, 15));
//any Datatype
var anyType = "Hello";
anyType = 55;
anyType = true;
//Array
var arr = ["Hello", "World", 4, 5, 3, "Typescript"];
for (var index in arr) {
    console.log(arr[index]);
}
for (var _i = 0, arr_1 = arr; _i < arr_1.length; _i++) {
    var value = arr_1[_i];
    console.log(value);
}
//Array Methods
//push()
arr.push(10);
console.log(arr);
//pop()
arr.pop();
console.log(arr);
//sort()
console.log(arr.sort());
//indexOf()
console.log(arr.indexOf(5));
//unshift()
arr.unshift("Hiii");
console.log(arr);
//shift()
arr.shift();
console.log(arr);
//filter()
var newArray = arr.filter(function (arr, i, arr2) {
    return arr >= 5;
});
console.log(newArray);
