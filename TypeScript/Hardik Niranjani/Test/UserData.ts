
interface IUser {
    Id:number,
    UserName:string,
    UserPhoneNumber:number,
    UserCity:string
}

class User implements IUser{
    Id:number;
    UserName:string;
    UserPhoneNumber:number;
    UserCity:string


    constructor(id:number, userName:string, userPhoneNumber:number, userCity:string){
        this.Id = id;
        this.UserName = userName;
        this.UserPhoneNumber = userPhoneNumber;
        this.UserCity = userCity;
    }
}

export {User}