$(document).ready(function() {
    var Data = JSON.parse(localStorage.getItem("Offers"));

    if (Data == null) {
        $.getJSON("JSON/Offers.json", function(Offers, status) {
            if (status == "success") {
                localStorage.setItem("Offers", JSON.stringify(Offers));
                ShowOffer();
            } else {
                alert("Error" + status);
            }
        });
    } else {
        //Display The Data From Local Storage
        ShowOffer();
    }

    getUserInfo();

});

//Show Offers Which is Fetch From Local Storage
function ShowOffer() {
    var Offers_Data = JSON.parse(localStorage.getItem("Offers"));
    var Offer_Str = ""
    $.each(Offers_Data, function(index, Data) {
        Offer_Str = Offer_Str + (
            "<div class='col'>" +
            "<div class='card h-100'>" +
            "<img src='" + Data.Offer_Img + "' class='card-img-top'>" +
            "<div class='card-body'>" +
            "<div class='card-title mb-2'>" + Data.Offer_Title + "</div>" +
            "<div class='card-text text-muted mb-2'>" + Data.Offer_Discription + "</div>" +
            "<a href='#' class='card-link text-primary'>T&Cs</a>" +
            "</div>" +
            "</div>" +
            "</div>");
    });
    $("#Offer_List").html(Offer_Str);
}

//Add New Offer
function AddOffer(Offer_Title, Offer_Discription, Offer_Img_src, ) {
    var Offers_Old_Data = JSON.parse(localStorage.getItem("Offers"));
    var Id = Offers_Old_Data.length + 1
    var Offer = {
        "Id": Id,
        "Offer_Img": Offer_Img_src,
        "Offer_Title": Offer_Title,
        "Offer_Discription": Offer_Discription
    }
    Offers_Old_Data.push(Offer);
    localStorage.setItem("Offers", JSON.stringify(Offers_Old_Data));
    ShowOffer();
}

//Check User Role Show Their Related Details
function getUserInfo() {
    var userName = localStorage.getItem("LoginUser");
    var contactNumber = localStorage.getItem("Contact Number");
    var role = localStorage.getItem("Role");

    $("#userName").html(userName);
    $("#contactNumber").html(contactNumber);

    if (role == "user") {
        $("#role").hide();
        // $("#role").css("display", "none");
    }
}

//If User LogOut Then All Local Storage is Clear
function clearUserData() {
    localStorage.clear();
}