// Write a Nodejs server that listen on port 3001 and which will read person.json and return a response in JSON format.

const http = require("http");
const JsonData = require("./Person.json");


http
  .createServer(function ( res) {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.write(JSON.stringify(JsonData));
    res.end();
  })
  .listen(3001);