var x =5 ;
var y = 6 ;
console.log(x);
 
// in javascript + is use for cancat in string and arithmetic both

console.log(x + y);

x = x + 5;
console.log(x);
 
//one statement with many variable

var x = 10 , color = "Blue" , product = "Shirt";

console.log('name is '+ product)

//if we can not assign the value it will return undefined

var b ;
console.log(b)
 
//concat string by using + operator

var y = "Shreya " + "Thakkar"
console.log("full name is "+y)

//if we pass number as a string 
//if we put one number as a string then any other number will also treated as a string 

var num = "12" + 12 + 12
console.log(num)

//datatypes

var no = 1 ; // number data type
var fname = "shreya" //string data type
var z ={
    fname : "Shreya",
    lname : "thakkar"
}; //object


//when we add a number to string it is treated as a string

console.log(16+"abc")

//javascript evaluates the expression left to right 
//for left to right it will add the number and concat the string 

console.log(1+2+"xyz")

//for right to left : the number is treated as a string 

console.log("xyz" + 11 + 12)

var n1 = 12;
var n2 = 11;

console.log(n1 == n2)

//array in javascript 

var fruit = ['banana','mango','apple'] //array
console.log(fruit[1])

//typeof return the type of the var 

console.log(typeof "shreya")
console.log(typeof 1)

//function practice 

function myFun(n1,n2){
    return n1*n2;
}
var c = myFun(3,4)
console.log("Multiplication of two number is "+c)

//try to access local variable outside the function
myFunc();
function myFunc(){
    let color="blue";
    console.log("inside the function " + color)
}

console.log(typeof color)

//conditional statement

var h = 10;
if (h > 5)
{
    console.log("h is greater than 5")
}
else
{
    console.log("h is smaller than 5")
}

//for loop

for (var i =0; i< 10 ;i++)
{
   console.log(i) 
}

var color = ["red","blue","pink","black"]
for(var i=0;i < color.length ; i++){
    console.log(color[i])
}

//for in loop

var student = {
    fname : "shreya",
    lname : "thakkar"
}
for (var i in student){
    console.log("Student full name is "+ student[i])
}

//while loop
var i =0 ;
while (i < 10){
    console.log("no " + i);
    i++;
}

//creating an array 
//1st way
var color = ["blue","red","black","yellow","white"]
console.log(color[2])

//also create arr and then provide the value

var color = [];
color[0]="blue";
color[1]="purple"

//by using javascript new keyword

var colors = new Array("blue","red","black","yellow","white")

//changing the element
var color = ["blue","red","black","yellow","white"]
console.log(color[2])
color[2] = "Pink";
console.log("Changed color is "+color[2])

console.log(typeof color)
console.log(color.length)
console.log(color[color.length - 1]) // accessing last element

color.push("violet") //add element in the array
console.log(color)



