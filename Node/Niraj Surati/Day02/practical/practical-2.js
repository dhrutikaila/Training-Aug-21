// 2. Append hello India in person.txt.

let fs = require('fs');
let inquirer = require('inquirer');

var questions = [
    {
        type: 'input',
        name: 'data',
        message: "append in file"
    }   
];

inquirer.prompt(questions).then(answers => {
        
    fs.appendFile("./person.txt",answers['data'],(err) =>{
        if(err){
            throw err;        
        }
        console.log("appended");
    })
});