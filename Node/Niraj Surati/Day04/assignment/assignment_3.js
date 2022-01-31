//3. Write a Nodejs server that serves as a RESTFUL API that accepts a string as an input name and returns the first vowel character from the string.
//http://localhost:3001/vowefind?input=rita

const fs = require('fs').promises;
const http = require('http');
const url = require('url');
const chalk = require('chalk');

let port = 1414;

const server = http.createServer((req,res) => {
    res.writeHead(200, {'Content-Type':'text/html'});
    let urlC = url.parse(req.url,true).pathname;
    let urlData = url.parse(req.url,true).query;
    if(urlC == '/vowelfind' && Object.keys(urlData).length == 1)
    {
        let vowel  = Object.values(urlData)[0].match(/[aeiou]/i);
        res.write(`<h2 style="color:blue">First vowel at : ${vowel[0]}, ${vowel['index']+1}</h2>`);
    }
    else{
        res.write(`<h1 style="color:red">Error</h1>`);
    }
    res.end();
})

server.listen(port, () =>{
    console.log('server running at: '+ chalk.blue(`http://localhost:${port}/`));
})
