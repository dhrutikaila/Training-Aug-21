// * Asynchronous JavaScript
// * Functions running in parallel with other functions are called asynchronous
// * A good example is JavaScript setTimeout()

setInterval(() => {
  document.lastChild.innerHTML = new Date();
}, 1000);

// * Promise
// * The Promise object represents the eventual completion (or failure) of an asynchronous operation and its resulting value.
// ? let myPromise = new Promise((resolve, reject)=>{})

// * myPromise.then()
// * The then() method returns a Promise. It takes up to two arguments: callback functions for the success and failure cases of the Promise.
// * Chaining
// * The then method returns a Promise which allows for method chaining.

// * myPromise.catch()
// * The catch() method returns a Promise and deals with rejected cases only. It behaves the same as calling Promise.prototype.then(undefined, onRejected) (in fact, calling obj.catch(onRejected) internally calls obj.then(undefined, onRejected)).

// * myPromise.finally()
// * The finally() method returns a Promise. When the promise is settled, i.e either fulfilled or rejected, the specified callback function is executed.
let myPromise = new Promise((resolve, reject) => {
  // setTimeout(resolve("sagar"), 1000);
  setTimeout(reject("Error"), 1000);
});
let thenProm = myPromise
  .then((value) => {
    console.log(value);
    return value + " J";
  })
  .then((value) => {
    console.log(value);
    return value + " Bhatt";
  })
  .then(
    (value) => {
      console.log(value);
    }
    // (error) => {
    //   console.log(error + "logged by onRejected() method");
    // }
  )
  .catch((value) => {
    console.log(value + " logged by catch() method.");
  })
  .finally(() => {
    console.log("logged by finally() method.");
  });

console.log(myPromise);
console.log(thenProm);

// * Promise.resolve()
// * The Promise.resolve() method returns a Promise object that is resolved with a given value.
let p = Promise.resolve([1, 2, 3]).then((v) => console.log(v));

// * Promise.reject()
// * The Promise.reject() method returns a Promise object that is rejected with a given reason.
let pp = Promise.reject("Error").then(
  () => {},
  (error) => console.warn(error + "logged by rejected()")
);

function resolved(result) {
  console.log(result + " Resolved");
}
function rejected(result) {
  console.warn(result);
}
Promise.resolve("arg").then(resolved, rejected);
Promise.reject(new Error("fail")).then(resolved, rejected);

// * Promise.all()
// * The Promise.all() method takes an iterable of promises as an input, and returns a single Promise that resolves to an array of the results of the input promises.
// * Promise.allSettled()
// * The Promise.allSettled() method returns a promise that resolves after all of the given promises have either fulfilled or rejected, with an array of objects that each describes the outcome of each promise.
// * Promise.any()
// * Promise.any() takes an iterable of Promise objects and, as soon as one of the promises in the iterable fulfills, returns a single promise that resolves with the value from that promise. If no promises in the iterable fulfill (if all of the given promises are rejected), then the returned promise is rejected with an AggregateError, a new subclass of Error that groups together individual errors.
// * Promise.race()
// The Promise.race() method returns a promise that fulfills or rejects as soon as one of the promises in an iterable fulfills or rejects, with the value or reason from that promise.

let p1 = Promise.resolve([1, 2, 3]).then((value) =>
  console.log(value, " logged by p1")
);
let p2 = Promise.resolve([4, 5, 6, 7]);
let p3 = Promise.resolve("sagar");
let p4 = Promise.reject("Error");

Promise.all([p1, p2, p3]).then(
  (values) => console.log(values, "logged by Promise.all()"),
  (reject) => console.log("rejected logged by all()")
);
Promise.all([p1, p2, p3, p4]).then(
  (values) => console.log(values, "logged by Promise.all()"),
  () => console.log("rejected logged by all()")
);

Promise.allSettled([p1, p2, p3, p4]).then(
  (values) => console.log(values, "logged by Promise.allSettled()"),
  () => console.log("rejected logged by allSettled()")
);

Promise.any([p4, p1, p2, p3]).then(
  (values) => console.log(values, "logged by Promise.any()"),
  () => console.log("rejected logged by any()")
);

Promise.any([p4]).then(
  (values) => console.log(values, "logged by Promise.any()"),
  () => console.log("rejected logged by any()")
);

Promise.race([p1, p2, p3, p4]).then(
  (values) => console.log(values, "logged by Promise.race()"),
  () => console.log("rejected logged by race()")
);
