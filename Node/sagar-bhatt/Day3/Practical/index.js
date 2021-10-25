// * Practical 1: Create hello.js file and exports a value of constant variable greeting=”Greeting of the day!!!” and load the same in index.js
const { greeting } = require("./hello");
const chalk = require("chalk");

console.log(chalk.green(greeting));

// * Practical 2: Create Rectangle.js and compute AreaofRectangle and perimeter of Rectangle, and exports area and peri
const { area, perimeter } = require("./rectangle");
let length = 100;
let breadth = 100;

console.log(chalk.blue(`\nLength: ${length}, Breadth: ${breadth}`));
console.log(chalk.yellow(`Area of Rectangle: ${area(length, breadth)}`));
console.log(
  chalk.yellow(`Perimeter of Rectangle: ${perimeter(length, breadth)}`)
);
