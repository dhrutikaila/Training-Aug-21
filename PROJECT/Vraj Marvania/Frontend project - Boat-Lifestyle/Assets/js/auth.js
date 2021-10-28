// logout---------------------------------------------------------->

function logout(){
    sessionStorage.removeItem("user");
    location.reload();

}

$(document).ready(function () {
// register-------------------------------------------------------->
    $("#reg").on("submit", function () {
        var regtype = $("#logintype").val();

        // console.log("hello");
        var flag = true;
        var udata = JSON.parse(localStorage.getItem(regtype));
        var loginForm = $("#reg").serializeArray();
        var editObject = {};
        $.each(loginForm, function (i, v) 
        {
            editObject[v.name] = v.value;
        });
        editObject['uid'] =  Math.floor((Math.random() * 10000) + 1);;

        for (i in udata.data) {
            if (udata.data[i].Email == editObject.Email) {
                console.log("email is in");
                var flag = false;
            }
        }
        if (flag == true) 
        {
            udata.data.push(editObject);
            var tempudata = JSON.stringify(udata);
            console.log(tempudata)
            localStorage.setItem(regtype, tempudata);
            return false;
        }
        return false;
    });
   
// login--------------------------------------------------------------------------->
    $("#LOGIN").on("submit", function () {
        var logintype = $("#logintype").val();
        var EMAIL = $("#Email").val();
        var PASS = $("#Password").val();
        
        const JSONObject = JSON.parse(localStorage.getItem(logintype));
        // console.log(JSONObject.data);
        const existsCount = JSONObject.data.filter(
            (item) => item.Email == EMAIL && item.Password == PASS
        );
        sessionStorage.setItem("user", JSON.stringify(existsCount));
        if (existsCount.length == 0) 
        {
            // console.log("user not found");
            var card = $(
                "<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>User Not Found</strong>  please try again.<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>"
            );
            $("#notfoud").append(card);
            return false;
        }
        else {
            if (logintype == "admin")
            {
                 window.open("../Admin/index.html","_self"  )
                 
            }
            else {
                window.open("./index.html","_self");
            }
            return false;
        }
        return false;
    });
});

        // -----------------------------------------------imp-------------------------------------------------------------
// localStorage.setItem("admin",JSON.stringify({"type":"admininfo","data":[{"First_Name":"ADARSH","Last_Name":"M","Email":"abcd@GMAIL.COM","Password":"33333"},{"First_Name":"ADARSH","Last_Name":"M","Email":"abcd@GMAIL.COM","Password":"33333"},{"First_Name":"ADARSH","Last_Name":"M","Email":"abcd@GMAIL.COM","Password":"33333"}]}))

// localStorage.setItem("user",JSON.stringify({"type":"userinfo","data":[{"First_Name":"ADARSH","Last_Name":"M","Email":"abcd@GMAIL.COM","Password":"33333"},{"First_Name":"ADARSH","Last_Name":"M","Email":"abcd@GMAIL.COM","Password":"33333"},{"First_Name":"ADARSH","Last_Name":"M","Email":"abcd@GMAIL.COM","Password":"33333"}]}))
        // -----------------------------------------------imp-------------------------------------------------------------
