// There is a retail shop which need to manage the inventory, whenever some purchase is being made product quantity should be reduced, if quanity is less than 5 reorder request should be raised.
// Design an interface and classes for the same.
var Products = /** @class */ (function () {
    function Products(id, name, price, quantity) {
        this.ProductId = id;
        this.ProductName = name;
        this.ProductPrice = price;
        this.ProductQuantity = quantity;
    }
    return Products;
}());

var obj = [];
//Function to add products
function addProducts(ProductId, ProductName, ProductPrice, ProductQuantity) {
    obj.push({ ProductId: ProductId, ProductName: ProductName, ProductPrice: ProductPrice, ProductQuantity: ProductQuantity });
}
//adding products
addProducts(1, "Colgate", 100, 20);
addProducts(2, "Close UP", 90, 15);
addProducts(3, "Dabar Red", 110, 25);
//function to purchase product
function Purchase(Product_Name, Product_Quantity) {
    obj.filter(function (value, index, arr) {
        if (Product_Quantity > 5) {
            if (value.ProductName == Product_Name) {
                value.ProductQuantity = value.ProductQuantity - Product_Quantity;
            }
        }
        else {
            console.log("Please enter quantity more than 5");
        }
    });
}
//calling function to make purchase
Purchase("Colgate", 9);
console.log(obj);
