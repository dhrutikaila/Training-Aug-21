// Write a Nodejs server that serves as a RESTFUL API that accepts a string as an input name and returns the first vowel character from the string.

const http = require('http');
const url = require('url');
const fs = require('fs');
fs.createWriteStream

http.createServer(function(req,res){
    const urlPart = url.parse(req.url,true).query;
    const name = urlPart.input;

    for(let i=0;i<name.length;i++){
        if(name[i] == 'a'){
            res.write('a');
            res.end();
        }
        if(name[i]=='e'){
            res.write('e');
            res.end();
        }
        if(name[i]=='i'){
            res.write('i');
            res.end();
        }
        if(name[i]=='o'){
            res.write('o');
            res.end();
        }
        if(name[i]=='u'){
            res.write('u');
            res.end();
        }
    }
}).listen(3001)