"use strict";
// Online table reservation for specific date & time, list of restaurants, number of available tables, guest count, booking can be done or not based on timing, token on successfull booking.
exports.__esModule = true;
var Modules_1 = require("./Modules");
var r = new Modules_1.restaurant();
r.addRestaurants("TGB", "Ahmedabad", 0);
r.addRestaurants("Hariyali Thali", "Vadodara", 80);
r.addRestaurants("The Grand Thakar", "Ahmedabad", 50);
var g = new Modules_1.guests();
g.addGuests("Leo Messi", 5, new Date);
var b = new Modules_1.booking();
b.booking();
console.log(1);
var a = new Modules_1.availability();
a.avail();
