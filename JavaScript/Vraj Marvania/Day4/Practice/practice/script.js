// JavaScript Callbacks
function print(name) {
  console.log(name);
}
function infun(name, callback) {
  callback(name);
}
// call infun
infun("vraj", print);

// Waiting for a Timeout

setTimeout(myFunction, 3000);

function myFunction() {
  document.getElementById("demo").innerHTML = "hello word !!";
}

// Waiting for Intervals:
var i = 0;

setInterval(demo, 1000);
function demo() {
  i++;
  document.getElementById("time").innerHTML = i;
}

//    JavaScript Promises

function myDisplayer(some) {
  console.log(some);
}

let myPromise = new Promise(function (myResolve, myReject) {
  // let x = 2;    //Error
  let x = 0; //okk

  // The producing code (this may take some time)

  if (x == 0) {
    myResolve("OK");
  } else {
    myReject("Error");
  }
});

myPromise.then(
  function (value) {
    myDisplayer(value);
  },
  function (error) {
    myDisplayer(error);
  }
);


// Async & Await 
async function myDisplay() {
  let myPromise = new Promise(function(myResolve, myReject) {
    myResolve("hello brother!!");
  });
  document.getElementById("demo3").innerHTML = await myPromise;
}

myDisplay();