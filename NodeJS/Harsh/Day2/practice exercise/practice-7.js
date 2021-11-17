// Create one folder files and move person.txt in that file.

var fs = require("fs");
var a = async () => {
    await fs.mkdir("prac", (err) => {
        if (err) {
            throw err;
        }
        console.log("folder created successfully")
    })

    await fs.rename("text1.txt", "prac/text1.txt", (err) => {
        if (err) {
            throw err;
        }
        console.log("folder created successfully")
    })
}

a();
