// 7. Create one folder files and move person.txt in that file.

let fs = require('fs');
let chalk =  require('chalk');


fs.access('person',(err) =>{
    if(!err){
        console.log(chalk.red("folder already exists"));
    }else{
        fs.mkdir('person',(err) =>{
            if(err){
                throw err;
            }
            console.log(chalk.green("folder created!"))
        });    
    }
});


fs.access("person.txt", (err) => {
    if(err){
        console.log(chalk.red("File does not exist."));
    }else{
    fs.rename("person.txt", "person/person.txt", (err) => {
        if(err){
            throw err;
        }
        console.log(chalk.green("File moved successfully."));
    });
    }
});