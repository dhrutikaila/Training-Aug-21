// Create one txt file name it as person.txt and write in that hello world

var fs = require("fs");

fs.writeFile("person.txt", "hello world\t", (err) => {
    if (err) {
        throw err;
    }
    console.log("successfully file created");
})