// 6.Remove person.txt file

let fs = require('fs');

fs.unlink('./person.txt', (err) =>{
    if(err){
        throw err;
    }
});