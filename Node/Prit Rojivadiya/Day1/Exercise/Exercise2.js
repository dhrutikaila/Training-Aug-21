/*
Rambo Rental Bikes is looking for developing a system to calculate the rentals of the bikes. 
System should accept the customer details, bike details and calculate the rental charges.
*/

class Mobike{
    constructor(bikeNo,PhoneNum,Name,Days){
        this.bikeNo = bikeNo;
        this.PhoneNum = PhoneNum;
        this.Name = Name;
        this.Days = Days;
    }

    compute(){
        let charge = 0;
        let n = this.Days;
        for(let i = 1;i<=n;i++){
            if(i<=5){
                charge += 500;
            }else if(i>5 && i<=10){
                charge += 400;
            }else{
                charge += 200;
            }
        }
        console.log(`Bike Number: ${this.bikeNo}, Phone: ${this.PhoneNum}, Name: ${this.Name}, Days: ${this.Days}, charge: ${charge}`);
    }
}

var customer1 = new Mobike(1,9925973311,"Prit",7);
customer1.compute();
var customer2 = new Mobike(3,9925973355,"Man",5);
customer2.compute();
var customer3 = new Mobike(2,9925973388,"Tirth",11);
customer3.compute();