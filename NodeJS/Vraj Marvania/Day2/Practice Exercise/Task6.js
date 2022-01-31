// 6. Remove person.txt file.
var fs= require('fs')



fs.readFile('./demo.txt','utf8' , (err, data) => {
    if (err) {
      console.error(err)
      return
    }
    console.log(data.length-((data.match(/[aeiou]/gi)).length))
  })
  
//->>>>>>>>>>>>
 fs.unlink('./demo.txt',(err) => {
    if (err) throw err;
    console.log('successfully deleted demo.txt');
});   