
interface IRestaurant {
    Id:number,
    RestaurantName:string,
    NumberOfTables:number,
    Country:string
}

class Restaurant implements IRestaurant {
    Id:number;
    RestaurantName:string;
    NumberOfTables:number;
    Country:string

    constructor(id:number, rName:string, Tables:number, country:string) {
        this.Id = id;
        this.RestaurantName = rName;
        this.NumberOfTables = Tables;
        this.Country = country;
    }

}


export {Restaurant};