function Login() {
  var login_email = document.getElementById("email").value;
  var login_password = document.getElementById("password").value;

  let userData = JSON.parse(localStorage.getItem("users"));


  if (!userData) {
    alert("Email or Password is not valid"); 
  } 
  else {
    for (let u = 0; u < userData.length; u++) {
        if (
          login_email == userData[u].email &&
          login_password == userData[u].password
        ) {
          // declare variable 
          let status = userData[u].status;
          let user_name = userData[u].name;
          let user_username = userData[u].username;
          let user_password = userData[u].password;
          //set data in localStorage 
          localStorage.setItem("status",status);
          localStorage.setItem("loged_user_name",user_name);
          localStorage.setItem("loged_user_username",user_username);
          localStorage.setItem("loged_user_email",login_email);
          localStorage.setItem("loged_user_password", user_password);

          
          // userData[u].status = 'user';
          // localStorage.setItem("users",JSON.stringify(userData));

          // check condition for user or administrator
          localStorage.setItem("Auth_Status","login");
          window.location.href = "home.html";
          // if(userData[u].status == "User"){
          //   localStorage.setItem("Auth_Status","login");
          //   window.location.href = "home_user.html";
          // }
          // else{
          //   localStorage.setItem("Auth_Status","login");
          //   window.location.href = "home_Admin.html";
          // }
}
      }
    
  }

}
