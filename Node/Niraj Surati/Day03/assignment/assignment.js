//Rambo Rental Bikes is looking for developing a system to calculate the rentals of the bikes. System should accept the customer details, bike details and calculate the rental charges.

let inquirer = require('inquirer');
let moBike = require('./Mobike.js').MoBike;


const getDays = async () => {
    let days =  await inquirer.prompt({
        type: 'number',
        name: 'days',
        message: 'How Many Days?'
    
    });
    var obj = new moBike('gj016969','7359411074','Niraj surati', days['days']);
    obj.compute();
}

getDays();