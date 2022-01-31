// There is a retail shop which need to manage the inventory, whenever some purchase is being made product quantity should be reduced, if quantity is less than 5 increase request should be raised. Design an interface and classes for the same.

interface Inventory {
  purchase( quantity : number ) : void;
}

class RetailShop implements Inventory 
{
  private Stock: number;
  
  constructor(qunatity : number) 
    {
      // Checking & Updating Stock on Instance creation
      this.Stock = qunatity;

      if(this.Stock < 5) // Raising Reorder Request if stock is < 5 at time of instance
      {
        this.increase(100);
      }
    }

  // Purchase Method
  purchase(quantity: number): void {

      if(quantity > this.Stock){
          console.log("\nSorry! Your order can't be placed as we are running out of stock\nPlease visit soon!\n");
          this.increase(quantity);
          return;
      }


      this.Stock = this.Stock - quantity; // Reducing Stock After Order
      console.log(`Order for ${quantity} units has been placed. Please visit again!\n`);      
      console.log(`Remaining stock in inventory is: ${this.Stock}`) // Quantity + Remaining Stock Nums

      // Raising Reorder Request When Quanity < 5 
      if(this.Stock < 5) {
          this.increase(100);
      }
  }
  private increase(quantity: number): void {
      // Procedure Of Ordering To Supplier For Restocking
      console.log(`Request for increasing inventory with ${quantity} units has been placed.\n`);     
      this.Stock += quantity; // updating stock of shop
      console.log(`Inventory has been Restocked, Avaliable Stock: ${this.Stock}`);

      // Re-ordering after stock is updated
      this.Stock = this.Stock - quantity; // Reducing Stock After Order
      console.log(`Order for ${quantity} units has been placed. Please visit again!\n`);
      console.log(`Remaining stock in inventory is: ${this.Stock}\n`) // Quantity + Remaining Stock Nums
  }
}

var buy = new RetailShop(100);   //RetailShop instance


buy.purchase(196);
buy.purchase(16);
buy.purchase(60);
buy.purchase(48);
buy.purchase(6);
