// Create two txt files, write some dummy text. Read two file content and print it in the console. use async and await.

const fs = require('fs');

// Create two txt files
fs.writeFile("file1.txt","File 1 text", function(err){
    if(err){
        console.log(err);
    }
});

fs.writeFile("file2.txt","File 2 text", function(err){
    if(err){
        console.log(err);
    }
});

// make function
function fun1(){
    fs.readFile("file1.txt","utf8",function(err, data){
        if(err){
            console.log(err);
        }
        console.log(data);
    })
   
}

function fun2(){
    fs.readFile("file2.txt","utf8",function(err, data){
        if(err){
            console.log(err);
        }
        console.log(data);
    })
    
}

// call it on other function with async await
async function fun3(){
    fun1();
    fun2();
    await fun1();
    fun2();
}


console.log(fun3());