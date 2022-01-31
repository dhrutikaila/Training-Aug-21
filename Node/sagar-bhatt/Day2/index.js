#!/usr/bin/node
console.log("sagar bhatt");
console.log("sagar bhatt");

// if (false) {
//   console.log(process.exit(1));
// }

// * How to read environment variables from Node.js
// TODO: Package: npm install dotenv
require("dotenv").config({ path: "./.env" });
console.log(process.env.p);
// process.env.userName = "sagar";
console.log(process.env.Name);
console.log(process.env.USER_ID); // "239482"
console.log(process.env.USER_KEY); // "foobar"
console.log(process.env.NODE_ENV); // "development"

process.env.port = 9999;
console.log(process.env.port);

// * Accept arguments from the command line
console.log(process.argv[2]);
process.argv.forEach((value, index, array) => {
  console.log(`process.argv = ${array}`);
  console.log(`${index}: ${value}`);
});

process.argv.slice(2).forEach((value, index, array) => {
  console.log(`process.argv = ${array}`);
  console.log(`${index}: ${value}`);
});

// TODO: Package: npm i minimist
const args = require("minimist")(process.argv);
console.log(`${args["name"]}`);

// * Output to the command line using Node.js
console.log(`Name: %s, BirthDate: %d`, args["name"], args["birthDate"]); // run: node index.js --name=sagar --birthDate=11
console.log("%o", console);

count = "Count";
console.count(count);
console.count(count);
console.count(count);
console.countReset(count);
console.count(count);
console.count(count);
console.count(count);

console.time();
console.trace();
console.timeEnd();

console.error("\x1b[33m%s\x1b[0m", "Error");

// TODO: Package: npm i chalk
const chalk = require("chalk");

console.log(chalk.ansi(69)(chalk.bgYellowBright("hi!")));

// TODO: Package: npm i progress
// const ProgressBar = require("progress");

// const bar = new ProgressBar(":bar", { total: 10 });
// const timer = setInterval(() => {
//   console.time();
//   bar.tick();
//   if (bar.complete) {
//     clearInterval(timer);
//   }
//   console.timeEnd();
// }, 100);

// * Accept input from the command line in Node.js
const readline = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

readline.question("Enter your Name: ", (name) => {
  console.log(chalk.bgAnsi256(131)(`${name}`)),
    readline.question("Enter your Surname: ", (surname) => {
      console.log(chalk.bgAnsi256(69)(`${surname}`));
      readline.close();
    });
});

// TODO: Package: npm i inquirer
// const inquirer = require("inquirer");
// const questions = [
//   {
//     type: "input",
//     name: "name",
//     message: "What is your name: ",
//   },
// ];

// inquirer.prompt(questions).then((answer) => {
//   console.log(chalk.blue(`Hi ${answer["name"]}`));
// });

// * Expose functionality from a Node.js file using exports
const car = require("./car");
console.log(car);
console.log(car.car);

// OR DIRECTLY
const car1 = require("./car").car;
console.log(car1);
