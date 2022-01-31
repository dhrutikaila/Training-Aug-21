// Make a function that takes in a single parameter and returns a new promise. using setTimeout, after 500 milliseconds,
//  the promise will either resolove or reject. if the input is a string, the promise resolves with that reverse string . 
// if the input is anything but a string it rejects with that same input call the function wrong Input
function reverseString(str) {
    return new Promise(function (resolve, reject) {
        setTimeout(function () {
            // for success message
            let successMessage = {
                status: 'success',
                message: 'suucessfully done'
            };
            //for error message
            let errorMessage = {
                status: 'error',
                message: 'there were an error'
            };
            let str = "Shreya";
            if (typeof(str) == String) {
                //if type is string then reverse the string 
                console.log("Reverse string is " + str.split("").reverse().join(""));
                resolve(successMessage);
            }
            else {
                reject(errorMessage);
            }

        }, 500)
    })
}
reverseString(true).then(function () {
    resolve()
}).catch(function () {
    console.log("error");
})

