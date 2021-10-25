// Practice3 (Day 18)


function revString(userInput){
    return new Promise(function(resolve,reject){
        setTimeout(()=> {
            if(isNaN(userInput)){
                resolve(userInput.split('').reverse().join(''));
            }
            else {
                reject("Wrong Input");
            }
        },500);
    });
}

var onFulfill = (result) => {
    var res = document.getElementById("result");
    res.innerText = result;
}

var onReject = (error) => {
    var res = document.getElementById("result");
    res.innerText = error;
}



function callRevFunc() {
    var userInput = document.getElementById("string").value.trim();
    revString(userInput).then(onFulfill).catch(onReject);
}