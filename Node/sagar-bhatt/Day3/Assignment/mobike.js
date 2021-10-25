const chalk = require("chalk");

class Mobike {
  constructor(name, phoneNumber, bikeNumber, days) {
    this.bikeNumber = bikeNumber;
    this.phoneNumber = phoneNumber;
    this.name = name;
    this.days = days;
  }
  compute() {
    let totalCharge = 0;
    if (this.days <= 5) {
      totalCharge = this.days * 500;
    }
    if (this.days > 5 && this.days <= 10) {
      totalCharge = 2500 + (this.days - 5) * 400;
    }
    if (this.days > 10) {
      totalCharge = 4500 + (this.days - 10) * 200;
    }
    if (this.days <= 0) {
      totalCharge = "No Charges";
    }
    console.log(
      chalk.yellow(`Name\tBike No\tPhone No\tNo of days\ttotalCharge`)
    );
    console.log(
      chalk.green(
        `${this.name} \t ${this.bikeNumber} \t ${this.phoneNumber} \t ${this.days} \t ${totalCharge}`
      )
    );
  }
}

module.exports = { Mobike };
