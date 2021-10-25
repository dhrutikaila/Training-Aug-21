// * Assignment:
// ? Do mathematical operation like Addition, subtraction, multiplication, div.
// ? Use case statement.
// ? Accept two numbers from the user from the command line.
// ? Create Separate function for add, sub, multi and div
// ? And store the result in one txt file. And display the result from file.

const { writeFile, readFile } = require("fs");
const chalk = require("chalk");
const inquirer = require("inquirer");

const choiceNo = {
  type: "number",
  name: "choice",
  message: chalk.green(`\nEnter Your Choice(1,2,3,4,5)
  1.Addition
  2.Subtraction
  3.Multiplication
  4.Division
  5.exit:`),
};
const firstNo = {
  type: "number",
  name: "firstNo",
  message: chalk.green(`Enter first number:`),
};
const secondNo = {
  type: "number",
  name: "secondNo",
  message: chalk.green(`Enter second number:`),
};

const arrInput = async () => {
  const choice = await inquirer.prompt(choiceNo);
  if (choice["choice"] == 5) {
    process.exit(1);
  }
  const first = await inquirer.prompt(firstNo);
  const second = await inquirer.prompt(secondNo);

  return [choice["choice"], first["firstNo"], second["secondNo"]];
  // calculator([choice["choice"], first["firstNo"], second["secondNo"]]);
};

async function callArrInput() {
  let a = await arrInput();
  calculator(parseInt(a[0]), parseInt(a[1]), parseInt(a[2]));
}

function calculator(choice, first, second) {
  switch (choice) {
    case 1:
      // console.log(first + second);
      answer = first + second;
      createFile(answer, "Addition is");
      setTimeout(() => {
        callArrInput();
      }, 1000);
      break;
    case 2:
      // console.log(first - second);
      answer = first - second;
      createFile(answer, "Subtraction is");
      setTimeout(() => {
        callArrInput();
      }, 1000);
      break;
    case 3:
      // console.log(first * second);
      answer = first * second;
      createFile(answer, "Multiplication is");
      setTimeout(() => {
        callArrInput();
      }, 1000);
      break;
    case 4:
      // console.log(first / second);
      answer = first / second;
      createFile(answer, "Division is");
      setTimeout(() => {
        callArrInput();
      }, 1000);
      break;
    default:
      console.log(chalk.red("Please enter proper input!"));
      setTimeout(() => {
        callArrInput();
      }, 3000);
  }
}

callArrInput();

function createFile(ans, message) {
  writeFile("answer.txt", `${message}: ${ans}`, (err) => {
    if (err) {
      throw err;
    }
  });
  read();
}

function read() {
  readFile("answer.txt", (err, data) => {
    if (err) {
      throw err;
    }
    console.log(chalk.yellow(`\nData:`));
    console.log(chalk.bgBlue(chalk.black(data)));
  });
}
