// Create two txt files, write some dummy text. Read two file content and print it in the console. use async and await.

var fs = require("fs").promises;

async function loadFiles() {
    await fs.writeFile('./1.txt', "hi");
    await fs.writeFile('./2.txt', "hello");
    readDummyFiles();
}
async function readDummyFiles() {
    let f1 = await fs.readFile('./1.txt')
    console.log(f1.toString());
    let f2 = await fs.readFile('./2.txt')
    console.log(f2.toString());
}

loadFiles();