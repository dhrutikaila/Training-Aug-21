//Online table reservation in the restaurant for specific date and time.
 //This will Provide the list of restaurants in the country so that the user can choose accordingly.
//Provide the list of tables available for online reservation at different dining rooms in the restaurant.
//Mention the number of guests that can be accommodated on the particular table.
//Accept the booking for tables.
//Online table reservations are done 6hrs in advance for the current date.
//Table reservation can be done up to one month in advance.
//Give a token number to the customer as an acknowledgement of booking.

import { Table } from "./Restrunt.js";

export class Restaurants{
    RestaurantId : number;
    RestName : string;
    NoOfTables : number;
    FoodType : string;
    Table : Table[];

    constructor(resid :number,resname : string,notables : number,ftype : string,table : Array<Table>)
    {
        this.RestaurantId=resid;
        this.RestName = resname;
        this.NoOfTables = notables;
        this.FoodType = ftype;
        this.Table = table;

    }
    GetDetails(){
        console.log(`${this.RestaurantId} \t\t${this.RestName} \t\t${this.NoOfTables}  \t\t${this.FoodType}`);
    }

}

//Gives Restaurants list in the country
function GetRestaurants(restaurant :Array<Restaurants>){
    console.log("Restaurant ID \tRestaurant Name \tTotal Tables \tFood Type\n")
    for(var res of restaurant)
    {
        res.GetDetails();
    }
}

//Give Individual Restaurant Details with table availability
function GetRestaurantDetails(res : Restaurants){
    console.log("\n");
    console.log("Restaurant Name \tFood Type");
    console.log(`${res.RestName} \t\t${res.FoodType}`)
    console.log("\n");
    console.log("Tables Details : \n");
    console.log("Table Id \tGuest Capacity");
    for(var items of res.Table)
    {
        if(items.IsBooked !=true)
        {
            console.log(`${items.TableId} \t\t${items.GuestCapacity}`);
        }
    }
}

//To Book Table
function BookTable(res:Restaurants,tabid : number,date : Date) : void{
    let currdate = new Date();
    let bookid : number = 1;
    if(res.Table[tabid].IsBooked == true)
    {
        console.log("Table Already Booked");
        return;
    }
    else if((currdate.getMonth()-date.getMonth()) >= 1)
    {
        console.log("Too advance to book");
        return;
    }
    else if(((currdate.getDay() == date.getDay()) && ((currdate.getHours() - date.getHours()) < 6)))
    {
        console.log("Too late to book");
    }
    else{
        console.log("Table booked\n");
        console.log("Your Booking Details : ");
        console.log(`Booking Id : ${bookid++}`);
        console.log(`Booking Date : ${date}`);
        console.log(`Restaurant Name : ${res.RestName}`);
        console.log(`Table Id : ${tabid}`);
        return;
    }

}

//Created Table Object
let tabl :Array<Table> = [new Table(1,4,false),
    new Table(2,5,true)];

//Created Restaunts and passes table to each Restaurant
let res : Array<Restaurants> = [new Restaurants(1,"Rv Foods",3,"Indian",tabl),
new Restaurants(2,"Oneten Foods",5,"South Indian,Punjabi",tabl)];

//Calling Different Methods
GetRestaurants(res);
GetRestaurantDetails(res[0]);
BookTable(res[0],1,new Date(2021,11,28,13,0,0));
