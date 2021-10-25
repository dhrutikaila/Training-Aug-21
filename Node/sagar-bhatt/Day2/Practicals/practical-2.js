// * practical 2: Append hello India in person.txt.

const fs = require("fs");
const chalk = require("chalk");

fs.appendFile("person.txt", "Hello India!\n", (err) => {
  if (err) {
    throw err;
  }
  console.log(chalk.green("Data appended successfully."));
});

fs.readFile("person.txt", (err, data) => {
  if (err) {
    throw err;
  }
  console.log(chalk.yellow(`\nData:`));
  console.log(chalk.bgBlue(chalk.black(data)));
});
