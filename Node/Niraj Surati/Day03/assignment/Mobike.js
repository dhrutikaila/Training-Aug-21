let chalk = require('chalk');
class MoBike{
    constructor(bikeNumber, phoneNumber, name, days){
        this.bikeNumber = bikeNumber;
        this.phoneNumber = phoneNumber;
        this.name = name;
        this.days = days;
    }
    compute(){
        let charge = 0;
        if(this.days <=5){
            charge = this.days * 500;
        }
        if(this.days>5 && this.days<=10){
            charge = 2500 + ((this.days - 5) * 400);
        }
        if(this.days>10){
            charge = 4500 + ((this.days - 10) * 200);
        }
        if(this.days <= 0){
            charge = "No charges";
        }
        console.log(chalk.yellow('Name\t\tBike No.\tPhoneNo\t\tNo. of days\tCharge'))
        console.log(`${this.name}\t${this.bikeNumber}\t${this.phoneNumber}\t${this.days}\t\t${charge}`);
    }
}
module.exports = {MoBike};