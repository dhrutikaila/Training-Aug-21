// dotenv
require("dotenv").config({path: '../.env'});

console.log(process.env.Host);
console.log(process.env.Port);

// fs module
const fs = require("fs");

fs.writeFile("demo.txt","this is demo file",(error)=>{
    console.log('file created');
})

fs.appendFile("demo.txt","Text added",(error)=>{
    console.log("text appended");
})

fs.readFile("demo.txt","utf-8",(error,data)=>{
    console.log(data);
})

fs.readFile("demo.txt",(error,data)=>{
    console.log(data);
})

fs.rename("demo.txt","demo1.txt",(error)=>{
    console.log("file renamed")
});

fs.unlink("demo1.txt",()=>{
    console.log('file deleted')
})



// accepting arguments from commandline

process.argv.forEach((val, index) => {
    console.log(`${index}: ${val}`)
  })

const args = process.argv.slice(2);
console.log(args[0]); 
// console.log(args[0].split('=')[1]); 

const args1 = require('minimist')(process.argv.slice(2));
console.log(args1['_']);
console.log(args1['name']);


// accept input from commandline

/*
const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
  })
  
  readline.question(`What's your name?`, name => {
    console.log(`Hi ${name}!`)
    readline.close()
  })
*/


var rl = require('readline').createInterface(
        process.stdin, process.stdout);
  
rl.setPrompt(`What is your age? `);
rl.prompt();
rl.on('line', (age) => {
    console.log(`Age received by the user: ${age}`);
    // rl.close();
});


rl.on('SIGINT', () => {
    rl.question('Exit (y or n)? ', (input) => {
      if (input.match(/^y(es)?$/i)) { rl.pause(); }
    });
});

/*
  const inquirer = require('inquirer')

  var questions = [
    {
      type: 'password',
      name: 'name',
      message: "What's your name?"
    }
  ]
  
  inquirer.prompt(questions).then(answers => {
    console.log(`Hi ${answers['name']}!`)
  })
  */
  
  
  // process module


  process.on('beforeExit', (code) => {
    console.log('Process beforeExit event with code: ', code);
  });
  
  process.on('exit', (code) => {
    console.log('Process exit event with code: ', code);
  });
  
  console.log('This message is displayed first.');