"use strict";
exports.__esModule = true;
exports.Customer = exports.Item = void 0;
var Item = /** @class */ (function () {
    function Item(id, name, qty) {
        this.item_id = id;
        this.item_name = name;
        this.item_quantity = qty;
    }
    return Item;
}());
exports.Item = Item;
var Customer = /** @class */ (function () {
    function Customer(id, name, phone, email) {
        this.cust_id = id;
        this.cust_name = name;
        this.cust_phone = phone;
        this.cust_email = email;
    }
    Customer.prototype.customer_detail = function () {
        console.log("id: ".concat(this.cust_id, "  --  name: ").concat(this.cust_name, "  --  phone: ").concat(this.cust_phone, "  --  email: ").concat(this.cust_email));
    };
    return Customer;
}());
exports.Customer = Customer;
