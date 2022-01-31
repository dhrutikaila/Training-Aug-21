"use strict";
exports.__esModule = true;
exports.AddReservation = exports.GetCustomer = exports.GetTable = exports.GetRestaurant = exports.AddCustomer = exports.Tabledata = exports.AddRestaurant = exports.TableType = void 0;
/*
Online table reservation in the restaurant for specific date and time. This will
    1 . Provide the list of restaurants in the country so that the user can choose accordingly.
    2 . Provide the list of tables available for online reservation at different dining rooms in the restaurant.
    3 . Mention the number of guests that can be accommodated on the particular table.
    4 . Accept the booking for tables.
    5 . Online table reservations are done 6hrs in advance for the current date.
    6 . Table reservation can be done up to one month in advance.
    7 . Give a token number to the customer as an acknowledgement of booking.
*/
var TableType;
(function (TableType) {
    TableType[TableType["Two to Four person"] = 0] = "Two to Four person";
    TableType[TableType["Family dining"] = 1] = "Family dining";
    TableType[TableType["High Top table"] = 2] = "High Top table";
})(TableType = exports.TableType || (exports.TableType = {}));
var Restaurant = /** @class */ (function () {
    function Restaurant(id, name, city, state, country) {
        this.RestaurantId = id;
        this.RestaurantName = name;
        this.City = city;
        this.State = state;
        this.Country = country;
    }
    return Restaurant;
}());
var Table = /** @class */ (function () {
    function Table(id, resid, no, type) {
        this.TableId = id;
        this.RestaurantId = resid;
        this.NoOfTable = no;
        this.type = type;
    }
    return Table;
}());
var Customer = /** @class */ (function () {
    function Customer(id, name, phoneno) {
        this.CustomerId = id;
        this.CustomerName = name;
        this.PhoneNumber = phoneno;
    }
    return Customer;
}());
var ReservationTable = /** @class */ (function () {
    function ReservationTable(id, cusid, resid, tableid, date, time, guest) {
        this.ReservationId = id;
        this.CustomerId = cusid;
        this.RestaurantId = resid;
        this.TableId = tableid;
        this.date = date;
        this.Time = time;
        this.NoOfGuest = guest;
    }
    return ReservationTable;
}());
var restaurant = [];
var table = [];
var customer = [];
var reservation = [];
function AddRestaurant(resid, resname, city, state, country) {
    restaurant.push(new Restaurant(resid, resname, city, state, country));
}
exports.AddRestaurant = AddRestaurant;
function Tabledata(id, resid, nooftable, type) {
    for (var _i = 0, restaurant_1 = restaurant; _i < restaurant_1.length; _i++) {
        var i = restaurant_1[_i];
        if (i.RestaurantId == resid) {
            table.push(new Table(id, resid, nooftable, type));
            return;
        }
    }
    console.log("Restaurant not found");
}
exports.Tabledata = Tabledata;
function AddCustomer(id, name, phone) {
    customer.push(new Customer(id, name, phone));
}
exports.AddCustomer = AddCustomer;
function GetRestaurant() {
    console.log("RestaurantId \t RestaurantName \t City \t\t State \t\t country");
    restaurant.forEach(function (i) {
        console.log("".concat(i.RestaurantId, " \t\t ").concat(i.RestaurantName, " \t\t ").concat(i.City, " \t ").concat(i.State, " \t ").concat(i.Country));
    });
}
exports.GetRestaurant = GetRestaurant;
function GetTable() {
    console.log("TableId  RestaurantId \t TableType \t nooftable ");
    table.forEach(function (i) {
        console.log(" ".concat(i.TableId, " \t\t").concat(i.RestaurantId, " \t ").concat(i.type, "\t\t").concat(i.NoOfTable));
    });
}
exports.GetTable = GetTable;
function GetCustomer() {
    console.log("CustomerId  CustomerName \t PhoneNumber");
    customer.forEach(function (i) {
        console.log(" ".concat(i.CustomerId, " \t\t ").concat(i.CustomerName, " \t ").concat(i.PhoneNumber));
    });
}
exports.GetCustomer = GetCustomer;
function AddReservation(reservationid, cusid, resid, tableid) {
}
exports.AddReservation = AddReservation;
