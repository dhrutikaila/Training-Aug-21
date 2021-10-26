let c = (a,b) => a+b;

console.time(c(5,10));
console.log(c(5,10));
console.timeEnd(c(5,10));

const cars = require('./car');
console.log(cars.car.brand);
