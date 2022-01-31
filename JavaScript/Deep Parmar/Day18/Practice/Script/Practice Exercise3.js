//function that takes in a single parameter and returns a new promise. using setTimeout, after 500 milliseconds, the promise will either resolove or reject.

function getstring(string_input) {
    return new Promise(function(resolve, reject)
    { 
        setTimeout(() => {
            //only string can resolve
            if (isNaN(string_input)) {
                resolve();
            }
            else {
                // if the input is anything but a string it rejects with that same input call the function wrong Input
                if(!isNaN(string_input))
                {
                    reject();
                }
                else{
                    console.error("Please Enter Valid input");
                }
            }                   
        }, 500);
    });
}
function strCheck(str){
    var string_input=str;

    getstring(string_input).then(()=>{
        var rev_str=string_input.split("").reverse().join("");
        document.getElementById("display").innerHTML=rev_str;
    }).catch(()=>console.log("Please Enter valid String"));
}