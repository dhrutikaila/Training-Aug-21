//There is a retail shop which need to manage the inventory, whenever some purchase is being made product quantity should be reduced, if quanity is less than 5 reorder request should be raised.
class RetailInventory {
    constructor(qunatity) {
        //updating stock at time of Instance creation
        this.Stock = qunatity;
        //checking if stock is undersupplied at time of instantsiation
        if (this.Stock < 5) {
            this.reOrder(50);
        }
    }
    //public purchase method allows to purcahse of certail quanity
    purchase(quanity) {
        if (quanity > this.Stock) {
            console.log(`Sorry we cant execute your order this point of time`);
            if (quanity > 100) {
                this.reOrder(quanity);
            }
            else {
                this.reOrder(100);
            }
            return;
        }
        this.Stock = this.Stock - quanity; //stock is reduced
        console.log(`purchase of ${quanity} unit has been executed`); // post process
        //stock check for under supplement
        if (this.Stock < 5) {
            this.reOrder(100);
        }
    }
    reOrder(quanity) {
        //procedure of ordering to supplier for restocking
        console.log(`reorder of  ${quanity} unit has been placed to the supplier`);
        //after supplier shipment
        this.Stock += quanity; // updating stock of shop
        console.log(`Inventory has been Restocked with avaliable unit ${this.Stock}`);
    }
}
//intialize a retail shop instance
var retialShop = new RetailInventory(50);
//trying purcahse order of 98
retialShop.purchase(98);
