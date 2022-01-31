console.log("hello World");

// Env
//require('dotenv').config({path "../.env"});
require('dotenv').config();
console.log(process.env.niraj);
console.log(process.env.USER_ID);
console.log(process.env.USER_KEY);
console.log(process.env.NODE_ENV);
console.log(process.env.name);

// cmd line args

process.argv.forEach((val, index) => {
    console.log(`${index} : ${val}`);
})
process.argv.slice(2).forEach((val, index) => {
    console.log(`${index} : ${val}`);
})

const args = require('minimist')(process.argv.slice(2));
console.log(`${args['name']}`);

//output using command line
console.log("%o",console);

console.log('my name is %s and my username is %s. i am %d years old.',args["name"],args["username"],args["age"]);
let a = 14;
console.count(a);
console.count(a);
console.count(a);
console.countReset(a);

console.trace(a);

console.log('\x1b[33m%s\x1b[0m', 'hi!')

// chalk

const chalk = require("chalk");

console.log(chalk.red("danger"));
console.log(chalk.bgMagenta("impact"));
console.log(chalk.bgAnsi(25)(chalk.yellow(("bee"))));

// progress

const ProgressBar = require('progress')

const bar = new ProgressBar(':bar', { total: 10 })
const timer = setInterval(() => {
    bar.tick()
    if (bar.complete) {
        clearInterval(timer)
    }
}, 500)

// readline

// const readline = require('readline').createInterface({
//     input: process.stdin,
//     output: process.stdout
// })

// readline.question(`What's your Name?`, name => {
//     console.log(`Hi ${name}!`);
//     readline.close()
// })

// inquirer

const inquirer = require('inquirer');

var questions = [
    {
        type: 'input',
        name: 'name',
        message: "What's your name?"
    }
];

inquirer.prompt(questions).then(answers => {
    console.log(`Hi ${answers['name']}!`)
});