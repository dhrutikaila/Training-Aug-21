//Make a function that takes in a single parameter and returns a new promise. using setTimeout, after 500 milliseconds, the promise will either resolove or reject. if the input is a string, the promise resolves with that reverse string . if the input is anything but a string it rejects with that same input call the function wrong Input
function stringCheck(stringvalue) {
    return new Promise((resolve, reject) =>
        setTimeout(() => {
            if (typeof stringvalue === 'string' || stringvalue instanceof String) {
                resolve("Reverse String  " + stringvalue.split('').reverse().join(''));
            }
            else {
                reject(stringvalue + "all the function wrong Input")
            }
        }, 500)
    )
        .then((result) => {
            document.getElementById("strings").innerHTML = result;
        })
}
stringCheck("hello");
