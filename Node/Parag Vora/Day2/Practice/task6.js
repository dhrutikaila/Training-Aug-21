// Create one folder files and move person.txt in that file.

var fs = require('fs');
const fse = require('fs-extra');

var oldPath = './person.txt';
var newPath = './tempfolder/person.txt'

fse.move(oldPath, newPath, function (err) {
  if (err) throw err
  console.log('Successfully renamed - AKA moved!')
})