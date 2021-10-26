// 3. Accept your name from command line. And append it to person.txt as “hello “+  your name

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