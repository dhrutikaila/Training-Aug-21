var Details = [
    {
        "BikeNo": 1,
        "PhoneNo": 9925945577,
        "name": "Prit",
        "NoOfDays": 7
    },
    {
        "BikeNo": 2,
        "PhoneNo": 9925956577,
        "name": "Man",
        "NoOfDays": 4
    },
    {
        "BikeNo": 3,
        "PhoneNo": 9925956544,
        "name": "Tirth",
        "NoOfDays": 11
    }
]

class User{
    constructor(bikeno,phone,name,days){
        this.BikeNo = bikeno;
        this.PhoneNo = phone;
        this.name = name;
        this.NoOfDays = days;
    }
}

var user4 = new User(4,9988776655,"Raj",3)
var user5 = new User(5,9968776755,"Nirali",6)

Details.push(user4);
Details.push(user5);

module.exports = Details;
