//basic promise example
function myDisplayer(some) {
  document.getElementById("demo").innerHTML = some;
}

let myPromise = new Promise(function(myResolve, myReject) {
  let x = 0;

// some code (try to change x to 5)

  if (x == 0) {
    myResolve("OK");
  } else {
    myReject("Error");
  }
});

myPromise.then(
  function(value) {myDisplayer(value);},
  function(error) {myDisplayer(error);}
);


//timeout 
const myPromise2 = new Promise(function(myResolve, myReject) {
  setTimeout(function() { myResolve("Hello World !!!"); }, 3000);
});


myPromise2.then(function(value) {
  document.getElementById("message").innerHTML = value;
});

//open a file using promises
function displayers(name) {
  document.getElementById("files").innerHTML = name;
}

const filePromise = new Promise(function(myResolves, myRejects) {
  let req = new XMLHttpRequest();
  req.open('GET', "Callback.html");
  req.onload = function() {
    if (req.status == 200) {
      myResolves(req.response);
    } else {
      myRejects("File not Found");
    }
  };
  req.send();
});

filePromise.then(
  function(value) {displayers(value);},
  function(error) {displayers(error);}
);

//chaining of promises
let p = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve(10);
    }, 3 * 100);
});

p.then((result) => {
    console.log(result); // 10
    return result * 2;
}).then((result) => {
    console.log(result); // 20
    return result * 3;
}).then((result) => {
    console.log(result); // 60
    return result * 4;
});

//Returning a Promise
let q = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve(10);
    }, 3 * 100);
});

q.then((result) => {
    console.log(result);
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(result * 2);
        }, 3 * 1000);
    });
}).then((result) => {
    console.log(result);
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(result * 3);
        }, 3 * 1000);
    });
}).then(result => console.log(result));
