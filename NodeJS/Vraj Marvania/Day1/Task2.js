// Rambo Rental Bikes is looking for developing a system to calculate the rentals of the bikes. System should accept the customer details, bike details and calculate the rental charges.
//  DESCRIPTION OF PROJECTS
// System allows users to add customer details with bike rented. It computes rent for each customer. Systems displays the Bike details with summation of days of hire and rental payment.   FUNCTIONALITY AND TASK
// Define a class called Mobike with the following description: 
// Instance variables/data members: 
// BikeNumber – to store the bike’s number
// PhoneNumber – to store the phone number of the customer
// Name – to store the name of the customer
// Days – to store the number of days the bike is taken on rent o charge – to calculate and store the rental charge
// Member methods:
// void Compute( )
// – to compute the rental charge
// Bike No.         PhoneNo             No. of days         Charge
//  The rent for a mobike is charged on the following basis:
// First five days Rs 500 per day
// Next five days Rs 400 per day
// Rest of the days Rs 200 per day
// Note use get this Data @param ES6 class  Exports BikeNo,Phone,Noofdays and Charge.



class Mobike {
    set_data(BikeNumber, PhoneNumber, Name, Days) {
        this.BikeNumber = BikeNumber;
        this.PhoneNumber = PhoneNumber;
        this.Name = Name;
        this.Days = Days;
        this.Compute()

        
    }
    get display_data()
    {
         return ([this.BikeNumber ,this.PhoneNumber, this.Name ,this.Days,this.cost]);
    }
    Compute() {
        var temp = 0;
        var daytemp = this.Days;
        if (daytemp <= 5) {
            temp += (daytemp * 500)
        }
        else {
            temp += (5 * 500)

            daytemp -= 5;
            if (daytemp <= 5) {
                temp += (daytemp * 400)
                }
            else {
                temp += (5 * 400)
                    daytemp -= 5;
                if (daytemp > 0) {
                    temp += (daytemp * 200)
                            daytemp -= daytemp;
                }
            }

        }
        this.cost=temp;
    }
}

var m1 = new Mobike()
m1.set_data("2m31", 234232323, "vishal", 6)
console.log(m1.display_data)

m1.set_data("54682", 99999929, "vivek", 5)
console.log(m1.display_data)

m1.set_data("54682", 99999929, "vivek", 5)
console.log(m1.display_data)


