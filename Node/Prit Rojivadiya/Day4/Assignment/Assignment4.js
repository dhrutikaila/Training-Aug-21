/* Write a Nodejs server that serve as a RESTFUL API that accepts a file content and 
writes them to the disk. http://localhost:3001/upload */

const fs = require('fs');
const http = require("http");
const url = require('url');

http.createServer((req,res)=>{
    if(req.url == '/'){
        res.end('home page');
    }else{
        console.log(req.url.slice(1))
        const q = url.parse(req.url,true);
        console.log(q.path);
        if(req.url != '/favicon.ico'){
            fs.writeFile('demo.txt',req.url.slice(1),(err)=>{
                console.log('successful')
            })
            res.end()
        }
    }
}).listen(3001,"localhost",()=>{
    console.log('server listening to port 3001')
})