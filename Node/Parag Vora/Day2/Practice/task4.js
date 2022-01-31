// Create two txt files, write some dummy text. Read two file content and print it in the console. use async and await. 

const fs = require('fs').promises;
async function loadMonoCounter() {
    const data = await fs.readFile("dummy1.txt", "utf8");
    console.log(data);
}
console.log("readfile called");
loadMonoCounter();

// const data =  fs.readFile("dummy1.txt", "utf8",function(err, data)
//     {
//         console.log(data);
//     });