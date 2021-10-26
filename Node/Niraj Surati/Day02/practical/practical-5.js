//5. Write your address in one txt file and find out how many consonants are there.

const fs = require('fs');
const inquirer = require('inquirer');
fs.readFile('./address.txt',(err,data) =>{
    if(err){
        throw err;
    }
    //let count = (strData) => (strData.match(/[aeiou]/gi)).length;
    //let count = (strData) => (strData.match(/[^aeiou0-9 ]/gi)).length;
    let count = (strData) => (strData.match(/[bcdfghjklmnpqrstvwxyz]/gi) || []).length;
    console.log(count(data.toString()));
});


