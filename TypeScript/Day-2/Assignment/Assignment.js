var Product = /** @class */ (function () {
    function Product(id, name, qty, price) {
        var _this = this;
        this.GetProduct = function (qty) {
            console.log("".concat(_this.ProductId, "\t\t").concat(_this.ProductName, "\t\t").concat(_this.ProductPrice, "\t\t"));
            _this.ProductQty -= qty;
            _this.checkQty();
        };
        this.checkQty = function () {
            if (_this.ProductQty < 5) {
                console.log("Quantity less than five , Available product are ".concat(_this.ProductQty));
            }
            else {
                console.log("".concat(_this.ProductQty, " available"));
            }
        };
        this.ProductId = id;
        this.ProductName = name;
        this.ProductPrice = price;
        this.ProductQty = qty;
    }
    return Product;
}());
var productdata = [new Product(1, "Mobile", 20, 20000),
    new Product(2, "TV", 10, 40000),
    new Product(3, "Watch", 10, 50000),
    new Product(4, "Laptop", 10, 60000),
    new Product(5, "Airpods", 5, 40000)
];
// var product = productdata.filter(function (x){
//                             return x.ProductId == 2;
//                         })
productdata[0].GetProduct(6);
//console.log(product)              
console.log("ProductId \t ProductName \t ProductPrice ");
