//generic
function display(args) {
    return args;
}
var op1 = display("hello");
var op2 = display(1);
console.log(op1);
//with multiple datatype
function data(id, name) {
    console.log("Type of id is " + typeof (id));
    console.log("Type of name is " + typeof (name));
}
data(1, "shreya");
//generic with non generic 
function dataType(id, name) {
    console.log("Type of id is " + typeof (id));
    console.log("Type of name is " + typeof (name));
}
dataType(1, "shreya");
//generic class
var KeyValuePair = /** @class */ (function () {
    function KeyValuePair() {
        var _this = this;
        this.display = function () {
            console.log("key is ".concat(_this.key, " , val = ").concat(_this.value));
        };
    }
    KeyValuePair.prototype.setKeyValue = function (key, value) {
        this.key = key;
        this.value = value;
    };
    return KeyValuePair;
}());
var kv1 = new KeyValuePair();
kv1.setKeyValue(1, "shreya");
kv1.display();
var kv2 = new KeyValuePair();
kv2.setKeyValue("Thakkar", "shreya");
kv2.display();
var kv12 = { key: 1, value: "shreya" };
console.log(kv12);
