// Do mathematical operation like Addition, subtraction, multiplication, div.
// Use case statement.
// Accept two numbers from the user from the command line.
// Create Separate function for add, sub, multi and div
// And store the result in one txt file. And display the result from file.


const fs = require('fs');
const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
var num1 = 0;
var num2 = 0;
var ex = 0;
var sd = "press 1 for addition\npress 2 for substraction\npress 3 for mutiplication\npress 4 for division :";
rl.question('Please enter the first number : ', (answer1) => {
    rl.question('Please enter the second number : ', (answer2) => {
        rl.question(sd, (answer3) => {
            num1 =parseInt (answer1);
            num2 = parseInt(answer2);
            ex = parseInt(answer3);
            display();
            result()
            rl.close();
        });
    });
});
function display() {
    switch (ex) {
        case 1:
            var res = add(num1, num2);
            fs.writeFile("result.txt", "the sum of " + num1 + " and " + num2 + " is : " + res, function (err) {
                if (err) throw err;
                console.log("addition performed!");
            })
            break;
        case 2:
            var res = sub(num1, num2);
            fs.writeFile("result.txt", "the substraction of " + num1 + " and " + num2 + " is : " + res, function (err) {
                if (err) throw err;
                console.log("substraction performed!");
            })
            break;
        case 3:
            var res = multi(num1, num2);
            fs.writeFile("result.txt", "the multiplication of " + num1 + " and " + num2 + " is : " + res, function (err) {
                if (err) throw err;
                console.log("multiplication performed!");
            })
            break;
        case 4:
            if (num2 == 0) {
                console.log("divide by zero error");
                break;
            }
            else {
                var res = div(num1, num2);
                fs.writeFile("result.txt", "the divison of " + num1 + " and " + num2 + " is : " + res, function (err) {
                    if (err) throw err;
                    console.log("divison performed!");
                })
                break;
            }
        default:
            console.log("you have entered wrong number for operation selection")
    }
}
function add(x, y) {
    return x + y;
}
function sub(x, y) {
    return x - y;
}
function multi(x, y) {
    return x * y;
}
function div(x, y) {

    return x / y;
}
function result()
{
    fs.readFile('./result.txt', 'utf8', (err, data) => {
        if (err) {
            console.error(err)
            return
        }
        console.log(data)
    })
}



/* const args = process.argv.slice(2);
console.log(args);
var num1 = parseInt(args[0]);
var num2 = parseInt(args[1]);
var ex = parseInt(args[2]);*/