// 4. Write a Nodejs server that serve as a RESTFUL API that accepts a file content and writes them to the disk.
// http://localhost:3001/upload


const fs = require('fs').promises;
const path = require('path');
const http = require('http');
const url = require('url');
const chalk = require('chalk');
const qs = require('querystring');

let port = 1414;

let readJsonFile = async () =>{
    let data = await fs.readFile('person.json');
    return data;
} 

let writeJsonFile = async(data) =>{
    let dataObj = await readJsonFile();
    dataObj.push(data);
    await fs.writeFile('./person.json',dataObj);
}



const server =  http.createServer(async (req,res) => {
    
    if(req.url == '/')
    {
        res.writeHead(200, {'Content-Type':'text/html'});
        res.write(`<form type="post" action="person/">
                    ID:<input type="name" name="id" required /><br>
                    Name:<input type="name" name="name" required /><br>
                    Address:<input type="name" name="address" required /><br>
                    <input type="submit" value="submit" />
                    </form>`);

    }else if(req.url === "/person" && req.method === "POST"){
        res.writeHead(200, {'Content-Type':'text/html'});
        var body = "";
        request.on('data', function (data) {
            body += data;
        });
        const data = qs.parse(body);
        let jsonString = JSON.stringify(data);
        let jsonObj = JSON.parse(jsonString);
        console.log(jsonObj);
        await writeJsonFile(jsonObj);
        let readData = await readJsonFile();
        res.write(JSON.stringify(readData));
    }
    else{
        res.writeHead(404, {'Content-Type':'text/html'});
        res.write(`<h1 style="color:red">Error</h1>`);
    }

    res.end();
})

server.listen(port, () =>{
    console.log('server running at: '+ chalk.blue(`http://localhost:${port}/`));
})
