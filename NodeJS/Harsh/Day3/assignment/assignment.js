class Mobike {

    constructor(Name, BikeNumber, PhoneNumber, Days) {
        this.Name = Name;
        this.BikeNumber = BikeNumber;
        this.PhoneNumber = PhoneNumber;
        this.Days = Days;
    }
    Compute() {
        var charge = 0;

        if (this.Days <= 5) {
            charge = this.Days * 500;
        }
        else if (this.Days <= 10) {
            charge = 2500 + (this.Days - 5) * 400;
        }
        else { charge = 4500 + (this.Days - 10) * 200 }
        console.log("Name BikeNumber PhoneNumber Days");
        console.log(this.Name, this.BikeNumber, this.PhoneNumber, this.Days, charge)
    }

}

module.exports = { Mobike };
