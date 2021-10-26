// 1. Create one txt file name it as person.txt and write in that hello world

let fs = require('fs');
let inquirer = require('inquirer');
let chalk = require('chalk');

var questions = [
    {
        type: 'input',
        name: 'data',
        message: "write in file"
    }   
];

inquirer.prompt(questions).then(answers => {
    fs.writeFile("./person.txt",answers['data'],(err) =>{
        if(err){
            return console.log(err);        
        }
        console.log(chalk.bgRedBright(chalk.yellowBright("saved")));
    })
});