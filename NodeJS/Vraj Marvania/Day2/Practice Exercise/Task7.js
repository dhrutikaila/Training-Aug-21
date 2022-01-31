// 7. Create one folder files and move person.txt in that file.
var fs=  require('fs')

fs.mkdir('./task7demo',function(error){
    console.log(error)
})

fs.rename('./task7demo/person.txt', './task7demo/person.txt', () => {
    console.log("\nFile Renamed!\n");
  }); 