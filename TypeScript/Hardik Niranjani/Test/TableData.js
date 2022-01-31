"use strict";
exports.__esModule = true;
exports.Table = void 0;
var Table = /** @class */ (function () {
    function Table(id, RestId, TCapacity, RestName) {
        this.Id = id;
        this.RestaurantId = RestId;
        this.RestaurantName = RestName;
        this.TableCapacity = TCapacity;
    }
    return Table;
}());
exports.Table = Table;
