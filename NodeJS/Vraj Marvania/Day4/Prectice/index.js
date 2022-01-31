
var http = require('http')
var util = require('util');
var path = require('path');

// Http


    //create a server object:
    http.createServer(function (req, res) {
      res.write('Hello World!'); //write a response to the client
      res.end(); //end the response
    }).listen(8080); //the server object listens on port 8080

    // HTTP Header
    http.createServer(function (req, res) {
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.write('Hello World!');
      res.end();
    }).listen(8080);

    // Read the Query String
    var http = require('http');
    http.createServer(function (req, res) {
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.write(req.url);
      res.end();
    }).listen(8080);


// Util


    // format
    var txt = 'Congratulate %s on his %dth birthday!';
    var result = util.format(txt, 'Linus', 6);

    console.log(result);
    // debug
    var testString = "Test Test";
    util.debug(testString); // "Test Test";


    // print
    util.print(1, 2, '3');

    // log
    util.log('Timestamped message.');

// Path


    // basename
    var filename = path.basename('/Users/Refsnes/demo_path.js');
    console.log(filename);

    // delimiter
    console.log(path.delimiter);

    // dirname
    var directories = path.dirname('/Users/Refsnes/demo_path.js');
    console.log(directories);


    // extname
    var ext = path.extname('/Users/Refsnes/demo_path.js');
    console.log(ext);

    // isAbsolute
    console.log(path.isAbsolute('/test/demo_path.js')); //true
    console.log(path.isAbsolute('test/demo_path.js')); //false


    // join
    var x = path.join('Users', 'Refsnes', 'demo_path.js');

    console.log(x);


    // format
    var obj = { dir: 'C:\\Users\\Refsnes', base: 'demo_path.js' }

    var p = path.format(obj);
    console.log(p);


    // normalize
    var x = path.normalize('Users/Refsnes/../Jackson');

    console.log(x);