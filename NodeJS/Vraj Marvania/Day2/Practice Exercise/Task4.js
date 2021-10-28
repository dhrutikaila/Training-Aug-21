// 4. Create two txt files, write some dummy text. Read two file content and print
//  it in the console. use async and await.

const fs = require('fs').promises;



async function redfun1() {
    const data = await fs.readFile("demo.txt", "utf8");
    console.log(data);
    const data1 = await fs.readFile("demo2.txt", "utf8");
    console.log(data1);
} 
console.log("readfile called");
redfun1();   