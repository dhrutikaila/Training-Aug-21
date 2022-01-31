// // Store following JSON data into localstorage,read that data and print it into console.

// async function getData() {
//     var response = await fetch("http://127.0.0.1:5501/JavaScript/Deep%20Parmar/Day20/Practice/Script/PracticeExercise.json");
//     var data = await response.json();
//     localStorage.setItem("Productdata2", JSON.stringify(data));
//     console.table(JSON.parse(localStorage.getItem("Productdata2")).products);
// }

//Another way:-
function getData() {
    fetch("http://127.0.0.1:5501/JavaScript/Deep%20Parmar/Day20/Practice/Script/PracticeExercise.json")
        .then(response => response.json())
        .then((data) => {
            localStorage.setItem("Productdata2", JSON.stringify(data));
            console.table(JSON.parse(localStorage.getItem("Productdata2")).products);
        });
}