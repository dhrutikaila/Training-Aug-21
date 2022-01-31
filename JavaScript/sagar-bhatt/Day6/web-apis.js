// * Web Storage API
// ? The Web Storage API provides mechanisms by which browsers can store key/value pairs, in a much more intuitive fashion than using cookies.

// * The two mechanisms within Web Storage are as follows:
// ? sessionStorage: Stores data only for a session.
// ? localStorage: Stores the data but persists even when the browser is closed and reopened.

// * Window.sessionStorage
// ? Syntax: myStorage = window.sessionStorage;

let ss = document.getElementById("sessionStorage");
// Remove all saved data from sessionStorage
sessionStorage.clear();
// Save data to sessionStorage
sessionStorage.setItem("key", "value");
// Get saved data from sessionStorage
sessionStorage.getItem("key");
// Remove saved data from sessionStorage
sessionStorage.removeItem("key");
sessionStorage.setItem("name", "sagar");
// Returns the name of the nth key
ss.innerHTML += `key:` + sessionStorage.key(0) + "<br />";
ss.innerHTML += `value:` + sessionStorage.getItem("name") + "<br />";
ss.innerHTML += `length:` + sessionStorage.length + "<br />";

// * Window.localStorage
// ? Syntax: myStorage = window.localStorage;
let ls = document.getElementById("localStorage");
localStorage.clear();
localStorage.setItem("id", "1");
localStorage.setItem("name", "sagar");
localStorage.setItem("course", "MCA");
ls.innerHTML += localStorage.key(2);
ls.innerHTML += `:` + localStorage.getItem("id") + "<br />";
ls.innerHTML += localStorage.key(0);
ls.innerHTML += `:` + localStorage.getItem("name") + "<br />";
ls.innerHTML += localStorage.key(1);
ls.innerHTML += `:` + localStorage.getItem("course") + "<br />";
ls.innerHTML += `length:` + localStorage.length;

// * Web Fetch API
// ? The Fetch API provides an interface for fetching resources (including across the network). It will seem familiar to anyone who has used XMLHttpRequest, but the new API provides a more powerful and flexible feature set.

let fetchData = document.getElementById("fetchData");
console.log(fetch("https://reqres.in/api/users"));

// * GET
fetch("https://reqres.in/api/users")
  .then((response) => response.json())
  .then((data) => {
    console.log(data);
    console.table(data.data);
    fetchData.innerHTML += "<h4>GET:</h4>" + JSON.stringify(data.data);
  })
  .catch((error) => console.log(error));

// * POST
fetch("https://reqres.in/api/users", {
  method: "post",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    id: 7,
    email: "tracey.ramos@reqres.in",
    first_name: "Tracey",
    last_name: "Ramos",
    avatar: "https://reqres.in/img/faces/6-image.jpg",
  }),
})
  .then((response) => response.json())
  .then((data) => {
    console.table(data);
    fetchData.innerHTML += "<br /><br /><h4>POST:</h4>" + JSON.stringify(data);
  })
  .catch((error) => console.log(error));
