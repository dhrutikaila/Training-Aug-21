$(document).ready(function(){
    $("#dropdownitem1").hide();
    $("#dropdownMenuButton1").click(function(){
        $("#dropdownitem1").toggle();
    });

    $("#dropdownitem2").hide();
    $("#dropdownMenuButton2").click(function(){
        $("#dropdownitem2").toggle();
    });
    
    $("#dropdownitem3").hide();
    $("#dropdownMenuButton3").click(function(){
        $("#dropdownitem3").toggle();
    });
    
    $("#dropdownitem4").hide();
    $("#dropdownMenuButton4").click(function(){
        $("#dropdownitem4").toggle();
    });
    
    $("#dropdownitem5").hide();
    $("#dropdownMenuButton5").click(function(){
        $("#dropdownitem5").toggle();
    });
    
    $("#dropdownitem6").hide();
    $("#dropdownMenuButton6").click(function(){
        $("#dropdownitem6").toggle();
    });
    
    $("#dropdownitem7").hide();
    $("#dropdownMenuButton7").click(function(){
        $("#dropdownitem7").toggle();
    });
    
    $("#dropdownitem8").hide();
    $("#dropdownMenuButton8").click(function(){
        $("#dropdownitem8").toggle();
    });
    
    $("#rentmenu").hide();
    $("#commercialmenu").hide();
    $("#navbtnPostYourProperty").hide();
    
    $("#rentContent").hide();
    
    $("#Postfreeaddcontent").hide();
    $("#Manage_Rent_property_Content").hide();

});




$(document).ready(function(){
    $("#btnRent").click(function(){
        $("#btnRent").css({"color":"red", "border-bottom-style":"solid", "border-bottom-color":"red"});
        $("#btnBuy").css({"color":"black", "border-bottom-style":"solid", "border-bottom-color":"white"});
        $("#btnCommercial").css({"color":"black", "border-bottom-style":"solid", "border-bottom-color":"white"});

        $("#buymenu").hide();
        $("#commercialmenu").hide();
        $("#rentmenu").show();
        
        $("#buyContent").hide();
        $("#rentContent").show();
        

    });

    $("#btnCommercial").click(function(){
        $("#btnCommercial").css({"color":"red", "border-bottom-style":"solid", "border-bottom-color":"red"});
        $("#btnBuy").css({"color":"black", "border-bottom-style":"solid", "border-bottom-color":"white"});
        $("#btnRent").css({"color":"black", "border-bottom-style":"solid", "border-bottom-color":"white"});

        $("#buymenu").hide();
        $("#rentmenu").hide();
        $("#commercialmenu").show();

        $("#navbtnForPropertyOwners").hide();
        $("#navbtnPostYourProperty").show();


    });

    $("#btnBuy").click(function(){
        $("#btnBuy").css({"color":"red", "border-bottom-style":"solid", "border-bottom-color":"red"});
        $("#btnRent").css({"color":"black", "border-bottom-style":"solid", "border-bottom-color":"white"});
        $("#btnCommercial").css({"color":"black", "border-bottom-style":"solid", "border-bottom-color":"white"});

        $("#rentmenu").hide();
        $("#commercialmenu").hide();
        $("#buymenu").show();
        
        $("#rentContent").hide();
        $("#buyContent").show();
        
    });

});

