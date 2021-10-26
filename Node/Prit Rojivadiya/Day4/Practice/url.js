const url = require("url");
const http = require("http");

const server = http.createServer((req,res)=>{
    const q = url.parse('http://localhost:8000?name=Prit',true);
    console.log(q);
    console.log(q.port);
    console.log(q.host);
    console.log(q.hostname);
    console.log(q.search);
    console.log(q.query);
    console.log(q.query.name);
    if(req.url == '/'){
        res.end('hi')
    }
})

server.listen(8000,'localhost',()=>{
    console.log('listening to port 8000')
})
