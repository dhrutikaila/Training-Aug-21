// Append hello India in person.txt.

var fs = require("fs");

fs.appendFile("person.txt", "hello india\t", (err) => {
    if (err) {
        throw err;
    }
    console.log("successfully file appended");
})