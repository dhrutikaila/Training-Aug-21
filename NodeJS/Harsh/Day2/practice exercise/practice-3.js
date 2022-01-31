// Accept your name from command line. And append it to person.txt as “hello “+
// “name”.

var fs = require("fs");

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})

readline.question(`What's your name?`, name => {
    console.log(fs.appendFile("person.txt", `Hello ${name}`, (err) => {
        if (err) {
            throw err;
        }
        console.log("append successfully")
    })
    )
    readline.close()
})

