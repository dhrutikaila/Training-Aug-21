// Write a Nodejs server that listen on port 3001 and which will read person.json and return a response in JSON format.
//     Person.json content as follows:

// [
// {
//     PersonID: 1,
//     PersonName:”Rita”,
//     PersonAddress:”Ahmedabad”
// },
// {
//     PersonID: 2,
//     PersonName:”Reema”,
//     PersonAddress:”Calcutta”
// }]

// http://localhost:3001

var fs = require('fs');

var http = require('http');

http.createServer(function (req, res) {
    var datalist;
    fs.readFile('./person.json',function(error,data){
        datalist=(data.toString())
        res.write( datalist); //write a response to the client
        res.end(); //end the response
    })
    
   
  }).listen(3001);


