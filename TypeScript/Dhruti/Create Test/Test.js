//Online table reservation in the restaurant for specific date and time.
//This will Provide the list of restaurants in the country so that the user can choose accordingly.
//Provide the list of tables available for online reservation at different dining rooms in the restaurant.
//Mention the number of guests that can be accommodated on the particular table.
//Accept the booking for tables.
//Online table reservations are done 6hrs in advance for the current date.
//Table reservation can be done up to one month in advance.
//Give a token number to the customer as an acknowledgement of booking.
var restaurants = [
    { Id: 1, Name: "Star Restaurant", City: "Ahmedabad", Country: "India", OpenTime: "24 x 7", Rating: 3 },
    { Id: 2, Name: "Honest Restaurant", City: "Ahmedabad", Country: "India", OpenTime: "24 x 7", Rating: 5 },
    { Id: 3, Name: "Abc Restaurant", City: "New York", Country: "US", OpenTime: "24 x 7", Rating: 5 }
];
var diningRooms = [
    { Id: 1, Resaurant: 1 },
    { Id: 2, Resaurant: 2 },
    { Id: 3, Resaurant: 2 },
    { Id: 4, Resaurant: 3 },
    { Id: 5, Resaurant: 3 }
];
var diningTables = [
    { Id: 1, DiningRoom: 1, TableCapacity: 6, BookingPricePerHr: 300, IsBooked: false },
    { Id: 2, DiningRoom: 1, TableCapacity: 4, BookingPricePerHr: 200, IsBooked: false },
    { Id: 3, DiningRoom: 2, TableCapacity: 6, BookingPricePerHr: 300, IsBooked: false },
    { Id: 4, DiningRoom: 2, TableCapacity: 4, BookingPricePerHr: 200, IsBooked: false },
    { Id: 5, DiningRoom: 3, TableCapacity: 10, BookingPricePerHr: 500, IsBooked: false },
    { Id: 6, DiningRoom: 3, TableCapacity: 6, BookingPricePerHr: 300, IsBooked: false },
    { Id: 7, DiningRoom: 4, TableCapacity: 4, BookingPricePerHr: 200, IsBooked: false },
    { Id: 8, DiningRoom: 4, TableCapacity: 4, BookingPricePerHr: 200, IsBooked: false },
    { Id: 9, DiningRoom: 5, TableCapacity: 4, BookingPricePerHr: 200, IsBooked: false },
    { Id: 10, DiningRoom: 5, TableCapacity: 4, BookingPricePerHr: 200, IsBooked: false }
];
var bookings;
function BookMyTable(TotalGuests, oneGuestName, DiningTable, BookingDate, BookingHrs) {
    var today = new Date();
    if (BookingDate >= today) {
        today.setMonth(today.getMonth() + 1);
        if (BookingDate <= today) {
            today.setHours(today.getHours() + 6);
            if (BookingDate >= today) {
                var booking = { Id: 1, TotalGuests: TotalGuests, DiningTable: DiningTable, oneGuestName: oneGuestName, BookingDate: BookingDate, BookingHrs: BookingHrs };
                bookings.push(booking);
                return true;
            }
        }
    }
}
function GetRestaurantsList() {
    restaurants.forEach(function (i) {
        console.log("Restautant Id : ".concat(i.Id, ", Restautant Name : ").concat(i.Name, ", Ratings : ").concat(i.Rating, ", City : ").concat(i.City, ", Country : ").concat(i.Country, ", Opens for : ").concat(i.OpenTime));
    });
}
function GetAvailableTables(restaurantId) {
    restaurants.forEach(function (i) {
        if (i.Id == restaurantId) {
            console.log("Restautant Id : ".concat(i.Id, ", Restautant Name : ").concat(i.Name, ", Ratings : ").concat(i.Rating, ", City : ").concat(i.City, ", Country : ").concat(i.Country, ", Opens for : ").concat(i.OpenTime));
        }
    });
    for (var j = 0; j < diningRooms.length; j++) {
        if (diningRooms[j].Resaurant == restaurantId) {
            console.log("Dining room : ".concat(j + 1));
            for (var k = 0; k < diningTables.length; k++) {
                if (diningTables[k].DiningRoom == diningRooms[j].Id && diningTables[k].IsBooked == false) {
                    console.log("Dining Table : ".concat(k + 1, ", Table Capacity : ").concat(diningTables[k].TableCapacity, ", Charges per hour : ").concat(diningTables[k].BookingPricePerHr));
                }
            }
        }
    }
}
console.log("1.Get restaurants list\n2.Get availble dining table details\n3.Book dining table");
var choice = 1;
var bookingToken = 0;
switch (choice) {
    case 1:
        GetRestaurantsList();
        break;
    case 2:
        var restaurantId = 3;
        GetAvailableTables(restaurantId);
        break;
    case 3:
        var totalGuests = 3;
        var oneGuestName = "Kevin John";
        bookingToken += 1;
        var diningTable = 7;
        var bookingDate = new Date("2021/12/25 21:00");
        var bookingHrs = 2;
        var price;
        var bookingStatus = BookMyTable(totalGuests, oneGuestName, diningTable, bookingDate, bookingHrs);
        if (bookingStatus == true) {
            for (var _i = 0, diningTables_1 = diningTables; _i < diningTables_1.length; _i++) {
                var i = diningTables_1[_i];
                if (diningTable == i.Id) {
                    price = i.BookingPricePerHr;
                    break;
                }
            }
            console.log("Congratulations!Your table booked successfully!");
            console.log("Booking Details :- ");
            console.log("Token : ".concat(bookingToken, ", Table : ").concat(diningTable, ", Date : ").concat(bookingDate, ", Time : From ").concat(bookingDate.getHours(), " to ").concat(bookingDate.getHours() + 2, ", Charges per hour : ").concat(price, ",, Total booking charges : ").concat(price * bookingHrs));
        }
        else {
            console.log("Something went wrong!Please try again!!");
        }
    default:
        console.log("Invalid Choice!!");
        break;
}
