// Create person.txt file.
const fs = require('fs');
fs.writeFile("person.txt","Dummy Text", function(err){
    if(err){
        console.log(err);
    }
});


// Remove person.txt file.
fs.unlink("person.txt", function(err){
    if(err){
        console.log(err);
    }
});