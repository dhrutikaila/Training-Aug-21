//Datatypes 
//1)Number
var age: number = 44;
console.log(age);
//2)String
var PersonName: string = "Hiren";
console.log(PersonName);
//3)Boolean
var bool: Boolean = true;
console.log(bool);

//Number Methods
//1)toExponential()
var num1: number = 5.3735;
console.log(num1.toExponential(2));
//2)toFixed()
var num2: number = 3.45454;
console.log(num2.toFixed(3));
//3)toLocaleString()
var num3: number = 4.435745;
console.log(num3.toLocaleString());
//4)toPrecision()
var num4: number = 2.56445;
console.log(num4.toPrecision(4));


//Template String
var FirstName: string = "Hiren";
var LastName: string = "Panchal";
var FullName: string = `Firstname is: ${FirstName} and Lastname is: ${LastName}`;
console.log(FullName);

//String Method
//1)CharAt()
var char: string = "Hiren";
console.log(char.charAt(1));
//2)concat()
console.log(FirstName.concat(" ",LastName));
//3)indexOf()
var str: string = "We are learning indexOf() method in TypeScript";
console.log(str.indexOf("method",20));
//4)split()
var splitStrting: string[] = str.split(" ");
console.log(splitStrting);
//5)ToUpperCase()
var str2: string = "Hello";
console.log(str2.toUpperCase());
//5)ToLowerCase()
var str3: string = "WORLD";
console.log(str3.toLowerCase());
//6)Slice
var res: string = str.slice(0,15);
console.log(res);
//7)substr()
console.log(str.substr(16,16));
//8)sunString()
console.log(str.substring(7,15));

//any Datatype
var anyType: any = "Hello";
anyType = 55;
anyType = true;


//Array
var arr: (string | number)[]  = ["Hello", "World", 4, 5, 3, "Typescript"];
for(var index in arr)
{
    console.log(arr[index]);
}
for(var value of arr)
{
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
var newArray = arr.filter((arr,i,arr2) => {
    return arr >= 5
})
console.log(newArray);