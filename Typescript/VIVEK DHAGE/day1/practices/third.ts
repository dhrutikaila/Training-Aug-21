// function sum1(a:any, b:any){
//     return a+b;
// }

// console.log(sum1(3,5));

var arr:number[] = [1,2,3];
console.log(arr);

for(var i in arr){
    console.log(arr[i]);
}


var fruits:string[]= ['apple','banana','orange','kiwi'];

var res = fruits.filter((fruits,i)=>
    {
        return fruits.length>2
    });

    console.log(res);



//split method
var str = "one two three four"; 
var splitted = str.split(" ,", 3); 
console.log(splitted)


    //tuple

    var mytuple = [10,"Hello","World","hi"]; 
 
mytuple[0] = 120 ;
mytuple[1] = 234;

console.log(mytuple);

console.log("Items before push "+mytuple.length)    // size returns

mytuple.push(12)                                    // append value to the tuple 

console.log("Items after push operation"+mytuple.length) 
console.log("Items before pop operation"+mytuple.length)

console.log(mytuple.pop()+" popped from the tuple") // removes the data
  
console.log("Items after pop operation"+mytuple.length);

