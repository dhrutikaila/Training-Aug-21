type RestaurantName = {
    Id: number
    Name: string
    City: string
}

type DiningRoom = {
    Id: number
    Resaurant: number
}

type DiningTable = {
    Id: number
    DiningRoom: number
    TableCapacity: number
    Price: number
    IsBooked: boolean
}

type Booking = {
    Id: number
    totalMember: number
    oneMemberName: string
    DiningTable: number
    BookingDate: Date
}

var restaurants: RestaurantName[] = [
    { Id: 1, Name: "Panchvati Restaurant", City: "Botad"},
    { Id: 2, Name: "Malhar Dhosa", City: "Botad"},
    { Id: 3, Name: "Pavilion", City: "Surat"},
    { Id: 4, Name: "Pizza Point", City: "Botad"},
    { Id: 5, Name: "lapinoze Pizza", City: "Surat"},
    { Id: 6, Name: "POPS", City: "Ahmdabad"}

]

var diningRooms: DiningRoom[] = [
    { Id: 1, Resaurant: 1 },
    { Id: 2, Resaurant: 2 },
    { Id: 3, Resaurant: 3 },
    { Id: 4, Resaurant: 4 },
    { Id: 5, Resaurant: 5 },
    { Id: 6, Resaurant: 1 },
    { Id: 7, Resaurant: 2 },
    { Id: 8, Resaurant: 3 },
    { Id: 9, Resaurant: 4 },
    { Id: 10, Resaurant: 5 }

]

var diningTables: DiningTable[] = [
    { Id: 1, DiningRoom: 1, TableCapacity: 6, Price: 300, IsBooked: false },
    { Id: 2, DiningRoom: 1, TableCapacity: 4, Price: 200, IsBooked: false },
    { Id: 3, DiningRoom: 2, TableCapacity: 6, Price: 300, IsBooked: false },
    { Id: 4, DiningRoom: 2, TableCapacity: 4, Price: 200, IsBooked: false },
    { Id: 5, DiningRoom: 3, TableCapacity: 10, Price: 500, IsBooked: false },
]

var bookings: Booking[]

function BookTable(TotalGuests: number, oneGuestName: string, DiningTable: number, BookingDate: Date): boolean {
    var today: Date = new Date()
    if (BookingDate >= today) {
        today.setMonth(today.getMonth() + 1)
            if (BookingDate >= today) {
                var booking: Booking = { Id: 1, totalMember: totalMember, DiningTable: DiningTable, oneMemberName: oneGuestName, BookingDate: BookingDate}
                bookings.push(booking)
                return true
            }
        }
    }

function RestaurantsList(): void {
    restaurants.forEach(i => {
        console.log("Restautant Id : " + i.Id);
        console.log("Restautant Name : "+ i.Name);
        console.log("City : " + i.City);
    });
}

function AvailableTables(restaurantId: number) {

    restaurants.forEach(i => {
        if (i.Id == restaurantId) {
            console.log("Restautant Id : " + i.Id);
            console.log("Restautant Name : " + i.Name);
            console.log("City : " + i.City);
        }
    });

    for (var i = 0; i < diningRooms.length; i++) {
        if (diningRooms[j].Resaurant == restaurantId) {
            console.log(`Dining room : ${i + 1}`)
            for (var j = 0; j < diningTables.length; j++) {
                if (diningTables[j].DiningRoom == diningRooms[j].Id && diningTables[j].IsBooked == false) {
                    console.log(`Dining Table : ${j + 1}, Table Capacity : ${diningTables[j].TableCapacity}, Total Charge : ${diningTables[j].Price}`)
                }
            }
        }
    }
}

console.log("1.Get restaurants list")
console.log("2.Get availble dining table")
console.log("3.Book dining table")


var choice: number = 1
var bookingToken: number = 0
switch (choice) {
    case 1:
        RestaurantsList()
        break
    case 2:
        var restaurantId: number = 3
        AvailableTables(restaurantId)
        break
    case 3:
        var totalMember: number = 3
        var oneGuestName: string = "Rutvik Kalasha"
        bookingToken += 1
        var diningTable: number = 7
        var bookingDate: Date = new Date("2021/12/29 4:00PM")
        var price: number
        var bookingStatus: boolean = BookTable(totalMember, oneGuestName, diningTable, bookingDate)
        if (bookingStatus == true) {
            for (var i of diningTables) {
                if (diningTable == i.Id) {
                    price = i.Price
                    break
                }
            }
            console.log("Your table booked successfully!")
            console.log("Booking Details :- ")
        }
        else {
            console.log("Please try again!!")
        }
    default:
        console.log("Error!!")
        break
}
