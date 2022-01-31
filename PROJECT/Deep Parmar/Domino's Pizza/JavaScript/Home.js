// for change the carousel property
var myCarousel = document.querySelector('#carouselslider')
var carousel = new bootstrap.Carousel(myCarousel, {
    interval: 4000,
    keyboard: true,
    pause: 'hover',
    wrap: true
});

$(document).ready(function() {
    getUserInfo();
});

function getUserInfo() {
    var userName = localStorage.getItem("LoginUser");
    $("#userName").html(userName)
    var contactNumber = localStorage.getItem("Contact Number");
    $("#contactNumber").html(contactNumber)
}

function clearUserData() {
    localStorage.clear();
}