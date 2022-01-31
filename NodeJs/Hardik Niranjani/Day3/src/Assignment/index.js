
const Bike = require('./Mobike');

const inquirer = require('inquirer');

const question = [
    {
        type:"input",
        name:"Bikeno",
        message:"Enter Bike no  "    
    },
    {
        type:"input",
        name:"Phoneno",
        message:"Enter Phone no " 
    },
    {
        type:"input",
        name:"Name",
        message:"Enter your name  " 
    },
    {
        type:"input",
        name:"Days",
        message:"Enter Days  " 
    },
];

inquirer.prompt(question).then((answer) => {
    return answer;
})
.then(({Bikeno,Phoneno,Name,Days})=>{
    const MoBike = new Bike(Bikeno,Phoneno,Name,Days);
    console.log(MoBike.compute());
})