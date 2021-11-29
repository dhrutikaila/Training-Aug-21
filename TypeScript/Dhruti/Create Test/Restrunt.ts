export class Table{
    TableId : number;
    GuestCapacity : number;
    IsBooked : boolean;
    constructor(x : number,gcap:number,ib?:boolean){
        this.TableId=x;
        this.GuestCapacity=gcap;
        this.IsBooked = ib;
    }
}

export function CheckAvailability()
{
    if(this.IsBooked != true)
    {
        console.log("Available");
    }

}