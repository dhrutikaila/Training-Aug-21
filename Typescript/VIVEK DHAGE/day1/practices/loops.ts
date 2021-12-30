var n = 5;
while (n > 5) {
   console.log("hello");
}

do {
   console.log("again");
} while (n > 5);

var num:number;
for (num=1; num<=10; num++)  {  
    console.log(num); 
    }


    
var fruits:string[]= ['apple','banana','orange','kiwi'];

for(var i in fruits){
    console.log(fruits[i]);
}

fruits.forEach(function (item) {  
    console.log(item);  
});  






var exa1:number[]= [1,2,3,4,5,6];

var results = exa1.filter((exa1,i,arr)=>
    {
        return exa1>2
    });

    console.log(results);

