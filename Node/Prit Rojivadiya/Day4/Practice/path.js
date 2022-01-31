const path = require('path');

console.log(path.dirname('E:/HtmlCssJs/Node/Day4/Practice/path.js'))
console.log(path.basename('E:/HtmlCssJs/Node/Day4/Practice/path.js'))
console.log(path.extname('E:/HtmlCssJs/Node/Day4/Practice/path.js'))
const mypath = path.parse('E:/HtmlCssJs/Node/Day4/Practice/path.js')
console.log(mypath)
console.log(mypath.name)
console.log(path.join('/foo', 'bar', 'baz/asdf', 'quux', '..'))
console.log(process.env.PATH.split(path.delimiter));
console.log(path.format({
    dir: 'C:\\path\\dir',
    base: 'file.txt'
  }))

 console.log(path.isAbsolute('C:/foo/..'));   // true
 console.log(path.isAbsolute('C:\\foo\\..')); // true
 console.log(path.isAbsolute('bar\\baz'));    // false
 console.log(path.isAbsolute('bar/baz'));     // false
 console.log(path.isAbsolute('.'));           // false

 console.log(path.normalize('C:\\temp\\\\foo\\bar\\..\\'));
