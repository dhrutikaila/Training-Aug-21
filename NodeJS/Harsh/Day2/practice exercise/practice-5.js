// Write your address in one txt file and find out how many consonants are there.

const fs = require('fs');
fs.readFile('./address.txt', (err, data) => {
    if (err) {
        throw err;
    }
    var d = data.toString();
    console.log(d);
    var count = (d2) => (d2.match(/[bcdfghjklmnpqrstvwxyz]/gi) || []).length;
    console.log(count(d));
});