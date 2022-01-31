// 3. Accept your name from command line. And append it to person.txt as “hello “+
// “name”.
var fs = require('fs')
const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})


readline.question(`Please Enter your name?`, name => {
    fs.appendFile('./person.txt', `Hello ${name}!`, function (error) 
    {
        console.log(error)
    })
    readline.close()
})
  