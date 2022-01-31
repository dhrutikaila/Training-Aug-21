// 1. Create one txt file name it as person.txt and write in that hello world

const fs = require('fs');

fs.writeFile('person.txt',"hello world",(error)=>{
    if(error){
        console.log(error);
    }else{
        console.log('file created')
    }
})

// 2. Append hello India in person.txt.

fs.appendFile("person.txt"," hello india",(error)=>{
    if(error){
        console.log(error)
    }else{
        console.log('text appended')
    }
})

// 3. Accept your name from command line. And append it to person.txt as “hello “+“name”.

const rl = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})

rl.question('what is your name?',(name)=>{
    fs.appendFile("person.txt",` hello ${name}`,(error)=>{
        if(error){
            console.log((error));
        }else{
            console.log('name appended')
        }
    })
    rl.close();
})

// 6. remove person.txt file

fs.unlink("person.txt",(error)=>{
    if(error){
        console.log(error);
    }else{
        console.log('file deleted')
    }
})

// 7. Create one folder files and move person.txt in that file.

fs.mkdir('files',(error)=>{
    if(error){
        console.log(error);
    }else{
        console.log('folder created');
    }
})

fs.rename("person.txt","./files/person.txt",(error)=>{
    if(error){
        console.log(error)
    }else{
        console.log('file moved')
    }
})