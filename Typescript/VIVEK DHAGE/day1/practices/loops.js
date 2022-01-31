var n = 5;
while (n > 5) {
    console.log("Entered in while");
}
do {
    console.log("Entered do…while");
} while (n > 5);
var num;
for (num = 1; num <= 10; num++) {
    console.log(num);
}
var fruits = ['apple', 'banana', 'orange', 'kiwi'];
for (var i in fruits) {
    console.log(fruits[i]);
}
fruits.forEach(function (item) {
    console.log(item);
});




