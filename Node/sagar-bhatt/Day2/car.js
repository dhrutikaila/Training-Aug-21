// car.js
const car = {
  brand: "Ford",
  model: "Fiesta",
};

// 1:
// module.exports = car; // object

// 2:
exports.car = car; // property

// OR DIRECTLY

// exports.car = {
//   brand: "Ford",
//   model: "Fiesta",
// };
