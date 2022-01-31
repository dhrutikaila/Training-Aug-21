// 4. Create two txt files, write some dummy text. Read two file content and print it in the console.
// use async and await.

const fsSync = require("fs");
const {promisify} = require("util")

const fs = {
  readdir: promisify(fsSync.readdir),
  readFile: promisify(fsSync.readFile),
};

(async () => {
    try {
        let file1 = await fs.readFile("./files/file1.txt", "utf-8");
        let file2 = await fs.readFile("./files/file2.txt", "utf-8");
        console.log(file1)
        console.log(file2)

    } catch (e) {
        console.log("e", e);
    }
})()
