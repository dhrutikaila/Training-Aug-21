/*
Rambo Rental Bikes is looking for developing a system to calculate the rentals of the bikes. System should accept the customer details, bike details and calculate the rental charges.
DESCRIPTION OF PROJECTS
System allows users to add customer details with bike rented. It computes rent for each customer. Systems displays the Bike details with summation of days of hire and rental payment.
Note use get this Data @param ES6 class  Exports BikeNo,Phone,Noofdays and Charge.
 */

const data = require("./data")

class Mobike{
    constructor(bikeno,phone,name,days){
        this.bikeno = bikeno;
        this.phone = phone;
        this.name = name;
        this.days = days;
    }

    compute(){
        let charge = 0;
        let n = this.days;
        for(let i = 1;i<=n;i++){
            if(i<=5){
                charge += 500;
            }else if(i>5 && i<=10){
                charge += 400;
            }else{
                charge += 200;
            }
        }
        console.log(`Bike Number: ${this.bikeno}, Phone: ${this.phone}, Name: ${this.name}, Days: ${this.days}, charge: ${charge}`);
    }
}

data.forEach((e)=>{
    user = new Mobike(`${e.BikeNo}`,`${e.PhoneNo}`,`${e.name}`,`${e.NoOfDays}`)
    user.compute();
})