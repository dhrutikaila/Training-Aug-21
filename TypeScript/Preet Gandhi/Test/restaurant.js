"use strict";
exports.__esModule = true;
var restaurant_class_1 = require("./restaurant_class");
var RestaurantData = [];
var TableData = [];
var UserData = [];
var ReservationData = [];
//function to add restaurant
function addRestaurant(id, name, city, country) {
    var newRestaurant = new restaurant_class_1.Restaurant(id, name, city, country);
    RestaurantData.push(newRestaurant);
}
//function to add table
function addTable(id, number, available, capacity, resid, resname) {
    var newTable = new restaurant_class_1.Table(id, number, available, capacity, resid, resname);
    TableData.push(newTable);
}
//function to add user
function addUser(id, name, email) {
    var newUser = new restaurant_class_1.User(id, name, email);
    UserData.push(newUser);
}
//function to add Reservation
function addReservation(id, date, resid, tabnumber, userid, username) {
    var newReservation = new restaurant_class_1.Reservation(id, date, resid, tabnumber, userid, username);
    ReservationData.push(newReservation);
}
addRestaurant(1, "Dominos", "Ahmedabad", "India");
addRestaurant(2, "KFC", "New York", "USA");
addRestaurant(3, "Burger King", "Vadodara", "India");
addTable(1, 1, true, 4, 1, "Dominos");
addTable(2, 2, true, 6, 1, "Dominos");
addTable(3, 3, false, 8, 1, "Dominos");
addTable(4, 1, true, 4, 2, "KFC");
addTable(5, 2, false, 8, 2, "KFC");
addTable(6, 1, true, 4, 3, "Burger King");
addTable(7, 2, false, 6, 3, "Burger King");
addUser(1, "Hiren Panchal", "hiren@gmail.com");
addUser(2, "Jai Shah", "jai@gmail.com");
addUser(3, "Jeet Parikh", "Jeet@gmail.com");
addReservation(1, new Date(2021, 11, 30, 20, 0, 0, 0), 1, 1, 1, "Hiren Panchal");
addReservation(2, new Date(2021, 12, 1, 19, 30, 0, 0), 3, 1, 2, "Jai Shah");
//Provide the list of restaurants in the country so that the user can choose accordingly.
function getRestaurants(country) {
    RestaurantData.filter(function (restaurant) {
        if (country == restaurant.RestaurantCountry) {
            console.log("RestaurantName: ".concat(restaurant.RestaurantName, ", RestaurantCity: ").concat(restaurant.RestaurantCity, ", RestaurantCountry: ").concat(restaurant.RestaurantCountry));
        }
    });
}
getRestaurants("India");
//Provide the list of tables available for online reservation at different dining rooms in the restaurant.
function findAvailableTable(resName) {
    TableData.filter(function (table) {
        if (resName == table.RestaurantName) {
            if (table.IsAvailable == true) {
                console.log("RestaurantName: ".concat(table.RestaurantName, ", TableNumber: ").concat(table.TableNumber, ", TableCapacity: ").concat(table.TableCapacity));
            }
        }
    });
}
console.log("\nAvailable Tables");
findAvailableTable("Burger King");
//Mention the number of guests that can be accommodated on the particular table
function findTableCapacity(resName, tableNumber) {
    TableData.filter(function (table) {
        if (resName == table.RestaurantName && tableNumber == table.TableNumber) {
            console.log("RestaurantName: ".concat(table.RestaurantName, ", TableNumber: ").concat(table.TableNumber, ", TableCapacity: ").concat(table.TableCapacity));
        }
    });
}
console.log("\nAvailable capacity on table");
findTableCapacity("KFC", 2);
