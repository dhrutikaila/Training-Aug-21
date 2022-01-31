$('.post-wrapper').slick({
    slidesToShow: 4,
    slidesToScroll: 4,
    autoplay: true,
    autoplaySpeed: 2000,
    nextArrow: $('.nextar'),
    prevArrow: $('.prevar')
});
$('.onlyhere-wrapper').slick({
    slidesToShow: 4,
    slidesToScroll: 4,
    autoplay: true,
    autoplaySpeed: 2000,
    nextArrow: $('.nextarr'),
    prevArrow: $('.prevarr')
});

$("#bestsellers").click(function () {
    $(".recommanded").addClass("visually-hidden");
    $(".new_launches").addClass("visually-hidden");
    $(".best_sellers").removeClass("visually-hidden");
    $(".div_recommanded").removeClass("activex");
    $(".div_new_Launches").removeClass("activex");
    $(".div_best_sellers").addClass("activex");
})
$("#newlaunches").click(function () {
    $(".recommanded").addClass("visually-hidden");
    $(".best_sellers").addClass("visually-hidden");
    $(".new_launches").removeClass("visually-hidden");
    $(".div_recommanded").removeClass("activex");
    $(".div_new_Launches").addClass("activex");
    $(".div_best_sellers").removeClass("activex");
})
$("#recommanded").click(function () {
    $(".recommanded").removeClass("visually-hidden");
    $(".best_sellers").addClass("visually-hidden");
    $(".new_launches").addClass("visually-hidden");
    $(".div_recommanded").addClass("activex");
    $(".div_new_Launches").removeClass("activex");
    $(".div_best_sellers").removeClass("activex");
})
$("#audio").click(function () {
    $(".lifestyle").addClass("visually-hidden");
    $(".other_accessories").addClass("visually-hidden");
    $(".audio").removeClass("visually-hidden");
    $(".div_audio").addClass("activex");
    $(".div_ifestyle").removeClass("activex");
    $(".div_other_accessories").removeClass("activex");
})
$("#lifestyle").click(function () {
    $(".audio").addClass("visually-hidden");
    $(".other_accessories").addClass("visually-hidden");
    $(".lifestyle").removeClass("visually-hidden");
    $(".div_audio").removeClass("activex");
    $(".div_ifestyle").addClass("activex");
    $(".div_other_accessories").removeClass("activex");
})
$("#otheraccessories").click(function () {
    $(".other_accessories").removeClass("visually-hidden");
    $(".audio").addClass("visually-hidden");
    $(".lifestyle").addClass("visually-hidden");
    $(".div_audio").removeClass("activex");
    $(".div_ifestyle").removeClass("activex");
    $(".div_other_accessories").addClass("activex");
})
$(".navbar-toggler-icon").click(function () {

    $("#navbarSupportedContent").toggleClass("visually-hidden");
})

$(".div_recommanded").click(function()
{
    $(this).addClass("activex");
})

// Gone_in_flash data
$.getJSON("../Json/gone_in_flash.json", function (info) {
    localStorage.setItem('gone_in_flash_data', JSON.stringify(info));
    var mydata = (JSON.parse((localStorage.getItem('gone_in_flash_data'))));
    var user_data = '';
    $(mydata).each(function (key, value) {
        user_data += '<div class="post d-inline-block">';
        user_data += '<div class="card m-3" style="width: 18rem;">';
        user_data += '<div class="timer text-center mt-3">' + this.timer + '</div>';
        user_data += '<img src=' + this.image + ' class="card-img-top" alt="...">';
        user_data += '<div class="card-body">';
        user_data += ' <h5 class="card-title text-center">' + this.name + '</h5>';
        user_data += '<p class="card-text text-center ">' + this.color + '</p>';
        user_data += '<h4 class="card-text text-center text-danger">' + this.price +
        '<del class="text-muted">';
        user_data += '<small>' + this.dprice + '</small></del></h4>'
        user_data += '</div>';
        user_data += '</div>';
        user_data += '</div>';
    });
    $("#gone_in_flash").append(user_data);
})

// onlyhere_data
$.getJSON("../Json/onlyhere.json",function(only)
{
    localStorage.setItem('onlyhere_data', JSON.stringify(only));
    var onlydata = (JSON.parse((localStorage.getItem('onlyhere_data'))));
    var only_data = '';
    $(onlydata).each(function (key, value) {
        only_data += '<div class="onlypost d-inline-block">';
        only_data += '<div class="card m-3" style="width: 18rem;">';
        only_data += '<img src=' + this.image + ' class="card-img-top" alt="...">';
        only_data += '<div class="card-body">';
        only_data += ' <h5 class="card-title text-center">' + this.name + '</h5>';
        only_data += '<h4 class="card-text text-center text-danger">' + this.price +
        '<del class="text-muted">';
        only_data += '<small>' + this.dprice + '</small></del></h4>'
        only_data += '</div>';
        only_data += '</div>';
        only_data += '</div>';
    });
    $("#onlyhere_slider").append(only_data);
})

// smartphones/recommanded data
$.getJSON('../Json/recommanded.json',function(recom)
{
    localStorage.setItem('recom_data',JSON.stringify(recom));
    var recomdata = (JSON.parse(localStorage.getItem('recom_data')));
    var recom_data = '';
    $(recomdata).each(function(key,value)
    {
        recom_data += '<div class="col">';
        recom_data += '<div class="onlypost">';
        recom_data += '<div class="card" style="width: 18rem;">';
        recom_data += '<img src=' + this.image + ' class="card-img-top" alt="...">';
        recom_data += '<div class="card-body">';
        recom_data += '<h5 class="card-title text-center">' + this.name + '</h5>';
        recom_data += '<h4 class="card-text text-center text-danger">' + this.price +'</h4>';
        recom_data += '</div>';
        recom_data += '</div>';
        recom_data += '</div>';
        recom_data += '</div>';
    })
    $("#recm").append(recom_data);
})

