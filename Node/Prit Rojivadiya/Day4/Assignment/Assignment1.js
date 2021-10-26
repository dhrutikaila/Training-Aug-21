/* 1. .Write a Nodejs server that listen on port 3001 and which will read person.json 
and return a response in JSON format.
*/

const fs = require('fs');
const http = require('http');

const server = http.createServer((req,res)=>{
    if(req.url == '/'){
        fs.readFile('./person.json',"utf-8",(err,data)=>{
            res.end(data);
        })
    }
})

server.listen(3001,"localhost",()=>{
    console.log('listening to port 3001');
})