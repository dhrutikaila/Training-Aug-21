function signup() {
  var signupName = document.getElementById("signup_name").value;
  var signupNumber = document.getElementById("signup_number").value;
  var signupPass = document.getElementById("signup_pass").value;
  var signupPass1 = document.getElementById("signup_pass1").value;

var usersDetails = JSON.parse(localStorage.getItem("usersDetails"));

  if (usersDetails && signupNumber != "" && signupName!="" && signupPass!="" && signupPass1!="") {
    if (signupPass == signupPass1) {
      usersDetails.push({
        name: signupName,
        phoneNumber: signupNumber,
        password: signupPass1,
      });

      localStorage.setItem("usersDetails", JSON.stringify(usersDetails));
      document.getElementById("signup_name").value = "";
      document.getElementById("signup_number").value = "";
      document.getElementById("signup_pass").value = "";
      document.getElementById("signup_pass1").value = "";
      alert("Thank you for the registration");
    }
    else{
        alert("Please enter correct password");
    }
  } else if (!usersDetails && signupNumber != "" && signupName!="" && signupPass!="" && signupPass1!="") {
    if (signupPass == signupPass1) {
      localStorage.setItem(
        "usersDetails",
        JSON.stringify([
          {
            name: signupName,
            phoneNumber: signupNumber,
            password: signupPass1,
          },
        ])
      );
      document.getElementById("signup_name").value = "";
      document.getElementById("signup_number").value = "";
      document.getElementById("signup_pass").value = "";
      document.getElementById("signup_pass1").value = "";
      alert("Thank you for the registration");
    }
    else{
        alert("Please enter correct password");
    }
  } else{
    alert("Please fillup form");
  }

    // document.getElementById("signup_name").value = "";
    // document.getElementById("signup_number").value = "";
    // document.getElementById("signup_pass").value = "";
    // document.getElementById("signup_pass1").value = "";

    // alert("Thank you for the registration");
}
