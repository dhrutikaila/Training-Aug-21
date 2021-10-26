// Do mathematical operation like Addition, subtraction, multiplication, div.
// Use case statement.
// Accept two numbers from the user from the command line.
// Create Separate function for add, sub, multi and div
// And store the result in one txt file. And display the result from file.

let fs = require('fs').promises;
let inquirer =  require('inquirer');
let chalk = require('chalk');

const main = async () => {
    console.log('1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n0.Exit');
    let choice =  await inquirer.prompt({
        type: 'number',
        name: 'choice',
        message: 'Select option?'
    });
    if(parseInt(choice['choice']) == 0){
        process.exit(1);
    }
    let value1 =  await inquirer.prompt({
        type: 'number',
        name: 'Input1',
        message: 'Value 1?'
    });
    let value2 =  await inquirer.prompt({
        type: 'number',
        name: 'Input2',
        message: 'Value 2?'
    
    });
    return [choice['choice'],value1['Input1'],value2['Input2']];
}
async function callMain(){
    let a = await main();   
    calc(parseInt(a[0]),parseInt(a[1]),parseInt(a[2]));
}

let writeResult = async (answer, message) =>{
    await fs.writeFile("./calc.txt",`${message} = ${answer}`);
    await readResult();
};

let readResult = async () =>{
    let data = await fs.readFile("./calc.txt");
        console.log(chalk.yellow(chalk.bgRed(data.toString())));
};

function calc(choice,no1,no2){
    switch(choice){
        case 1:
            answer = no1 + no2;
            writeResult(answer, `${no1} + ${no2}`);
            setTimeout(() => {
                callMain();
            }, 3000);
            break;
        case 2:
            answer = no1 - no2;
            writeResult(answer, `${no1} - ${no2}`);
            setTimeout(() => {
                callMain();
            }, 3000);
            break;
        case 3:
            answer = no1 * no2;
            writeResult(answer, `${no1} * ${no2}`);
            setTimeout(() => {
                callMain();
            }, 3000);
            break;
        case 4:
            answer = no1 / no2;
            writeResult(answer, `${no1} / ${no2}`);
            setTimeout(() => {
                callMain();
            }, 3000);
            break;
        default:
            console.log(chalk.red('error'));
    }
}

callMain();

