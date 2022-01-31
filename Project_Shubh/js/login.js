//modal-open
// Get the modal
      var modal = document.getElementById('id01');

      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function (event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      }

//local-storage login credential storing
var logIn = [   
    { "name": "shubhp3@yahoo.com", "pw" : "123456"}
]
localStorage.setItem("logIn",JSON.stringify(logIn));

//checking
function check(){
    var storedName = localStorage.getItem('name');
    var storedPw = localStorage.getItem('pw');

    var userName = document.getElementById('userName');
    var userPw = document.getElementById('userPw');
    var userRemember = document.getElementById("rememberMe");

    if(userName.value == storedName && userPw.value == storedPw){
        alert('Congratulations! You are logged in.');
    }else{
        alert('No user exists, please signup or check login details carefully!');
    }
}