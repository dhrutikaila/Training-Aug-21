"use strict";
exports.__esModule = true;
exports.CheckAvailability = exports.Table = void 0;
var Table = /** @class */ (function () {
    function Table(x, gcap, ib) {
        this.TableId = x;
        this.GuestCapacity = gcap;
        this.IsBooked = ib;
    }
    return Table;
}());
exports.Table = Table;
function CheckAvailability() {
    if (this.IsBooked != true) {
        console.log("Available");
    }
}
exports.CheckAvailability = CheckAvailability;
