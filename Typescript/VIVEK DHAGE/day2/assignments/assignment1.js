// There is a retail shop which need to manage the inventory, whenever some purchase is being
// made product quantity should be reduced, if quanity is less than 5 reorder request should be raised.
// Design an interface and classes for the same.
var FirstClass = /** @class */ (function () {
    function FirstClass() {
    }
    FirstClass.prototype.purchase = function () {
        var ProductArr = [
            { id: 1, product: "one" },
            { id: 2, product: "two" },
            { id: 3, product: "three" },
            { id: 4, product: "four" },
            { id: 5, product: "five" },
            { id: 6, product: "six" },
        ];
        for (var _i = 0, ProductArr_1 = ProductArr; _i < ProductArr_1.length; _i++) {
            var a = ProductArr_1[_i];
            console.log(a.product);
        }
        ProductArr.forEach(function (val) {
            console.log(val.product);
        });
        console.log("welcome to store");
        var question = "Y";
        switch (question) {
            case "Y":
                if (ProductArr.length < 5) {
                    console.log("reorder");
                }
                else {
                    ProductArr.pop();
                    console.log("new quantity : " + ProductArr.length);
                    console.log("purchased");
                }
                break;
            case "N":
                console.log("new quantity" + ProductArr.length);
                break;
            default:
                console.log("wrong input press only Y or N ");
                break;
        }
    };
    return FirstClass;
}());
var Start1 = new FirstClass();
Start1.purchase();
