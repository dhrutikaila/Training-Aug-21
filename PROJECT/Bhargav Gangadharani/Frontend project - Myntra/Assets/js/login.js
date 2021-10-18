function checkLogin() {
    var usertype = document.getElementById('usertype').value;
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    
    if (usertype == "admin") {
        async function getAdmin() {
            $.getJSON("assets/json/admin.json", function (json) {
                $.each(json.admin, function (i) {
                    console.log(json.admin[i].email)
                    if (email == json.admin[i].email && password == json.admin[i].password) {
                        localStorage.setItem("admin", JSON.stringify(json.admin[i]));
                        window.location.assign("./admin.html");
                        return true;
                    }
                });
            });
        }
        getAdmin();
        return false;
    }

    if (usertype == "user") {

        async function getUser() {
            $.getJSON("assets/json/users.json", function (json) {
                $.each(json.users, function (i) {
                    if (email == json.users[i].email && password == json.users[i].password) {
                        localStorage.setItem("user", JSON.stringify(json.users[i]));
                        window.location.assign("./index.html");
                        return true;
                    }
                });
            });
        }

        getUser();
        return false;
    }
}