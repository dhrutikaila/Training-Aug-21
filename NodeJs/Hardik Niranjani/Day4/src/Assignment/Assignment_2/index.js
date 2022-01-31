// Write a Nodejs server that serves as a RESTFUL API that takes two parameters in a GET call and produces their sum.

const http = require('http');
const url = require('url');

http.createServer(function(req,res){
    const urlPart = url.parse(req.url,true).query;
    var result = parseInt(urlPart.param1)+parseInt(urlPart.param2);
    
    res.write(result.toString());
    res.end()
}).listen(3001)