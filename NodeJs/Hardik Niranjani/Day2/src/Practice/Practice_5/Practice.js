// Write your address in one txt file and find out how many consonants are there.

const fs = require('fs');

yfs.writeFile("address.txt","Near garden, Ramnagar, Street no-02,Bhayavadar", function(err){
    if(err){
        console.log(err);
    }
});

fs.readFile("address.txt","utf8", function(err,data){
    if(err){
        console.log(err);
    }
    console.log(data);
    var count = 0;
    for(let i=0; i<data.length; i++){
        if(data[i] !== "a" && data[i] !== "e" && data[i] !== "i" && data[i] !== "o" && data[i] !== "u"){
            count++;
        }
    }
    console.log(count);
})


