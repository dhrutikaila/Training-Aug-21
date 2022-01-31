const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
var num1 = "";
var num2 = 0;
var num3 = "";
var num4 = 0;
rl.question('Please enter the Bike Number : ', (answer1) => {
    rl.question('Please enter the Phone Number : ', (answer2) => {
        rl.question('Please enter your Name : ', (answer3) => {
            rl.question('Please enter Number Of Days to take bike on rent : ', (answer4) => {
                num1 = (answer1);
                num2 = parseInt(answer2);
                num3 = (answer3);
                num4 = parseInt(answer4);
                console.log(num1);
                console.log(num2);
                console.log(num3);
                console.log(num4);
                rl.close();
            });
        });
    });
});
