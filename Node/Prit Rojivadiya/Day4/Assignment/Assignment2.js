/* Write a Nodejs server that serves as a RESTFUL API that takes two parameters in a GET call 
and produces their sum. http://localhost:3001/product?param1=5&param2=10 */


const http = require('http');
const url = require('url');

const server = http.createServer((req,res)=>{
    if(req.url == '/'){
        res.end();
    }else if(req.url.match(/^\/product\?param1=[0-9]+&param2=[0-9]+$/)){
        const q = url.parse(req.url,true);
        let n1 = q.query.param1;
        let n2 = q.query.param2;
        let result = Number(n1) + Number(n2);
        res.end(result.toString())
    }
})

server.listen(3001,"localhost",()=>{
    console.log('listening to port 3001');
})