

//Restaurant interface
interface IRestaurant {
    RestaurantId: number;
    RestaurantName: string;
    RestaurantCity: string;
    RestaurantCountry: string;
}

//Restaurant Table interface
interface ITable {
    TableId: number;
    TableNumber: number;
    IsAvailable: boolean;
    TableCapacity: number;
    RestaurantId: number;
    RestaurantName: string;
}

//User interface
interface IUser{
    UserId: number;
    UserName: string;
    UserEmail: string;
}

//Table reservation interface
interface IReservation {
    ReservationId: number;
    ReservationForDate: Date;
    RestaurantId: number;
    TableNumber: number;
    UserId: number;
    UserName: string;
}

//Restaurant class
class Restaurant implements IRestaurant{
    RestaurantId: number;
    RestaurantName: string;
    RestaurantCity: string;
    RestaurantCountry: string;

    constructor(id: number, name: string, city: string, country: string){
        this.RestaurantId = id;
        this.RestaurantName = name;
        this.RestaurantCity = city;
        this.RestaurantCountry = country;
    }
}

//Restaurant table class
class Table implements ITable{
    TableId: number;
    TableNumber: number;
    IsAvailable: boolean;
    TableCapacity: number;
    RestaurantId: number;
    RestaurantName: string;
    
    constructor(id: number, number: number,availabale: boolean, capacity: number, resid: number, resname: string){
        this.TableId = number;
        this.TableNumber = number;
        this.IsAvailable = availabale;
        this.TableCapacity  = capacity;
        this. RestaurantId = resid;
        this.RestaurantName = resname;
    }
}

//User class
class User implements IUser{
    UserId: number;
    UserName: string;
    UserEmail: string;
    
    constructor(id: number, name: string, email: string){
        this.UserId = id;
        this.UserName = name;
        this.UserEmail = email;
    }
}

//Table Reservation  class
class Reservation implements IReservation{
    ReservationId: number;
    ReservationForDate: Date;
    RestaurantId: number;
    TableNumber: number;
    UserId: number;
    UserName: string;

    constructor(id: number, date: Date, resid: number, tabnumber: number, userid: number, username: string){
        this.ReservationId = id;
        this.ReservationForDate = date;
        this.RestaurantId = resid;
        this.TableNumber = tabnumber;
        this.UserId = userid;
        this.UserName = username
    }
}
    

export {Restaurant, Table, User, Reservation}