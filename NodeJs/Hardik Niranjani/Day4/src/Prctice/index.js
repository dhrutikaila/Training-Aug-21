const utils = require('util');
const path = require('path');
const fs = require('fs');
const http = require('http');
const server = http.createServer((req, res) => {
    if(req.url == '/'){
        res.write("Home Page");
        res.end();
    }
})

// utils

fs.access('./a/b/c', (err, access) => {
    const file = util.getSystemErrorName(err);
    console.error(file);
})

// path

var name1 = path.parse(__filename);

var dirname = path.dirname(__filename);

console.log(name1);
console.log(dirname);


server.listen(3005);