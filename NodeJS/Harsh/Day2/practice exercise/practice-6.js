// Remove person.txt file.

var fs = require("fs");

fs.unlink("person.txt", (err) => {
    if (err) { throw err; }
    console.log("file deleted");
});

