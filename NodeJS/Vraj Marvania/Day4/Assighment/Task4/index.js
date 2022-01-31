// 4. Write a Nodejs server that serve as a RESTFUL API that accepts a file content and writes them to the disk.
// http://localhost:3001/upload?filename=demo.txt


// ---------use this link------------------------------->
// http://localhost:3001/upload?filename=demo.txt
// ---------use this link------------------------------->


var http = require('http');
var fs = require('fs');
var url = require('url');


http.createServer(function (req, res) {
  // add a HTTP header:
  var q = url.parse(req.url, true);

console.log(q.host); //returns 'localhost:8080/upload'
if(q.pathname=='/upload'){
  var fname=(q.query.filename)
  fs.readFile(fname,'utf8' , (err, data) => {
      console.log(data)
    fs.writeFile('./demo2.txt',data,function(error){
      console.log(error)
    })
     res.write("done");
     res.end();
  })
}
}).listen(3001);


