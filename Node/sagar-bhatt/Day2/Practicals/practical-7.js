// * practical 7: Create one folder files and move person.txt in that file..

const { access, mkdir, rename } = require("fs");
const chalk = require("chalk");

access("person", (err) => {
  if (err) {
    mkdir("person", (err) => {
      if (err) {
        throw err;
      }
      console.log(chalk.green("Folder created successfully."));
    });
  } else {
    console.log(chalk.red("Folder already exist."));
  }
});

access("person.txt", (err) => {
  if (err) {
    console.log(chalk.red("File does not exist."));
  } else {
    rename("person.txt", "person/person.txt", (err) => {
      if (err) {
        throw err;
      }
      console.log(chalk.green("File moved successfully."));
    });
  }
});
