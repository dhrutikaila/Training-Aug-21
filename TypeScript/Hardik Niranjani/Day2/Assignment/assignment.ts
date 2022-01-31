// There is a retail shop which need to manage the inventory, whenever some purchase is being made product 
// quantity should be reduced, if quanity is less than 5 reorder request should be raised.
// Design an interface and classes for the same.


// create interface
interface IProduct {
    ProductId: number,
    ProductName: string,
    ProductQuantity: number
}

// create class
class Products implements IProduct {
    ProductId: number;
    ProductName: string;
    ProductQuantity: number;

    constructor(Id: number, Name: string, Quantity: number) {
        this.ProductId = Id;
        this.ProductName = Name;
        this.ProductQuantity = Quantity;
    }
}

// create product array
let inventory: Products[] = [
    { "ProductId": 0, "ProductName": "Maggi", "ProductQuantity": 25 },
    { "ProductId": 1, "ProductName": "Kit-Kat", "ProductQuantity": 10 },
    { "ProductId": 2, "ProductName": "AmulMilk", "ProductQuantity": 12 },
]

// add product in inventory
function addProduct(ProductId: number, ProductName: string, ProductQuantity: number) {
    inventory.push({ ProductId, ProductName, ProductQuantity });
}

// delete product in inventory
function deleteProduct(ProductId: number) {
    inventory.filter((p) => {
        if (p.ProductId === ProductId) {
            inventory.splice(ProductId, 1)
        }
    })
}


// purchease product
function purchaseProduct(PName: string, PQuantity: number) {
    inventory.filter((product) => {
        if (product.ProductName == PName) {
            if (product.ProductQuantity < 5) {
                console.log(`This ${product.ProductName} has only ${product.ProductQuantity} Quantity avalible`)
            }
            else {
                if (product.ProductName == PName) {
                    if (product.ProductQuantity >= PQuantity) {
                        product.ProductQuantity -= PQuantity;
                    }
                    else {
                        console.log(`we have only ${product.ProductQuantity} Quantity of ${product.ProductName}`)
                    }
                }

            }
        }
    })
}

// ************************************************************************************************
// function purchaseProduct(PName: string, PQuantity: number) {
//     inventory.filter((product) => {
//         if (product.ProductName == PName) {
//         if (product.ProductQuantity > 5) {
//             if (product.ProductName == PName) {
//                 if (product.ProductQuantity >= PQuantity) {
//                     product.ProductQuantity -= PQuantity;
//                 }
//                 else {
//                     console.log(`we have only ${product.ProductQuantity} Quantity of ${product.ProductName}`)
//                 }
//             }
//             if(product.ProductName !== PName) {
//                  console.log(`Does't have ${PName}`);
//             }

//         }
//         else {
//             console.log(`This ${product.ProductName} has only ${product.ProductQuantity} Quantity avalible`)
//         }
//     }
//     })
// }






purchaseProduct("AmulMilk", 15)
// deleteProduct(2);
addProduct(3, "Ice Cream", 20)
purchaseProduct("Ice Cream", 1)
console.log(inventory)
