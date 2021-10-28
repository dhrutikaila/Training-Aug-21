// 3. Write a Nodejs server that serves as a RESTFUL API that accepts a string as an input name and returns the first vowel character from the string.

//  http://localhost:3001/vowefind?input=rita
// var data='rita'
// var ans= data.match(/[aeiou]/gi)
// console.log(ans[0])



var http = require('http');
var url = require('url');

http.createServer(function(req,res){
    var q = url.parse(req.url, true);
    var input= (q.query.input)
    var ans= input.match(/[aeiou]/gi)
    console.log(ans[0])
    res.write(ans[0])
    res.end()

}).listen(3001);


