//interfaces
var customer = {
    firstName: "gagan",
    lastName: "yadav",
    fun1: function () {
        return "Hi there";
    }
};
console.log(customer.firstName);
console.log(customer.lastName);
console.log(customer.fun1());
var employee = {
    firstName: "ramesh",
    lastName: "srivastav",
    fun1: function () { return "Hello!!!"; }
};
console.log(employee.firstName);
console.log(employee.lastName);
var First1 = {
    key: 1,
    value: "robert"
};
function fun1(num, name) {
    console.log('number is' + num + 'name is ' + name);
}
var result = fun1;
fun1(33, "avinash");
