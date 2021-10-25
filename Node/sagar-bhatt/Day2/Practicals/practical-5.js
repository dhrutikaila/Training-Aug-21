// * practical 5: Write your address in one txt file and find out how many consonants are there.

const fs = require("fs");
const chalk = require("chalk");

fs.readFile("address.txt", (err, data) => {
  if (err) {
    throw err;
  }
  const countConsonants = (str) =>
    (str.match(/[bcdfghjklmnpqrstvwxyz]/gi) || []).length;
  console.log(chalk.yellow(`\nData:`));
  console.log(
    chalk.bgBlue(chalk.black(data, countConsonants(data.toString())))
  );
});
