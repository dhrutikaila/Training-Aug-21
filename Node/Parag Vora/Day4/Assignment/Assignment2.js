// Write a Nodejs server that serves as a RESTFUL API that takes two parameters in a GET call and produces their sum.

var http = require('http');
var url = require('url');

http.createServer(function (req, res) {
    var q = url.parse(req.url, true).query;
    var p1 = parseInt(q.param1);
    var p2 = parseInt(q.param2);
    res.write("the sum of " + p1 + " and " + p2 + " is: " + (p1 + p2));
    res.end();
}).listen(3001);

