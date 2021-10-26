
const httpMethods = require('http').METHODS;
console.log(httpMethods);

const httpstatusCode = require('http').STATUS_CODES;
console.log(httpstatusCode);


const fs = require("fs");
const http = require("http");
const server = http.createServer((req, res) => {
  if (req.url == "/") {
    res.end("hello how are you");
  } else if (req.url == "/about") {
    res.end("about us page");
  } else if (req.url == "/users") {
    fs.readFile(`user.json`, "utf-8", (err, data) => {
      res.writeHead(200,{
        "Content-Type": "application/json"
      })
      res.end(data);
    });
  } else if (req.url == "/contact") {
    res.write("hey ");
    res.write("hey ");
    res.end("contact page");
    // res.end('contact page')
  } else {
    res.writeHead(404, {
      "Content-Type": "text/html",
    });
    res.end("<h3>404 error page</h3>");
  }
});

server.listen(8000, "localhost", () => {
  console.log("listening to port number 8000");
});
