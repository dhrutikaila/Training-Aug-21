"use strict";
exports.__esModule = true;
exports.Reservation = exports.User = exports.Table = exports.Restaurant = void 0;
//Restaurant class
var Restaurant = /** @class */ (function () {
    function Restaurant(id, name, city, country) {
        this.RestaurantId = id;
        this.RestaurantName = name;
        this.RestaurantCity = city;
        this.RestaurantCountry = country;
    }
    return Restaurant;
}());
exports.Restaurant = Restaurant;
//Restaurant table class
var Table = /** @class */ (function () {
    function Table(id, number, availabale, capacity, resid, resname) {
        this.TableId = number;
        this.TableNumber = number;
        this.IsAvailable = availabale;
        this.TableCapacity = capacity;
        this.RestaurantId = resid;
        this.RestaurantName = resname;
    }
    return Table;
}());
exports.Table = Table;
//User class
var User = /** @class */ (function () {
    function User(id, name, email) {
        this.UserId = id;
        this.UserName = name;
        this.UserEmail = email;
    }
    return User;
}());
exports.User = User;
//Table Reservation  class
var Reservation = /** @class */ (function () {
    function Reservation(id, date, resid, tabnumber, userid, username) {
        this.ReservationId = id;
        this.ReservationForDate = date;
        this.RestaurantId = resid;
        this.TableNumber = tabnumber;
        this.UserId = userid;
        this.UserName = username;
    }
    return Reservation;
}());
exports.Reservation = Reservation;
