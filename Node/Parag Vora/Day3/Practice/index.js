const greeting = require('./hello');
const {AreaofRectangle,perimeterofRectangle} = require('./rectangle');

// Create hello.js file and exports a value of constant variable greeting=”Greeting of the day!!!” and load the same in index.js
console.log(greeting);

// Create Rectangle.js and compute AreaofRectangle and perimeter of Rectangle, and exports area and perimeter of rectangle
console.log(AreaofRectangle(5,3));
console.log(perimeterofRectangle(5,3));