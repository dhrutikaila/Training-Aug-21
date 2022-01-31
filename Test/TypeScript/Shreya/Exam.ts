/*
Online table reservation in the restaurant for specific date and time. This will
    1 . Provide the list of restaurants in the country so that the user can choose accordingly.
    2 . Provide the list of tables available for online reservation at different dining rooms in the restaurant.
    3 . Mention the number of guests that can be accommodated on the particular table.
    4 . Accept the booking for tables.
    5 . Online table reservations are done 6hrs in advance for the current date.
    6 . Table reservation can be done up to one month in advance.
    7 . Give a token number to the customer as an acknowledgement of booking.
*/
export enum TableType{
    "Two to Four person",
    "Family dining",
    "High Top table"
}

class Restaurant {
    RestaurantId : number
    RestaurantName : string
    City : string
    State : string
    Country : string

    constructor(id : number , name : string , city : string , state : string , country : string ) {
        this.RestaurantId = id;
        this.RestaurantName = name;
        this.City = city;
        this.State = state ;
        this.Country = country;
    }
}

class Table
{
    TableId : number
    RestaurantId : number
    NoOfTable : number
    type : string
    constructor(id : number , resid : number , no : number ,type:string)
    {
        this.TableId = id ;
        this.RestaurantId = resid;
        this.NoOfTable = no ;
        this.type = type
    }
}

class Customer {
    CustomerId : number ;
    CustomerName : string ;
    PhoneNumber : string

    constructor(id : number , name : string , phoneno : string) {
       this.CustomerId = id ;
       this.CustomerName = name ;
       this.PhoneNumber = phoneno;
    }
}


class ReservationTable
{
    ReservationId : number;
    CustomerId : number ;
    RestaurantId : number ;
    TableId : number;
    date : Date;
    Time : Date;
    NoOfGuest : number
    constructor(id  : number , cusid : number , resid : number , tableid : number  , date : Date , time : Date , guest : number)
    {
        this.ReservationId = id ;
        this.CustomerId = cusid;
        this.RestaurantId = resid;
        this.TableId  = tableid;
        this.date = date;
        this.Time = time;
        this.NoOfGuest = guest
    }
}

var restaurant : Restaurant[] = []
var table : Table[] = []
var customer : Customer[] = []
var reservation : ReservationTable[] = []

export function AddRestaurant(resid : number , resname : string , city : string , state : string , country : string)
{
        restaurant.push(new Restaurant(resid ,resname , city ,state , country  ))
}

export function Tabledata(id : number , resid : number,nooftable : number , type : string){
    for(var i of restaurant){
        if(i.RestaurantId == resid) {
            table.push(new Table(id , resid,nooftable,type))
            return
        }
    }
    console.log("Restaurant with  found")
}

export function AddCustomer(id : number , name : string , phone : string)
{
    customer.push(new Customer(id , name , phone))
}
export function GetRestaurant():void
{
    console.log("RestaurantId \t RestaurantName \t City \t\t State \t\t country")
    restaurant.forEach(i=>{
        console.log(`${i.RestaurantId} \t\t ${i.RestaurantName} \t\t ${i.City} \t ${i.State} \t ${i.Country}`)
    })
}

export function GetTable() : void {
    console.log("TableId  RestaurantId \t TableType \t nooftable ")
    table.forEach(i=>{
        console.log(` ${i.TableId} \t\t${i.RestaurantId} \t ${i.type}\t\t${i.NoOfTable}`)
    })
}

export function GetCustomer() : void {
    console.log("CustomerId  CustomerName \t PhoneNumber")
    customer.forEach(i=>{
        console.log(` ${i.CustomerId} \t\t ${i.CustomerName} \t ${i.PhoneNumber}`)
    })
}

export function AddReservation( reservationid : number , cusid : number , resid : number ,tableid : number,time : Date,date:Date,guest:number ){
   for(var i of table){
        if(i.TableId == tableid){
            var d = new Date();
            var timed = d.setHours(d.getHours()-6)
            if(time.getHours() > timed){
                    console.log("Not book !!")
            }
            reservation.push(new ReservationTable(reservationid,cusid,resid,tableid,date,time,guest))
        }
   }
}


