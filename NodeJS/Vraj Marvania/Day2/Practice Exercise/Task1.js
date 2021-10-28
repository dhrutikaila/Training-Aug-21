var fs = require('fs');

var data = 'hello world'
fs.writeFile('./person.txt', data, function (error) {
    console.log(error)
})    