$(document).ready(function(){
    $("#btnbottomFlatforSale").click(function(){
        $("#btnbottomFlatforSale").css({"border-bottom-style":"solid", "border-bottom-color":"black", "color":"black", "background-color":"silver"});
        $("#btnbottomFlatforRent").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforPg").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatmates").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomMiscellaneous").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomCommercial").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
    });

    $("#btnbottomFlatforRent").click(function(){
        $("#btnbottomFlatforRent").css({"border-bottom-style":"solid", "border-bottom-color":"black", "color":"black", "background-color":"silver"});
        $("#btnbottomFlatforSale").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforPg").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatmates").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomMiscellaneous").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomCommercial").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
    });

    $("#btnbottomFlatforPg").click(function(){
        $("#btnbottomFlatforPg").css({"border-bottom-style":"solid", "border-bottom-color":"black", "color":"black", "background-color":"silver"});
        $("#btnbottomFlatforRent").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforSale").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatmates").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomMiscellaneous").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomCommercial").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
    });

    $("#btnbottomFlatmates").click(function(){
        $("#btnbottomFlatmates").css({"border-bottom-style":"solid", "border-bottom-color":"black", "color":"black", "background-color":"silver"});
        $("#btnbottomFlatforRent").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforPg").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforSale").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomMiscellaneous").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomCommercial").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
    });

    $("#btnbottomMiscellaneous").click(function(){
        $("#btnbottomMiscellaneous").css({"border-bottom-style":"solid", "border-bottom-color":"black", "color":"black", "background-color":"silver"});
        $("#btnbottomFlatforRent").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforPg").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatmates").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforSale").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomCommercial").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
    });

    $("#btnbottomCommercial").click(function(){
        $("#btnbottomCommercial").css({"border-bottom-style":"solid", "border-bottom-color":"black", "color":"black", "background-color":"silver"});
        $("#btnbottomFlatforRent").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforPg").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatmates").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomMiscellaneous").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
        $("#btnbottomFlatforSale").css({"border-bottom-style":"none", "border-bottom-color":"black", "color":"black", "background-color":"inherit"});
    });
});

function obclickbtnPostadd() {
    $("#mainpagecontent").hide();
    $("#Postfreeaddcontent").show();
}

function btn_move() {
    //$("#mainpagecontent").hide();
    $("#Postfreeaddcontent").hide();
    $("#Manage_Rent_property_Content").show();
}

$(document).ready(function(){
    $("#secondpageonclickCommercialContent").hide();
    $("#btnPropertyTypeCommercial").click(function(){
        $("#btnPropertyTypeCommercial").addClass("border-bottom border-3 border-success");
        $("#btnPropertyTypeCommercial").removeClass("bg-secondary bg-opacity-10");
        $("#btnPropertyTypeResidential").removeClass("border-bottom border-3 border-success");
        $("#btnPropertyTypeResidential").addClass("bg-secondary bg-opacity-10");
        $("#secondpageonclickCommercialContent").show();
        $("#secondpageonclickReaidentialContent").hide();
    });

    $("#btnPropertyTypeResidential").click(function(){
        $("#btnPropertyTypeResidential").addClass("border-bottom border-3 border-success");
        $("#btnPropertyTypeResidential").removeClass("bg-secondary bg-opacity-10");
        $("#btnPropertyTypeCommercial").removeClass("border-bottom border-3 border-success");
        $("#btnPropertyTypeCommercial").addClass("bg-secondary bg-opacity-10");
        $("#secondpageonclickCommercialContent").hide();
        $("#secondpageonclickReaidentialContent").show();
    });

    $("#btnofsecondpageResale").click(function(){
        $("#btnofsecondpageResale").addClass("bg-success text-white");
        $("#btnofsecondpageResale").removeClass("bg-secondary bg-opacity-10");
        $("#btnofsecondpageRent").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageRent").removeClass("bg-success text-white");
        $("#btnofsecondpagePgHostel").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpagePgHostel").removeClass("bg-success text-white");
        $("#btnofsecondpageFlatmates").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageFlatmates").removeClass("bg-success text-white");
    });

    $("#btnofsecondpagePgHostel").click(function(){
        $("#btnofsecondpagePgHostel").addClass("bg-success text-white");
        $("#btnofsecondpagePgHostel").removeClass("bg-secondary bg-opacity-10");
        $("#btnofsecondpageRent").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageRent").removeClass("bg-success text-white");
        $("#btnofsecondpageFlatmates").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageFlatmates").removeClass("bg-success text-white");
        $("#btnofsecondpageResale").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageResale").removeClass("bg-success text-white");
    });

    $("#btnofsecondpageFlatmates").click(function(){
        $("#btnofsecondpageFlatmates").addClass("bg-success text-white");
        $("#btnofsecondpageFlatmates").removeClass("bg-secondary bg-opacity-10");
        $("#btnofsecondpageRent").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageRent").removeClass("bg-success text-white");
        $("#btnofsecondpagePgHostel").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpagePgHostel").removeClass("bg-success text-white");
        $("#btnofsecondpageResale").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageResale").removeClass("bg-success text-white");
    });

    $("#btnofsecondpageRent").click(function(){
        $("#btnofsecondpageRent").addClass("bg-success text-white");
        $("#btnofsecondpageRent").removeClass("bg-secondary bg-opacity-10");
        $("#btnofsecondpageFlatmates").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageFlatmates").removeClass("bg-success text-white");
        $("#btnofsecondpagePgHostel").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpagePgHostel").removeClass("bg-success text-white");
        $("#btnofsecondpageResale").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageResale").removeClass("bg-success text-white");
    });

    $("#btnofsecondpageSaleforCommercial").click(function(){
        $("#btnofsecondpageSaleforCommercial").addClass("bg-success text-white");
        $("#btnofsecondpageSaleforCommercial").removeClass("bg-secondary bg-opacity-10");
        $("#btnofsecondpageRentforCommercial").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageRentforCommercial").removeClass("bg-success text-white");
    });

    $("#btnofsecondpageRentforCommercial").click(function(){
        $("#btnofsecondpageRentforCommercial").addClass("bg-success text-white");
        $("#btnofsecondpageRentforCommercial").removeClass("bg-secondary bg-opacity-10");
        $("#btnofsecondpageSaleforCommercial").addClass("bg-secondary bg-opacity-10 text-dark");
        $("#btnofsecondpageSaleforCommercial").removeClass("bg-success text-white");
    });

   
});

