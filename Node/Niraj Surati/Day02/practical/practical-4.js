// 4. Create two txt files, write some dummy text. Read two file content and print it in the console. use async and await.

let chalk = require('chalk');
let fs =  require('fs').promises;
let inquirer =require('inquirer');

// fs.writeFile("./file1.txt","dummy-text-1",(err) =>{
//     if(err){
//         throw err;
//     }
//     console.log(chalk.bgAnsi(69)(chalk.yellowBright("File1 created")));
// });

// fs.writeFile("./file2.txt","dummy-text-2",(err) =>{
//     if(err){
//         throw err;
//     }
//     console.log(chalk.bgAnsi(69)(chalk.yellowBright("File2 created")));
// });

// async function readFile1(){
//     const data = await fs.readFile('./file1.txt');
//     return data;
// }
// async function readFile2(){
//     const data = await fs.readFile('./file2.txt');
//     return data;
// }

// async function loadFiles(){
//     let fun1 = await readFile1();
//     console.log(fun1);
//     let fun2 = await readFile2();
//     console.log(fun2);
// }

loadFiles();

async function loadFiles(){
    await fs.writeFile('./file1.txt',"dummy-text-1");
    await fs.writeFile('./file2.txt',"dummy-text-2");
    readDummyFiles();

}
async function readDummyFiles() {
    let file1 = await fs.readFile('./file1.txt')
    console.log(file1.toString());
    let file2 = await fs.readFile('./file2.txt')
    console.log(file2.toString());   
}