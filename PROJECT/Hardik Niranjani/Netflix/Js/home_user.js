// Verify fot Authentication
var code = localStorage.getItem("Auth_Status");

var status1 = localStorage.getItem("status");
if (code != "logout" && status1 != "Admin") {
} else if (code != "login") {
  window.location.href = "../index.html";
} else {
  window.location.href = "home_Admin.html";
}

function logout() {
  localStorage.setItem("Auth_Status", "logout");
  window.location.href = "login.html";
}
