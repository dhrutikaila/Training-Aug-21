var name1='piyush';
var name2='mihir';
var name3='yash';
var name4='harsh';
var greetText='Good Morning'
console.log(name1+" is a good boy");
console.log(name2+" is a good boy");
console.log(name3+" is a good boy");
console.log(name4+" is a good boy");


function greet(name='enter your name',greetText='js default values') {
    console.log(greetText+"  "+name);
    console.log(name+" is a good boy");
}

greet(name1,greetText)
greet(name2,greetText)
greet(name3,greetText)
greet(name4,greetText)
greet()



function sum(a,b) {
    var c=a+b;
    return c;
}

var ans =sum(2,3)
console.log(ans);


