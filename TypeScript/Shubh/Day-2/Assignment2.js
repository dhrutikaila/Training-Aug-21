// There is a retail shop which need to manage the inventory, whenever some purchase is being made product quantity should be reduced, if quantity is less than 5 increase request should be raised. Design an interface and classes for the same.
var RetailShop = /** @class */ (function () {
    function RetailShop(qunatity) {
        // Checking & Updating Stock on Instance creation
        this.Stock = qunatity;
        if (this.Stock < 5) // Raising Reorder Request When Quanity < 5 
         {
            this.increase(100);
        }
    }
    // Purchase Method
    RetailShop.prototype.purchase = function (quantity) {
        if (quantity > this.Stock) {
            console.log("\nSorry! Your order can't be placed as we are running out of stock\nPlease visit soon!\n");
            this.increase(quantity);
            return;
        }
        this.Stock = this.Stock - quantity; // Reducing Stock After Order
        console.log("Order for ".concat(quantity, " units has been placed\nPlease visit again!"));
        console.log("Remaining stock in inventory is: ".concat(this.Stock)); // Quantity + Remaining Stock Nums
        // Raising Reorder Request When Quanity < 5 
        if (this.Stock < 5) {
            this.increase(100);
        }
    };
    RetailShop.prototype.increase = function (quantity) {
        // Procedure Of Ordering To Supplier For Restocking
        console.log("Request for increasing inventory with ".concat(quantity, " units has been placed.\n"));
        this.Stock += quantity; // updating stock of shop
        console.log("Inventory has been Restocked, Avaliable Stock: ".concat(this.Stock));
        // Re-ordering after stock is updated
        this.Stock = this.Stock - quantity; // Reducing Stock After Order
        console.log("Order for ".concat(quantity, " units has been placed"));
        console.log("Remaining stock in inventory is: ".concat(this.Stock, "\n")); // Quantity + Remaining Stock Nums
    };
    return RetailShop;
}());
//intialize a retail shop instance
var retialShop = new RetailShop(100); //RetailShop instance
retialShop.purchase(196);
retialShop.purchase(16);
retialShop.purchase(60);
retialShop.purchase(48);
retialShop.purchase(6);
