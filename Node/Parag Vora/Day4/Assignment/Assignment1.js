// Write a Nodejs server that listen on port 3001 and which will read person.json and return a response in JSON format.

var http = require('http');
var fs = require('fs');
http.createServer(function (req, res) {
    res.write("hello hello");
    fs.readFile("./person.json", "utf8", (err, jsonString) => {
        if (err) {
          console.log("File read failed:", err);
          return;
        }
        console.log("File data:", jsonString);
      });
    res.end();
  }).listen(3001);