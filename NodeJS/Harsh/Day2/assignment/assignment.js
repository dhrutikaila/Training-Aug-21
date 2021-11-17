var fs = require("fs");

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})

readline.question(`What's your number1?`, x => {
    x = parseInt(x);


    readline.question(`What's your number2?`, y => {
        y = parseInt(y);

        readline.question(`What's your choice`, ch => {

            switch (parseInt(ch)) {
                case 1: add(x, y); break;
                case 2: sub(x, y); break;
                case 3: mul(x, y); break;
                case 4: div(x, y); break;
                default: console.log("no choice");
            }
            readline.close();
        });

    })
})


var writefile = (ans) => {
    fs.writeFile("text.txt", ans, (err) => {
        if (err) { throw err }
    })
}


var add = (a, b) => {
    writefile(`addition : ${a + b}`);
}
var sub = (a, b) => {
    writefile(`subtraction: : ${a - b}`);
}

var mul = (a, b) => {
    writefile(`multiplication : ${a * b}`);
}

var div = (a, b) => {
    writefile(`division : ${a / b}`);
}



