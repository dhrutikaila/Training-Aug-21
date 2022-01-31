type restaurants = {
    restaurantName: string; 
    city: string;
    tables: number;
}
export var restaurants: restaurant[]=[];

export class restaurant{
    public addRestaurants(rname: string, cty: string, tbl: number): void{
        try {
            restaurant.apply({ restaurantName: rname, city: cty, tables: tbl});
            console.log(`Restaurant:\n`);
            console.log(`Restaurant: ${rname}\nCity: ${cty}\nAvailable Tables: ${tbl}\n`);
        }
        catch (e) {
            console.error(e);
        }
    }
}

type guest = {
    name: string;
    n_guests: number;
    date: Date;
}

export var guestss: guest[]=[];

export class guests{
    public addGuests(nm: string, ng: number, dt: Date): void{
        try {
            guests.apply({name: nm, n_guests: ng, date: dt});
            console.log("Guest details:");
            console.log(`Guest Name: ${nm}\nCo-guests together: ${ng}\nDate: ${dt}\n`);
        }
        catch(e){
            console.error(e);
        }
    }
}

export class booking {
    booking(){
        let bookdate= new Date();
            if (bookdate.hours < 6){
                console.log("Sorry booking can't be done this much soon!");
            }
            else{
                console.log("Booking can be done please choose your restaurant.")
            }
        let hotel: number;
            console.log(`Enter 1 for TGB\nEnter 2 for Hariyali Thali\nEnter 3 for The Grand Thakar`);
            switch(hotel){
                case 1:
                    console.log(`You chose TGB\nTables available there are 0`);
                    break;
                case 2:
                    console.log(`You chose Haroyali Thali\nTables available there are 80`);
                    break;
                case 3:
                    console.log(`You chose The Grand Thakar\nTables available there are 50`);
                    break;
                default:
                    console.log("Enter valid number!\n")
                    break;
            }
            

    }
}

export class availability{
    avail(){
    
    let avlbl: boolean;
    let table: number;
        if (avlbl == true){
            table=-table;
            console.log("Congratulations your booking has been done successfully.")
        }
        else{
            console.log("\nSorry! All tables are full.")
        }
    }
}