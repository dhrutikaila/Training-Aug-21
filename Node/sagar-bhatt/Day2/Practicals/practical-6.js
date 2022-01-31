// * practical 6: Remove person.txt file.

const fs = require("fs");
const chalk = require("chalk");

fs.unlink("person.txt", (err) => {
  if (err) {
    throw err;
  }
  console.log(chalk.red("File deleted successfully."));
});
