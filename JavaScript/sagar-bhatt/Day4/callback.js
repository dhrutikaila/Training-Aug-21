// * JavaScript Callbacks
// * A callback is a function passed as an argument to another function.A callback function can run after another function has finished.
// * Callbacks really shine are in asynchronous functions, where one function has to wait for another function (like waiting for a file to load).

function add(a, b, callback) {
  callback(a, b);
}
add(99, 99, (a, b) => {
  console.log(a + b);
});
