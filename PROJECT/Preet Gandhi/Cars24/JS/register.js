function register(){
    var fullName = $("#name").val();
    var pincode = $("#pincode").val();
    var mobileNumber = $("#mobile").val();
    var email = $("#email").val();
    if(fullName == "" || pincode == "" || mobileNumber == "" || email == ""){
        $("p").eq(1).removeClass("d-none");
        return;
    }
    else{
        if(localStorage.registeredData){
            var storeData = new Array(localStorage.getItem("registeredData"));
            storeData.push(JSON.stringify({"name":fullName,"pincode":pincode,"mobile":mobileNumber,"email":email}));
            localStorage.setItem("registeredData",storeData);
        }
        else{
        localStorage.setItem("registeredData",JSON.stringify({"name":fullName,"pincode":pincode,"mobile":mobileNumber,"email":email}));
    }
        localStorage.setItem("login",true);
        window.location.assign("./index.html");
    }
}