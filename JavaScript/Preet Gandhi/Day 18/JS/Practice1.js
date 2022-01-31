function square(val, callback) {
    callback(val * val);
}

function result() {
    var val1 = parseInt(document.getElementById("val").value);
    square(val1, (c) => {
        var res = document.getElementById("result");
        res.value = c;
    })
}