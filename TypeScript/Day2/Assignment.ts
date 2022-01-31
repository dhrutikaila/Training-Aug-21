// There is a retail shop which need to manage the inventory, whenever some purchase is being made product quantity should be reduced, if quanity is less than 5 reorder request should be raised.
// Design an interface and classes for the same.
interface IRetail {
    ProductId: number;
    ProductName: string;
    ProductPrice: number;
    ProductQuantity: number;
}

class Inventory implements IRetail{
    ProductId: number;
    ProductName: string;
    ProductPrice: number;
    ProductQuantity: number;

    
}

var obj : Products[] = [{"ProductId": 1, "ProductName": "Blazer", "ProductPrice": 4100, "ProductQuantity": 15},
                        {"ProductId": 2, "ProductName": "Suit", "ProductPrice": 11000, "ProductQuantity": 50},
                        {"ProductId": 3, "ProductName": "Trouser", "ProductPrice": 1200, "ProductQuantity": 100}  
                        ];

function Purchase(Product_Name: string, Product_Quantity: number){
    
        obj.filter((value,index,arr) => {
            if(value.ProductQuantity > 5){
                if(value.ProductName == Product_Name){
                    value.ProductQuantity = value.ProductQuantity - Product_Quantity;
                }
                else{
                    console.log("Please enter valid name");
                }
            }
            else{
                console.log("Please enter quantity more than 5");
            }
        })  
}
 
Purchase("Blazer", 10);
console.log(obj);