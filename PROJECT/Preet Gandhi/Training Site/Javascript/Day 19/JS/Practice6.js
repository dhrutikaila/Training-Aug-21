// Practice_Exercise6

const add = (function () {
    let counter = 0;
    return function() {
        counter +=1;
        return counter;
    }
})();

function count() {
    var res = document.getElementById("output");
    res.innerHTML = add();
}