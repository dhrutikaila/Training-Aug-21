//tuples

var tuple_one = []; 
tuple_one[0] = 120 
tuple_one[1] = 234

var mytuple = [10,"Hello","there","one"]; 
console.log("Items before push operation"+mytuple.length) 
console.log(mytuple);  

mytuple[0] = 121     

mytuple.push(12)                                     
console.log("Items after push operation "+mytuple.length) 
console.log(mytuple);  
mytuple[0] = 121     

mytuple.pop()
console.log(" popped from the tuple") 
console.log("Items after pop "+mytuple.length)


var tup = [] 
tup[0] = 12 
tup[1] = 23 

console.log(tup[0]) 
console.log(tup[1])


var single =[10,"hello"] 
var [b,c] = single 
console.log( b )    
console.log( c ) 