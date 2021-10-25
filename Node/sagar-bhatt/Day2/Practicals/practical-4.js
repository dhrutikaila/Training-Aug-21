// * practical 4:  Create two txt files, write some dummy text. Read two file content and print it in the console. use async and await.

const fs = require("fs").promises;
const chalk = require("chalk");

async function writeTxtFiles() {
  await fs.writeFile("txt-1.txt", "txt file 1");
  await fs.writeFile("txt-2.txt", "txt file 2");
  console.log(chalk.green("Files created successfully."));
  readTxtFiles();
}

writeTxtFiles();

async function readTxtFiles() {
  console.log(chalk.yellow(`\nData:`));
  let file1 = await fs.readFile("txt-1.txt");
  console.log(chalk.bgBlue(chalk.black(`txt-1.txt:\n    ${file1.toString()}`)));

  let file2 = await fs.readFile("txt-2.txt");
  console.log(chalk.bgBlue(chalk.black(`txt-2.txt:\n    ${file2.toString()}`)));
}
