
interface IBooking{
    Id: number,
    RestaurantId:number,
    TableId:number,
    BookingTime:Date,
    UserId:number,
    UserName:string
}

class Booking implements IBooking {
    Id: number;
    RestaurantId:number;
    TableId:number;
    BookingTime:Date;
    UserId:number;
    UserName:string;


    constructor(id:number, restId:number, TId:number, Booking:Date, UId:number, UName:string){
        this.Id = id;
        this.RestaurantId = restId;
        this.TableId = TId;
        this.BookingTime = Booking;
        this.UserId = UId;
        this.UserName = UName;
    }
}


export {Booking}
