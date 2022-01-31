// * practical 3: Accept your name from command line. And append it to person.txt as “hello “+ “name”.

const fs = require("fs");
const chalk = require("chalk");
const inquirer = require("inquirer");

const questions = {
  type: "input",
  name: "userName",
  message: "Enter Your Name:",
};

inquirer.prompt(questions).then((answers) => {
  fs.appendFile("person.txt", `${answers["userName"]}\n`, (err) => {
    if (err) {
      throw err;
    }
    console.log(chalk.green(`Data appended successfully.`));
  });
  fs.readFile("person.txt", (err, data) => {
    if (err) {
      throw err;
    }
    console.log(chalk.yellow(`\nData:`));
    console.log(chalk.bgBlue(chalk.black(data)));
  });
});
