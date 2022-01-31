const fs = require("fs");

fs.writeFile("result.text", "Result data  ", function (err) {
  if (err) {
    console.log(err);
  }
});

// get multiple value from user
const inquirer = require("inquirer");

const questions = [
  {
    type: "input",
    name: "number1",
    message: "Give first number1: ",
  },
  {
    type: "input",
    name: "number2",
    message: "Give second number2: ",
  },
];

inquirer
  .prompt(questions)
  .then((answers) => {
    console.log(answers);
    return answers;
  })
  .then((obj) => {
    function Addition() {
      return parseInt(obj.number1) + parseInt(obj.number2);
    }
    function Subtraction() {
      return parseInt(obj.number1) - parseInt(obj.number2);
    }
    function Multiplication() {
      return parseInt(obj.number1) * parseInt(obj.number2);
    }
    function Division() {
      return parseInt(obj.number1) / parseInt(obj.number2);
    }

    var add = Addition();
    var sub = Subtraction();
    var mul = Multiplication();
    var div = Division();

    var result =
      " Addition " +
      add +
      "  " +
      " Subtraction " +
      sub +
      "  " +
      " Multiplication " +
      mul +
      "  " +
      " Division " +
      div +
      "  ";
      console.log(result);
      fs.appendFile("result.text", `${result}`, function (err) {
            if (err) {
              console.log(err);
            }
          });
  });
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// get value from user
// const readline = require("readline").createInterface({
//   input: process.stdin,
//   output: process.stdout,
// });

// readline.question(`Give two Numbers: `, (num1, num2) => {
//   var number1 = num1;
//   var number2 = num2;
//   console.log(number1, number2);

//   function Addition() {
//     return parseInt(number1) + parseInt(number2);
//   }
//   function Subtraction() {
//     return parseInt(number1) - parseInt(number2);
//   }
//   function Multiplication() {
//     return parseInt(number1) * parseInt(number2);
//   }
//   function Division() {
//     return parseInt(number1) / parseInt(number2);
//   }
//   var add = Addition();
//   // console.log(add);
//   var sub= Subtraction();
//   var mul = Multiplication();
//   var div = Division();
//   var result =
//     "Addition" +
//     add.toString() +
//     "  " +
//     "Subtraction" +
//     sub +
//     "  " +
//     "Multiplication" +
//     mul +
//     "  " +
//     "Division" +
//     div +
//     "  ";
//   // console.log(result);
//   fs.appendFile("result.text", `${result}`, function (err) {
//     if (err) {
//       console.log(err);
//     }
//   });
//   readline.close();
// });
