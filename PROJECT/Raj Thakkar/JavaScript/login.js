function Login() {
  var loginNumber = document.getElementById("loginNo").value;
  var loginPass = document.getElementById("loginPass").value;

  let usersDetails = JSON.parse(localStorage.getItem("usersDetails"));

  if (!usersDetails) {
    alert("Please register your account");
  } else {
    for (let i = 0; i < usersDetails.length; i++) {
      if (
        loginNumber == usersDetails[i].phoneNumber &&
        loginPass == usersDetails[i].password
      ) {
        let name = usersDetails[i].name;
        localStorage.setItem("PersonName",name);
        // check condition for user or administrator
        localStorage.setItem("LoginStatus", "Login");
        window.location.href = "Zomato.html";
      }
    }
  }
}
