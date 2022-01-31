// Create one folder files and move person.txt in that file.

const fs = require("fs")

fs.mkdir("./newFolder2", function(err) {
  if (err) {
    console.log(err)
  } else {
    console.log("New directory successfully created.")
  }
});

fs.writeFile("person.txt","dummy text file", function(err) {
    if (err) {
        console.log(err);
    }
});

// Move file

var oldPath = './person.txt'
var newPath = './newFolder/person.txt'

fs.rename(oldPath, newPath, function (err) {
  if (err) throw err
  console.log('Successfully renamed - AKA moved!')
})