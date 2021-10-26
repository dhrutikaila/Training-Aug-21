// Write a Nodejs server that serves as a RESTFUL API that accepts a string as an input name and returns the first vowel character from the string.

var http = require('http');
var url = require('url');
var myArr;

http.createServer(function (req, res) {
    var q = url.parse(req.url, true).query;
    var p2 = (String(q.input));
    p1 = p2.toUpperCase();
    for (var i = 0; i < p1.length; i++) 
    {
        chr = p1.charAt(i); 
        if (chr == 'A' || chr == 'E' || chr == 'I' || chr == 'O' || chr == 'U')
        {
            var vw=chr;
            res.write("the first vowel character of the input string -> "+p2 +" is: "+vw);
            break;
        }
           
    } 
    res.end();
}).listen(3001);