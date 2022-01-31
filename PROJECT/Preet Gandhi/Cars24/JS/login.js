// Set data to local storage
localStorage.setItem("validation",JSON.stringify({"mobile":1234567890,"password":"12345","name":"Hiren Panchal"}));
localStorage.setItem("login",false);


// function for login
function login(){
    var mobileNum = $("#mobileNum").val();
    var pwd = $("#pwd").val();
    if(mobileNum == "" || pwd == ""){
      $("p").eq(1).removeClass("d-none");
      return;
    }
    var localData = JSON.parse(localStorage.getItem("validation"));
    if(localData.mobile == mobileNum && localData.password == pwd){
      localStorage.setItem("login",true);
      window.location.assign("./index.html");
    }
    else{
      localStorage.setItem("login",false);
      $("#loginButton").text("Login/Sign Up");
      $("p").eq(1).removeClass("d-none");
    }
  }