//------------------------------------------------------//
$(document).ready(function(){
    $("#localityDetailsContent1").hide();
    $("#rentalDetailsContent1").hide();
    $("#amenitiesContent1").hide();
    $("#gallaryContent1").hide();
    $("#save_continue1").click(function(){
        $("#localitiesDetails1").addClass("border-start border-4 border-success");
        $("#propertyDetails1").removeClass("border-start border-4 border-success");
        $("#PropertyDetailsContent1").hide();
        $("#localityDetailsContent1").show();
    });

    $("#back2").click(function(){
        $("#propertyDetails1").addClass("border-start border-4 border-success");
        $("#localitiesDetails1").removeClass("border-start border-4 border-success");
        $("#localityDetailsContent1").hide();
        $("#PropertyDetailsContent1").show();
    });

    $("#save_continue2").click(function(){
        $("#rentalDetails1").addClass("border-start border-4 border-success");
        $("#localitiesDetails1").removeClass("border-start border-4 border-success");
        $("#localityDetailsContent1").hide();
        $("#rentalDetailsContent1").show();
    });

    $("#back3").click(function(){
        $("#localitiesDetails1").addClass("border-start border-4 border-success");
        $("#rentalDetails1").removeClass("border-start border-4 border-success");
        $("#rentalDetailsContent1").hide();
        $("#localityDetailsContent1").show();
    });

    $("#save_continue3").click(function(){
        $("#amenities1").addClass("border-start border-4 border-success");
        $("#rentalDetails1").removeClass("border-start border-4 border-success");
        $("#rentalDetailsContent1").hide();
        $("#amenitiesContent1").show();
    });

    $("#back4").click(function(){
        $("#rentalDetails1").addClass("border-start border-4 border-success");
        $("#amenities1").removeClass("border-start border-4 border-success");
        $("#amenitiesContent1").hide();
        $("#rentalDetailsContent1").show();
    });

    $("#save_continue4").click(function(){
        $("#gallary1").addClass("border-start border-4 border-success");
        $("#amenities1").removeClass("border-start border-4 border-success");
        $("#amenitiesContent1").hide();
        $("#gallaryContent1").show();
    });

    $("#back5").click(function(){
        $("#amenities1").addClass("border-start border-4 border-success");
        $("#gallary1").removeClass("border-start border-4 border-success");
        $("#gallaryContent1").hide();
        $("#amenitiesContent1").show();
    });
});
//------------------------------------------------------//


