class Mobike{
    constructor(BikeNumber,PhoneNumber,Name,Days){
        this.BikeNumber = BikeNumber;
        this.PhoneNumber = PhoneNumber;
        this.Name = Name;
        this.Days = Days;
    }

    compute(){
        var res = 0;
        var Day5 = 2500;
        var Day10 = 2000;
        if(this.Days <=5){
            res = 500*(this.Days);
        }
        else if (this.Days >5 && this.Days<=10){
            res = Day5 + 400*(this.Days - 5);
        }

        else {
            res = Day5 + Day10 + 200*(this.Days - 10);
        }
        return res;
     }
}

module.exports = Mobike;