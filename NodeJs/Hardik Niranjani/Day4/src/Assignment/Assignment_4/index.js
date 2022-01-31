// Write a Nodejs server that serve as a RESTFUL API that accepts a file content and writes them to the disk.
// http://localhost:3001/upload

const http = require('http');
const fs = require('fs');

http.createServer((req, res) => {
    if(req.url == '/upload')
    {
        fs.readFile('./file1.txt','utf8', (err, data) => {
            if(err){
                throw err;
            }
            console.log(data);
            fs.writeFile('./file2.txt', data, (err, data) => {
                if(err){
                    throw err;
                }
                res.write(data);
                res.end();
            })
        })
    }
}).listen(3001)