
interface ITable {
    Id:number,
    RestaurantId:number,
    RestaurantName:string,
    TableCapacity:number,

}


class Table implements ITable {
    Id:number;
    RestaurantId:number;
    RestaurantName:string;
    TableCapacity:number;

    constructor(id:number, RestId:number, TCapacity:number,RestName:string) {
        this.Id = id;
        this.RestaurantId = RestId;
        this.RestaurantName = RestName;
        this.TableCapacity = TCapacity;
    }
}


export {Table}