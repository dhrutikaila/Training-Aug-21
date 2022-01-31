"use strict";
exports.__esModule = true;
exports.availability = exports.booking = exports.guests = exports.guestss = exports.restaurant = exports.restaurants = void 0;
exports.restaurants = [];
var restaurant = /** @class */ (function () {
    function restaurant() {
    }
    restaurant.prototype.addRestaurants = function (rname, cty, tbl) {
        try {
            restaurant.apply({ restaurantName: rname, city: cty, tables: tbl });
            console.log("Restaurant:\n");
            console.log("Restaurant: ".concat(rname, "\nCity: ").concat(cty, "\nAvailable Tables: ").concat(tbl, "\n"));
        }
        catch (e) {
            console.error(e);
        }
    };
    return restaurant;
}());
exports.restaurant = restaurant;
exports.guestss = [];
var guests = /** @class */ (function () {
    function guests() {
    }
    guests.prototype.addGuests = function (nm, ng, dt) {
        try {
            guests.apply({ name: nm, n_guests: ng, date: dt });
            console.log("Guest details:");
            console.log("Guest Name: ".concat(nm, "\nCo-guests together: ").concat(ng, "\nDate: ").concat(dt, "\n"));
        }
        catch (e) {
            console.error(e);
        }
    };
    return guests;
}());
exports.guests = guests;
var booking = /** @class */ (function () {
    function booking() {
    }
    booking.prototype.booking = function () {
        var bookdate = new Date();
        if (bookdate.hours < 6) {
            console.log("Sorry booking can't be done this much soon!");
        }
        else {
            console.log("Booking can be done please choose your restaurant.");
        }
        var hotel;
        console.log("Enter 1 for TGB\nEnter 2 for Hariyali Thali\nEnter 3 for The Grand Thakar");
        switch (hotel) {
            case 1:
                console.log("You chose TGB\nTables available there are 0");
                break;
            case 2:
                console.log("You chose Haroyali Thali\nTables available there are 80");
                break;
            case 3:
                console.log("You chose The Grand Thakar\nTables available there are 50");
                break;
            default:
                console.log("Enter valid number!\n");
                break;
        }
    };
    return booking;
}());
exports.booking = booking;
var availability = /** @class */ (function () {
    function availability() {
    }
    availability.prototype.avail = function () {
        var avlbl;
        var table;
        if (avlbl == true) {
            table = -table;
            console.log("Congratulations your booking has been done successfully.");
        }
        else {
            console.log("\nSorry! All tables are full.");
        }
    };
    return availability;
}());
exports.availability = availability;
