//Data annotation

var age : number=12;
var names : string = 'Shreya';
var isUpdated : boolean = true;

console.log(age +' '+ names +' '+ isUpdated);

//numbers

var first : number =123;
var second: number = 0x37CF;
var third : number = 0o377;
var fourth: number = 0b111001;

console.log(first);
console.log(second);
console.log(third);
console.log(fourth);

//number properties 

 console.log( "Maximum"+Number.MAX_VALUE);
 console.log( "Minimum"+Number.MIN_VALUE);

 //Methods
 var num1  : number = 2525.30 ;
 console.log(num1.toExponential());

 //tofixed method
 var num2 : number = 237.961 ;
console.log(num2.toFixed(1)) 
console.log(num2.toFixed(2)) 
console.log(num2.toFixed(5))

//toLocaleString method
var num3 = 552322.2375;
console.log(num3.toLocaleString());
console.log(num3.toLocaleString("fr-FR"));
console.log(num3.toLocaleString("en-US"));
console.log(num3.toLocaleString("nl-NL"));
console.log(num3.toLocaleString("de-DE"));

//toprecision
var num4 = new Number(1.9365);
console.log(num4.toPrecision(1));
console.log(num4.toPrecision(2));
console.log(num4.toPrecision(3));
console.log(num4.toPrecision(4));
console.log(num4.toPrecision(5));
console.log(num4.toPrecision(6));

//tostring 
var num5 = new Number(26); 
console.log(num5.toString()); 
console.log("Binary " +num5.toString(2)); 
console.log("Octal " +num5.toString(8));
console.log("Hexa-decimal " +num5.toString(16));

//valueof 

var num6=new Number(1212);
console.log(num6.valueOf());

//void 
function a() :void
{ 
    console.log('Hi!')
} 

var b : void= a(); 
console.log(b); //Output: undefined

//template string 

var FirstName : string= "Shreya";
var LastName : string="Thakkar";
var FullName : string= `Full name is ${FirstName} ${LastName}`
console.log(FullName)

//string methods 

//charAt 
var str : string = "C# learning";
console.log(str.charAt(0));
console.log(str.charAt(1));
console.log(str.charAt(2));  
console.log(str.charAt(3)); 
console.log(str.charAt(4)); 

//concat
var str1 : string  = "Thakkar"
var res: string = str.concat(str1);
console.log(res);

//indexof

var str2 :string = "TypeScript Learning JavaScript Learning"
console.log(str2.indexOf("JavaScript")); 
console.log(str2.indexOf("Learning")); 
console.log(str2.indexOf("Learning",20)); 

//replace 
var str3 = "c# and node & react trainees";
console.log(str3.replace("&","and"))

var str3 = "c# 20 trainees and node 15 trainees and React 21 trainees";
console.log(str3.replace(/\d+/,"21"))
console.log(str3.replace(/\d+/g,"12"))
console.log(str3.replace(/(\d+)([^\d]+)(\d+)/g,"$3$2$1"))

//split

var str4 = "Node trainees , c# trainees , React trainees";
console.log(str4.split(",",2));

//toUpperCase
var str5 = "Node trainees";
console.log(str5.toUpperCase());

//tolowercase
console.log(str5.toLowerCase());

//charCodeAt
var str6 = "Shreya"
console.log("index 0"+str6.charCodeAt(0))
console.log("index 1"+str6.charCodeAt(1))
console.log("index 2"+str6.charCodeAt(2))
console.log("index 3"+str6.charCodeAt(3))
console.log("index 4"+str6.charCodeAt(4))
console.log("index 5"+str6.charCodeAt(5))
console.log("index 6"+str6.charCodeAt(6))

//codePointAt

//include
//endsWit
//lastInd6xOf
var str7 = new String("Node trainees and c# trainees")
console.log(str7.lastIndexOf("trainees"))
console.log(str7.lastIndexOf("c#"))
//localeCampare
//match
//normalize
//padEnd
//padStart
//repeat
//search
//slice
//startswith
//substr
//array

var color :string [] = ['red', 'white', 'yellow']; 
console.log(color[0])

//using generic type
var color :Array<string> = ['red', 'white', 'yellow']; 
var id :Array<number> = [1,2,3,4];

//multi type array

let values:(string|number)[] = ["Shreya",1,"Diya",2]
//accessing element
console.log(values[0])
console.log(values[1])
console.log(values[2])
console.log(values[3])

//using for loop

for(var index in color){
    console.log(color[index])
}

//for of loop
for(var index1 of values){
    console.log(index1)
}

//array methods
var colors: Array<string> = ['Yellow', 'Red', 'Blue','Black','Pink']; 
colors.sort(); 
console.log(colors);

//pop
colors.pop();//last element will be delete
console.log(colors)
//push
colors.push('Purple');//Add element 
console.log(colors)

colors=colors.concat(['Green','White']); // it will merge two array
console.log(colors)

