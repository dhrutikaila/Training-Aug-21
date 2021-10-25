function getData() {
    fetch("http://127.0.0.1:5500/data_api.json")
    .then((result) =>{
        return result.json();
    })
    .then((show_data) => {
        var data = JSON.stringify(show_data);
        localStorage.setItem("Products",data);
        document.getElementById("Result").innerHTML = data;
    })
}