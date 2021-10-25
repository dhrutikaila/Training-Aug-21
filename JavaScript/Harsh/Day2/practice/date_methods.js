// var x = new Date();
// console.log(x);
// console.log(x.getTime());
// console.log(x.getFullYear());
// console.log(x.getMonth());
// console.log(x.getDate());
// console.log(x.getHours());
// console.log(x.getMinutes());
// console.log(x.getSeconds());
// console.log(x.getMilliseconds());
// console.log(x.getDay());

var x = new Date();
x.setFullYear(2020);
console.log(x);


x.setFullYear(2020, 11, 3)
console.log(x);

x.setMonth(11)
console.log(x);

x.setDate(15);
console.log(x);

x.setDate(x.getDate() + 50);
console.log(x);

x.setSeconds(30);
console.log(x);



