// Do mathematical operation like Addition, subtraction, multiplication, div.
// Use case statement.
// Accept two numbers from the user from the command line.
// Create Separate function for add, sub, multi and div
// And store the result in one txt file. And display the result from file.

var fs = require("fs");
const readline = require("readline").createInterface({
    input: process.stdin,
    output: process.stdout,
});

var fs = require("fs");
var tempans = 0;

function add(a, b) {
    return a + b;
}

function sub(a, b) {
    return a - b;
}

function multi(a, b) {
    return a * b;
}

function div(a, b) {
    return a / b;
}


readline.question(
    `please enter  add for 1,/n sub for 2, multi  for 3, div for 4`,
    (type) => {
        readline.question(`Please Enter no1?`, (no1) => {
            readline.question(`Please Enter no2?`, (no2) => {
                no1 = parseInt(no1);
                no2 = parseInt(no2);

                switch (parseInt(type)) {
                    case 1:
                        tempans = add(no1, no2);
                        break;
                    case 2:
                        tempans = sub(no1, no2);
                        break;
                    case 3:
                        tempans = multi(no1, no2);
                        break;
                    case 4:
                        tempans = div(no1, no2);
                        break;
                    default:
                        console.log("error");
                        readline.close();
                }
                fs.writeFile("./ans.txt", `your ans is ${tempans}`, function (error) {
                    console.log(error);
                });
                fs.readFile("./ans.txt", function (error, data) {
                    console.log(error);
                    console.log(data.toString());
                });
                readline.close();
            });
        });
    }
); 
