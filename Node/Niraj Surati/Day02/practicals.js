// 1. Create one txt file name it as person.txt and write in that hello world

let fs = require('fs');
let inquirer = require('inquirer');



var questions2 = [
    {
        type: 'input',
        name: 'data',
        message: "append in file"
    }   
];

function writeFile(){
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
            throw err;        
        }
        console.log("saved");
    })
    });
}

function appendFile(){
    return () =>{
    var questions = [
        {
            type: 'input',
            name: 'data',
            message: "append in file"
        }   
    ];
    
    inquirer.prompt(questions2).then(answers => {
        
        fs.appendFile("./person.txt",answers['data2'],(err) =>{
            if(err){
                throw err;        
            }
            console.log("appended");
        })
    });
    }
}   

async function allFun(){
    let a = await writeFile();
    await appendFile();
}

allFun();