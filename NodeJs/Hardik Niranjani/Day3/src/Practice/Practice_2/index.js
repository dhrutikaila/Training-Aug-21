// Create Rectangle.js and compute AreaofRectangle and perimeter of Rectangle, and exports area and perimeter of rectangle


const inquirer = require('inquirer');
const rectangle = require("./Rectangle");

const question = [
    {
        type:"input",
        name:"width",
        message:"Give Width of rectangle "    
    },
    {
        type:"input",
        name:"height",
        message:"Give Height of rectangle " 
    },
];

inquirer.prompt(question).then((answer) => {
    return answer;
}).then((obj)=>{

    var Area = rectangle.Area(obj.width,obj.height);
    var Perimeter = rectangle.Perimeter(obj.width,obj.height);
        console.log("Area " + Area + " " + " Perimeter " + Perimeter );
})