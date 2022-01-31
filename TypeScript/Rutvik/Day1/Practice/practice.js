var Product = /** @class */ (function () {
    function Product(productId, productName, price, stock) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.stock = stock;
    }
    return Product;
}());
var Order = /** @class */ (function () {
    function Order(orderId, productId, price, orderQuanity) {
        this.orderId = orderId;
        this.productId = productId;
        this.price = price;
        this.orderQuanity = orderQuanity;
    }
    return Order;
}());
var products = [];
var orders = [];
var purcahseHistory = [];
function AddProduct(productId, productName, price, stock) {
    var newProduct = new Product(productId, productName, price, stock);
    products.push(newProduct);
}
// AddProduct(1,"Mouse",300,25)
// AddProduct(2,"Keyboard",500,20)
function Purchase(productId, quantity) {
    var product;
    for (var _i = 0, products_1 = products; _i < products_1.length; _i++) {
        var p = products_1[_i];
        if (p.productId == productId) {
            product = p;
            break;
        }
    }
    if (product != null) {
        if (quantity < product.stock) {
            var purchase = { productId: product.productId, price: product.price, quantityPurchased: quantity };
            purcahseHistory.push(purchase);
            product.stock -= quantity;
            console.log("\nYou have purchased ".concat(product.productName, " successfully!!"));
            if (product.stock < 5) {
                MakeOrderRequest(1, 50, product);
            }
        }
        else {
            console.log("Out of stock!!");
            if (product.stock < 5) {
                MakeOrderRequest(1, 50, product);
            }
        }
    }
    else {
        console.log("Product not found!");
    }
}
function MakeOrderRequest(orderId, quanity, product) {
    var orderRequest = new Order(orderId, product.productId, product.price, quanity);
    orders.push(orderRequest);
}
function GetStockDetails() {
    products.forEach(function (p) {
        console.log(p);
    });
}
function GetOrderReuests() {
    orders.forEach(function (p) {
        console.log(p);
    });
}
function GetProductsList() {
    products.forEach(function (product) {
        console.log("ProductId : ".concat(product.productId, ", Product : ").concat(product.productName, ", Price : ").concat(product.price));
    });
}
console.log("\nWelcome to my shop!!\n\nList of available items:");
GetProductsList();
console.log("1.Make purchase\n2.Get Order Details\n3.Get Stock Details\n4.Get order request data\n5.Add Product");
var choice = 1;
switch (choice) {
    case 1:
        var productId = 1;
        var quantity = 18;
        Purchase(productId, quantity);
        break;
    case 2:
        var totalamount = 0;
        console.log("\nOrder Details:");
        purcahseHistory.forEach(function (p) {
            console.log("\nProduct : ".concat(p.productId, ", Price : ").concat(p.price, ", Quantity : ").concat(p.quantityPurchased, ", Total Price : ").concat(p.price * p.quantityPurchased));
            totalamount += p.price * p.quantityPurchased;
        });
        console.log("\nTotal amount to pay : ".concat(totalamount));
        break;
    case 3:
        GetStockDetails();
        break;
    case 4:
        GetOrderReuests();
        break;
    case 5:
        var productId = 1;
        var productName = "Mouse";
        var price = 500;
        var stock = 20;
        AddProduct(productId, productName, price, stock);
        break;
    default:
        console.log("Invalid choice!!");
        break;
}
