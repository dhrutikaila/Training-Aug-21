//1. Create hello.js file and exports a value of constant variable greeting=”Greeting of the day!!!” and load the same in index.js

let chalk = require('chalk');
const greeting = require('./hello.js').greeting;



console.log(chalk.bgYellowBright(chalk.red(greeting)));

//2. Create Rectangle.js and compute AreaofRectangle and perimeter of Rectangle, and exports area and perimeter of rectangle

const rect = require('./rectangle.js');
let inquirer =  require('inquirer');

const mainRect = async () => {
    let length =  await inquirer.prompt({
        type: 'number',
        name: 'length',
        message: 'length'
    });
    let breadth =  await inquirer.prompt({
        type: 'number',
        name: 'breadth',
        message: 'breadth'
    });

    let areaOfRect = rect.area(length['length'],breadth['breadth']);
    let pereOfRect = rect.perimeter(length['length'],breadth['breadth']);
    console.log(chalk.red(chalk.bgYellowBright(`Area of Rectangle ${areaOfRect}`)));
    console.log(chalk.red(chalk.bgYellowBright(`Perimeter of Rectangle: ${pereOfRect}`)));
}

mainRect();