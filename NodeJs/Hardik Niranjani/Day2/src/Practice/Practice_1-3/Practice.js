//  Create one txt file name it as person.txt and write in that hello world
const fs = require('fs');
fs.writeFile("person.text","Hello World", function(err){
    if(err){
        console.log(err);
    }
});

// Append hello India in person.txt.

fs.appendFile("person.text","Hello India", function(err){
    if(err){
        console.log(err);
    }
});

// Accept your name from command line. And append it to person.txt as “hello “+“name”.

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
  })
  
  readline.question(`What's your name?`, name => {
    fs.appendFile("person.text",`${name}`, function(err){
        if(err){
            console.log(err);
        }
    });
    readline.close()
  });