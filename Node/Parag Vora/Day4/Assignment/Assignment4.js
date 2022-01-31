// Write a Nodejs server that serve as a RESTFUL API that accepts a file content and writes them to the disk.

const http = require('http');
const fs = require('fs');
const url = require('url');
const querystring = require('querystring');

http.createServer((req,res)=>
{
    if(req.url == '/upload')
    {
        fs.readFile('./demo.html','utf8',(err,data)=>
        {
            if(err)
            {
                console.log(err);
                return;
            }
            console.log(data);
            fs.mkdir(__dirname+"/demo",(er)=>
            {
                if(er) throw er;
                else
                {
                    console.log('Folder created');
                }
            })
            fs.writeFile(__dirname+"/demo/test.txt",data,{flag:"w+"},(err)=>
            {
                if(err)
                {
                    console.log(err);
                    return;
                }
                else{
                    console.log('File created');
                }
            })
            res.write(data);
            res.end();   
        })
    }
}).listen(3001)