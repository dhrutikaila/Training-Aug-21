// . Append hello India in person.txt.
var fs = require('fs');


var data = 'hello India'
fs.appendFile('./person.txt', data, function (error) {
    console.log(error)
})

