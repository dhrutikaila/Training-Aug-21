// * async/ await
// * async makes a function return a Promise
// * await makes a function wait for a Promise
// ? The keyword async before a function makes the function return a promise:
// ? The await keyword can only be used inside an async function.

let newPromise1 = new Promise((resolve, reject) => {
  setTimeout(resolve("sagar"), 3000);
});
newPromise1.then((value) => console.log(value));

async function retPromise() {
  let myPromise = new Promise((resolve, reject) => {
    setTimeout(resolve("sagar"), 3000);
  });

  console.log(await myPromise);
}
retPromise();
