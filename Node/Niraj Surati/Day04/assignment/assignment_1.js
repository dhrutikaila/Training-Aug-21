// 1.Write a Nodejs server that listen on port 3001 and which will read person.json and return a response in JSON format.

const fs = require('fs').promises;
const http = require('http');
const chalk = req('chalk');

let port = 1414;

const server = http.createServer( async (req,res) => {
    // res.statusCode = 200;
    // res.setHeader('Content-Type','text/html');

    res.writeHead(200, {'Content-Type':'text/html'});

    let jsonData = await readJsonFile();
    res.write(jsonData);
    res.end();
})

server.listen(port, () =>{
    console.log('server running at: '+ chalk.blue(`http://localhost:${port}/`));
})

let readJsonFile = async () =>{
    let data = await fs.readFile('person.json');
    return data.toString();
} 

