import { Restaurant, Table, User, Reservation} from "./restaurant_class";

var RestaurantData: Restaurant[] = [];
var TableData: Table[] = [];
var UserData: User[] = [];
var ReservationData: Reservation[] = [];

//function to add restaurant
function addRestaurant(id: number, name: string, city: string, country: string){
    var newRestaurant = new Restaurant(id, name, city, country);
    RestaurantData.push(newRestaurant);
}

//function to add table
function addTable(id: number, number: number,available: boolean,  capacity: number, resid: number, resname: string){
    var newTable = new Table(id,number,available, capacity, resid, resname);
    TableData.push(newTable);
}


//function to add user
function addUser(id: number, name: string, email: string){
    var newUser = new User(id, name, email);
    UserData.push(newUser);
}

//function to add Reservation
function addReservation(id: number, date: Date, resid: number, tabnumber: number, userid: number, username: string){
    var newReservation = new Reservation (id, date, resid, tabnumber, userid, username);
    ReservationData.push(newReservation);
}

addRestaurant(1,"Dominos", "Ahmedabad", "India");
addRestaurant(2,"KFC", "New York", "USA");
addRestaurant(3, "Burger King", "Vadodara", "India");

addTable(1,1,true,4,1,"Dominos");
addTable(2,2,true,6,1,"Dominos");
addTable(3,3,false,8,1,"Dominos");
addTable(4,1,true,4,2,"KFC");
addTable(5,2,false,8,2,"KFC");
addTable(6,1,true,4,3,"Burger King");
addTable(7,2,false,6,3,"Burger King");

addUser(1, "Hiren Panchal", "hiren@gmail.com");
addUser(2, "Jai Shah", "jai@gmail.com");
addUser(3, "Jeet Parikh", "Jeet@gmail.com");

addReservation(1,new Date(2021,11,30,20,0O0,0O0,0O0),1,1,1,"Hiren Panchal");
addReservation(2,new Date(2021,12,0O1,19,30,0O0,0O0),3,1,2,"Jai Shah");


//Provide the list of restaurants in the country so that the user can choose accordingly.
function getRestaurants(country: string){
    RestaurantData.filter((restaurant) => {
        if(country == restaurant.RestaurantCountry){
            console.log(`RestaurantName: ${restaurant.RestaurantName}, RestaurantCity: ${restaurant.RestaurantCity}, RestaurantCountry: ${restaurant.RestaurantCountry}`);
        }
    })
}

getRestaurants("India");


//Provide the list of tables available for online reservation at different dining rooms in the restaurant.
function findAvailableTable(resName: string){
    TableData.filter((table) => {
        if(resName == table.RestaurantName){
            if(table.IsAvailable == true){
                console.log(`RestaurantName: ${table.RestaurantName}, TableNumber: ${table.TableNumber}, TableCapacity: ${table.TableCapacity}`);
            }
        }
    })
}

console.log("\nAvailable Tables");
findAvailableTable("Burger King");

//Mention the number of guests that can be accommodated on the particular table
function findTableCapacity(resName: string, tableNumber: number){
    TableData.filter((table) => {
        if(resName == table.RestaurantName && tableNumber == table.TableNumber){
            console.log(`RestaurantName: ${table.RestaurantName}, TableNumber: ${table.TableNumber}, TableCapacity: ${table.TableCapacity}`);
        }
    })
}

console.log("\nAvailable capacity on table");
findTableCapacity("KFC", 2);




