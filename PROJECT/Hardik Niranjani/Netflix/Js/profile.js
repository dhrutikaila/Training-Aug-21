// Verify fot Authentication
var code = localStorage.getItem("Auth_Status");


if (code != "login") {
  window.location.href = "../index.html";
} 



// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// get data from localStorage
var profile_form_status = localStorage.getItem("status");
var profile_form_name = localStorage.getItem("loged_user_name");
var profile_form_username = localStorage.getItem("loged_user_username");
var profile_form_email = localStorage.getItem("loged_user_email");
var profile_form_password = localStorage.getItem("loged_user_password");


//store data in profile form 
document.getElementById("profile_form_name").value = profile_form_name;
document.getElementById("profile_form_username").value = profile_form_username;
document.getElementById("profile_form_email").value = profile_form_email;
document.getElementById("profile_form_password").value = profile_form_password;
document.getElementById("profile_form_status").innerHTML = profile_form_status;

let userData = JSON.parse(localStorage.getItem("users"));

function save() {
  for (let u = 0; u < userData.length; u++) {
    if (
      profile_form_email == userData[u].email &&
      profile_form_password == userData[u].password
    ) {
      // declare updated data
      var name = document.getElementById("profile_form_name").value;
      var username = document.getElementById("profile_form_username").value;
      var email = document.getElementById("profile_form_email").value;
      var password = document.getElementById("profile_form_password").value;

      if(document.getElementById("user").checked)
      {
        var status= "User";
        localStorage.setItem("status",status);
      }
      else
      {
        var status= "Admin";
        localStorage.setItem("status",status);
      }
      // delare localStorage
      localStorage.setItem("loged_user_name", name);
      localStorage.setItem("loged_user_username", username);
      localStorage.setItem("loged_user_email", email);
      localStorage.setItem("loged_user_password", password);

      // set updated data in users array
      userData[u].name = name;
      userData[u].username = username;
      userData[u].email = email;
      userData[u].password = password;
      if(document.getElementById("user").checked)
      {
        var status= "User";
        userData[u].status = status;
      }
      else
      {
        var status= "Admin";
        userData[u].status = status;
      }
      localStorage.setItem("users", JSON.stringify(userData));
    }
  }
}
