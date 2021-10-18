var data = JSON.parse(localStorage.content)
function addoffer() {
    var offername = document.getElementById('offername').value
    var Start_date = document.getElementById('Start_date').value
    var End_date = document.getElementById('End_date').value
    var img1 = document.getElementById('img1').value
    var img2 = document.getElementById('img2').value
    var offer_carousel = document.getElementById('offer_carousel')
    var offer_static = document.getElementById('offer_static')
    var img1 = img1.replace("C:\\fakepath\\", "assets/img/");
    var img2 = img2.replace("C:\\fakepath\\", "assets/img/");

    if(offer_carousel.checked== true){
    arr = {
        "id": "1012",
        "offername": offername,
        "type":"offer-carousel",
        "startdate": Start_date,
        "enddate": End_date,
        "img": [
            {
                "img": img1
            },
            {
                "img": img2
            }
        ]
    }}
    else if(offer_static.checked == true){
        arr = {
        "id": "1013",
        "offername": offername,
        "type":"offer-static",
        "startdate": Start_date,
        "enddate": End_date,
        "img": [
            {
                "img": img1
            }
        ]
    }
    }
    data.element.push(arr)
    console.log(data.element)
    localStorage.setItem('content', JSON.stringify(data));
}