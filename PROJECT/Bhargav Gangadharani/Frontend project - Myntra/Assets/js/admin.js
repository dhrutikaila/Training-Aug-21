$(document).ready(function () {
    var data = JSON.parse(localStorage.content)

    $.each(data.element, function (j) {
        if (data.element[j].type == "category") {
            $('#tbody-categories')
                .append($('<tr></tr>')
                    .append($('<td></td>').append(data.element[j].id))
                    .append($('<td></td>').append(data.element[j].offername))
                    .append($('<td></td>').append(data.element[j].startdate))
                    .append($('<td></td>').append(data.element[j].enddate))
                    .append($('<td></td>').append('<img src="'+data.element[j].titleimg+'">'))
                    .append($('<td id="td'+j+'"></td>'))
                );
                $.each(data.element[j].cardimg, function(i){
                    $('#td'+j).append('<img src="'+data.element[j].cardimg[i].img+'">')
                })
        }
        if(data.element[j].type == "offer-static"){
            $('#tbody-offers')
                .append($('<tr></tr>')
                    .append($('<td></td>').append(data.element[j].id))
                    .append($('<td></td>').append(data.element[j].offername))
                    .append($('<td></td>').append(data.element[j].type))
                    .append($('<td></td>').append(data.element[j].startdate))
                    .append($('<td></td>').append(data.element[j].enddate))
                    .append($('<td></td>').append('<img src="'+data.element[j].img+'">'))
                );
        }
        if (data.element[j].type == "offer-carousel") {
            $('#tbody-offers')
                .append($('<tr></tr>')
                    .append($('<td></td>').append(data.element[j].id))
                    .append($('<td></td>').append(data.element[j].offername))
                    .append($('<td></td>').append(data.element[j].type))
                    .append($('<td></td>').append(data.element[j].startdate))
                    .append($('<td></td>').append(data.element[j].enddate))
                    .append($('<td id="td'+j+'"></td>'))
                );
                $.each(data.element[j].carouselimg, function(i){
                    $('#td'+j).append('<img src="'+data.element[j].carouselimg[i].img+'">')
                })
        }
    });
  
    });
