var fs = require('fs');

// readfile
fs.readFile('demofile1.text', function(err, data) {
  console.log(data.toString())
});


// appendFile
fs.appendFile('demofile1.text', 'Hello content!', function (err) {
  if (err) throw err;
  console.log('Saved!');
});


// writeFile
fs.writeFile('demofile1.text', 'Hello content!', function (err) {
  if (err) throw err;
  console.log('Saved!');
});

// unlink
fs.unlink('mynewfile2.txt', function (err) {
  if (err) throw err;
  console.log('File deleted!');
});

// rename
fs.rename('mynewfile1.txt', 'myrenamedfile.txt', function (err) {
  if (err) throw err;
  console.log('File Renamed!');
});