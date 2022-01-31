/*Do mathematical operation like Addition, subtraction, multiplication, div.
Use case statement.
Accept two numbers from the user from the command line. */

const fs = require("fs");

const rl = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

var add = (n1, n2) => {
  console.log(`Addition is ${n1 + n2}`);
  fs.writeFile("result.txt", `Addition is ${n1 + n2}`, (error) => {
    console.log("result file created");
  });
};

var sub = (n1, n2) => {
  console.log(`Substraction is ${n1 - n2}`);
  fs.writeFile("result.txt", `Substraction is ${n1 - n2}`, (error) => {
    console.log("result file created");
  });
};

var mul = (n1, n2) => {
  console.log(`Multiplication is ${n1 * n2}`);
  fs.writeFile("result.txt", `Multiplication is ${n1 * n2}`, (error) => {
    console.log("result file created");
  });
};

var div = (n1, n2) => {
  console.log(`Division is ${n1 / n2}`);
  fs.writeFile("result.txt", `Division is ${n1 / n2}`, (error) => {
    console.log("result file created");
  });
};

var calculate = (oper,n1,n2)=>{
    switch (oper) {
        case "add":
          add(n1, n2);
          break;
        case "sub":
          sub(n1, n2);
          break;
        case "mul":
          mul(n1, n2);
          break;
        case "div":
          div(n1, n2);
          break;
      }
}

rl.question(`Enter Operation - (add/sub/mul/div): `, (op) => {
  rl.question(`Enter number 1: `, (n1) => {
    rl.question(`Enter number 2: `, (n2) => {
      n1 = Number(n1);
      n2 = Number(n2);
      var isValidOp = false;

      var validOps = ["add", "sub", "mul", "div"];
      for (let o of validOps) {
        if (o == op) {
          isValidOp = true;
          break;
        }
      }

      if (!isValidOp) {
        rl.setPrompt(`Enter Valid Operation - (add/sub/mul/div): `);
        rl.prompt();
        rl.on("line", (input) => {
          var validOps = ["add", "sub", "mul", "div"];
          for (let o of validOps) {
            if (o == input) {
              isValidOp = true;
              calculate(input,n1,n2);
              rl.close();
            }
          }
          if(isValidOp == false){rl.prompt();}
        });
      }else{
        calculate(op,n1,n2);
        rl.close();
      }
    });
  });
});
