const http = require('http');
const fs = require('fs');
const Event = require('events');



http.createServer((req, res) => {

    if(req.url == '/'){

        fs.readFile('./home.html','utf8',(err, data) => {
            if(err) throw err;
            res.write(data);
            res.end();
        })
    }
    if(req.url == '/exam'){
        fs.readFile('./exam.html','utf-8',(err, data) => {
            if(err) throw err;
            res.write(data);
            res.end();
        })
    }

    if(req.url == '/submit') {
        fs.readFile('./submit.html','utf-8',(err, data) => {
            if(err) throw err;
            res.write(data);
            res.end();
        })
    }
}).listen(3005);

const events = new Event();
    events.on('submit', ()=>{
        return new Promise((resolve, reject) =>{
            setTimeout(() =>{
                console.log('exam over');
            },3*60*60*1000)
            resolve('submit');
        })
    })
