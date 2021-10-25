function signup() {
  var signup_name = document.getElementById("name").value;
  var signup_username = document.getElementById("username").value;
  var signup_email = document.getElementById("email").value;
  var signup_password = document.getElementById("password").value;
  var status1 = "User";
  var status2 = "Admin";
  
  let userData = JSON.parse(localStorage.getItem("users"));
  
  if (userData) {
    if (document.getElementById("user").checked) {
      userData.push({
        name: signup_name,
        username: signup_username,
        email: signup_email,
        password: signup_password,
        status: status1,
      });
    } else {
      userData.push({
        name: signup_name,
        username: signup_username,
        email: signup_email,
        password: signup_password,
        status: status2,
      });
    }

    localStorage.setItem("users", JSON.stringify(userData));
  } else {
    if (document.getElementById("user").checked) {
      localStorage.setItem(
        "users",
        JSON.stringify([
          {
            name: signup_name,
            username: signup_username,
            email: signup_email,
            password: signup_password,
            status: status1,
          },
        ])
      );
    } else {
      localStorage.setItem(
        "users",
        JSON.stringify([
          {
            name: signup_name,
            username: signup_username,
            email: signup_email,
            password: signup_password,
            status: status2,
          },
        ])
      );
    }
  }

  //Clear form
  document.getElementById("name").value = "";
  document.getElementById("username").value = "";
  document.getElementById("email").value = "";
  document.getElementById("password").value = "";

  alert("You have successfully signed up");
}
