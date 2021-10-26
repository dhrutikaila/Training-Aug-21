//  Create one txt file name it as person.txt and write in that hello world

const fs = require('fs');
fs.writeFile("person.txt","hello world",function(err)
{
    if(err) throw err;
    console.log("saved!");
})