// * practical 1: Create one txt file name it as person.txt and write in that hello world

const fs = require("fs");
const chalk = require("chalk");

fs.writeFile("person.txt", "Hello World!\n", (err) => {
  if (err) {
    throw err;
  }
  console.log(chalk.green("File: person.txt is created successfully."));
});

fs.readFile("person.txt", (err, data) => {
  if (err) {
    throw err;
  }
  console.log(chalk.yellow(`\nData:`));
  console.log(chalk.bgBlue(chalk.black(data)));
});
