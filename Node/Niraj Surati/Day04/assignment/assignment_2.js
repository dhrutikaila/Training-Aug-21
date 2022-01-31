// 2.Write a Nodejs server that serves as a RESTFUL API that takes two parameters in a GET call and produces their sum.

const fs = require('fs').promises;
const http = require('http');
const url = require('url');
const chalk = require('chalk');

let port = 1414;

const server = http.createServer((req,res) => {
    res.writeHead(200, {'Content-Type':'text/html'});
    let urlC = url.parse(req.url,true);
    let urlData = url.parse(req.url,true).query;
    if(urlC.pathname == '/product')
    {
        let ans  = parseInt(Object.values(urlData)[0]) + parseInt(Object.values(urlData)[1]);
        res.write(`${Object.values(urlData)[0]} + ${Object.values(urlData)[1]} = ${ans}`);
    }
    res.end();
})

server.listen(port, () =>{
    console.log('server running at: '+ chalk.blue(`http://localhost:${port}/`));
})
