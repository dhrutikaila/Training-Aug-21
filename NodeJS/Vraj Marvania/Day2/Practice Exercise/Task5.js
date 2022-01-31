// 5. Write your address in one txt file and find out how many consonants are there.

var fs= require('fs')

fs.readFile('./demo.txt','utf8' , (err, data) => {
    if (err) {
      console.error(err)
      return
    }
    console.log(data.length-((data.match(/[aeiou]/gi)).length))
  })
   