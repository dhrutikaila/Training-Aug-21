// Practice task 1
function squareNumber(number,ans){
    function mySquare (num, callback){
        callback(num*num);
    }

    function print(square){
        ans.innerHTML = "Square : " + square;
    }

    mySquare(number.value,print);
}
// Practice task 2
function checkstr(str,ans){
    validate(str.value).then(
        result => {
            ans.innerText=result;
        },
        error => {
            ans.innerText=error;
        },
    );
}

function validate(str){
    return new Promise((resolve,reject)=>{
        if(isNaN(parseInt(str)))
        {
            setTimeout(()=>{resolve(ReverseString(str))},500);
        }
        else
        {
            setTimeout(()=>{reject(new Error('Not Valid Input'))},500);
        }
    });
}

function ReverseString(str) {
    return str.split('').reverse().join('')
 }

