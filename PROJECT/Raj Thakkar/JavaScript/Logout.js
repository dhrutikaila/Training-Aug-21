// Verify Authentification//
var loginStatus = localStorage.getItem("LoginStatus");
console.log(loginStatus);
if(loginStatus !="LogOut")
{
    document.getElementById("LogIn").style.display = "none";
    document.getElementById("SignUp").style.display = "none";
}
else{
    document.getElementById("LoggedIn").style.display = "none";
   
   
}
function LogOut(){
    localStorage.setItem("LoginStatus","LogOut");
    document.getElementById("LogIn").style.display = "block";
    document.getElementById("SignUp").style.display = "block";
    document.getElementById("LoggedIn").style.display = "none";
   
}