let p = new Promise((resolve, reject) => {
    let a = 2;
    if((a + a) == 2){
        resolve('Success');
    }
    else{
        reject('error');
    }
});

p.then((message) => {
    console.log(message);
}).catch((message) => {
    console.log(message);
});

let promiseOne = new Promise((resolve,reject) => {
    resolve('Promise 1');
}) 

let promiseTwo = new Promise((resolve,reject) => {
    resolve('Promise 2');
}) 

let promiseThree = new Promise((resolve,reject) => {
    resolve('Promise 3');
}) 

Promise.all([
    promiseOne,
    promiseTwo,
    promiseThree
]).then((message) => {
    console.log(message);
})

Promise.race([
    promiseOne,
    promiseTwo,
    promiseThree
]).then((message) => {
    console.log(message);
})