"use strict";
exports.__esModule = true;
exports.Booking = void 0;
var Booking = /** @class */ (function () {
    function Booking(id, restId, TId, Booking, UId, UName) {
        this.Id = id;
        this.RestaurantId = restId;
        this.TableId = TId;
        this.BookingTime = Booking;
        this.UserId = UId;
        this.UserName = UName;
    }
    return Booking;
}());
exports.Booking = Booking;
