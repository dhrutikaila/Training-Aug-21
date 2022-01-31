// Append hello India in person.txt.

const fs = require('fs');
fs.appendFile("person.txt"," hello india",function(err)
{
    if(err) throw err;
    console.log("appended!");
})