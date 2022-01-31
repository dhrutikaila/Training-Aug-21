// jQuery for Login and Register
$(document).ready(function() {
    //Register 
    $("#register_btn").click(function() {
        var Name = $("#name").val();
        var Password = $("#password").val();
        var Contact_number = $("#contact_number").val();
        var Confirm_password = $("#confirm_password").val();

        //Here Check Contact Number is Correct Or Not
        if (Contact_number.length != 10) {
            alert("Please Check Your Contact Number..");
            return;
        }

        //Here Check both password and confirm password is same or not
        if (Password == Confirm_password) {
            var userPassword = Confirm_password
        } else {
            alert("Your Password & confirm Password is Not match Please Check..");
            return;
        }

        //Get json data and Push The Current Register userData
        $.getJSON("JSON/UserInfo.json", function(User_Info, status) {
            if (status == "success") {
                let UserData = {
                    "Username": Name,
                    "Contact_Number": Contact_number,
                    "Password": userPassword,
                    "Role": "user"
                };
                User_Info.push(UserData);
                localStorage.setItem("UserInfo", JSON.stringify(User_Info))
            } else {
                alert("Error" + status);
                return;
            }
        });
    });

    //User click on Login button
    $("#login_btn").click(function() {
        var userName = $("#username").val();
        var userPassword = $("#login_password").val();
        var data = localStorage.getItem("UserInfo");

        //First Check local storage Data is null or Not
        if (data == null) {

            //Local Storage Null Then fetch From UserInfo.json data 
            $.getJSON("JSON/UserInfo.json", function(userData, status) {
                var user_arr = userData;
                checkdata(user_arr); //This Function call for Check Username or PassWord is valid or not
            });

        } else {
            //someone Regiaster first Then Login 
            var user_arr = JSON.parse(data);
            checkdata(user_arr); //This Function call for Check Username or PassWord is valid or not
        }

        //This Function Check Username or PassWord is valid or not 
        function checkdata(user_arr) {
            $.each(user_arr, function(index, data) {
                if (data.Username == userName && data.Password == userPassword) {
                    alert("Login successfully..");
                    localStorage.setItem("LoginUser", userName);
                    localStorage.setItem("Contact Number", data.Contact_Number);
                    localStorage.setItem("Role", data.Role);
                    window.location.assign("../Domino's Pizza/Home.html");
                    return;
                }
            });
        }

    });

});