// * Assignment: Rambo Rental Bikes is looking for developing a system to calculate the rentals of the bikes. System should accept the customer details, bike details and calculate the rental charges.

const { Mobike } = require("./mobike");
const chalk = require("chalk");
const inquirer = require("inquirer");

const inputName = {
  type: "input",
  name: "name",
  message: chalk.green("Please enter your name:"),
};
const inputContactNo = {
  type: "number",
  name: "contact",
  message: chalk.green("Please enter your contact no:"),
};
const inputBikeNo = {
  type: "number",
  name: "bike",
  message: chalk.green("Please enter bike no:"),
};
const inputDays = {
  type: "number",
  name: "days",
  message: chalk.green("For how Many Days?"),
};

const getDetails = async () => {
  let userName = await inquirer.prompt(inputName);
  let contactNo = await inquirer.prompt(inputContactNo);
  let bikeNo = await inquirer.prompt(inputBikeNo);
  let noOfDays = await inquirer.prompt(inputDays);
  var objMobike = new Mobike(
    userName["name"],
    contactNo["contact"],
    bikeNo["bike"],
    noOfDays["days"]
  );
  objMobike.compute();
};

getDetails().catch((err) => {
  console.log(chalk.red(err));
});
