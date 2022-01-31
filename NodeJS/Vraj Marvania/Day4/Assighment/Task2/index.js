// 2. Write a Nodejs server that serves as a RESTFUL API that takes two parameters in a GET call and produces their sum.

// http://localhost:3001/product?param1=5&param2=10


var http = require('http');
var url = require('url');


http.createServer(function(req,res){
var q = url.parse(req.url, true);
var qdata =q.query;
var num1=parseInt(qdata.param1);
var num2=parseInt(qdata.param2);
var ans=(num1+num2)
res.write("ans="+ ans)  
res.end();  
}).listen(3001);
