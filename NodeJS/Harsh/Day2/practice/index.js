// console.log("hi");
// console.log("hi");

// const { env } = require("process");

// How to read environment variables from Node.js


// console.log(process.env.a);

// process.env.port = 9999;
// console.log(process.env.username);

// process.env.username = "Harsh";
// console.log(process.env.username);


// require("dotenv").config({ path: "./.env" });



// console.log(process.env.Name);
// console.log(process.env.USER_ID);
// console.log(process.env.USER_KEY);
// console.log(process.env.NODE_ENV);


// * Accept arguments from the command line
// console.log(process);
// console.log(process.argv[2]);

// process.argv.forEach((value, index, array) => {
//     console.log(`process.argv = ${array}`);
//     console.log(`${index}: ${value}`);
// });

// process.argv.slice(2).forEach((value, index, array) => {
//     console.log(`process.argv = ${array}`);
//     console.log(`${index}: ${value}`);
// });



// TODO: Package: npm i minimist
// const args = require("minimist")(process.argv);
// console.log(`${args["name"]}`);



// * Output to the command line using Node.js

// console.log(`Name: %s, BirthDate: %d`, args["name"], args["birthDate"]);
// console.log("%o", console);

// count = "Count";
// console.count(count);
// console.count(count);
// console.count(count);
// console.countReset(count);
// console.count(count);
// console.count(count);
// console.count(count);


// console.error("\x1b[33m%s\x1b[0m", "Error")

// var chalk = require("chalk");
// console.log(chalk.black(chalk.bgYellow("hi")));


// const readline = require('readline').createInterface({
//     input: process.stdin,
//     output: process.stdout
// })



// readline.question(`What's your name?`, name => {
//     console.log(`Hi ${name}`)
//     readline.close()
// })

// const inquirer = require("inquirer");
// const questions = [
//     {
//         type: "input",
//         name: "name",
//         message: "What is your name: ",
//     },
// ];

// inquirer.prompt(questions).then((answer) => {
//     console.log(`Hi ${answer["name"]}`);
// });

// * Expose functionality from a Node.js file using exports
// const car = require("./car");
// console.log(car);

// OR DIRECTLY
const car1 = require("./car").car;
console.log(car1);

