var counter = 0;
function add() {
  counter += 1;
}
add(); // 1
add(); // 2
add(); // 3

console.log(counter);

var add = (function () {
  var counter = 0;
  return function () {
    return (counter += 1);
  };
})();
add(); // 1
add(); // 2
console.log(add()); // 3
