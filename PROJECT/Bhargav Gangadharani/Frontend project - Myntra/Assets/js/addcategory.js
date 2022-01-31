
    var data = JSON.parse(localStorage.content)
    function addcategory() {
        var offername = document.getElementById('offername').value
        var Start_date = document.getElementById('Start_date').value
        var End_date = document.getElementById('End_date').value
        var titleimg = document.getElementById('titleimg').value
        var Cardimg1 = document.getElementById('Cardimg1').value
        var Cardimg2 = document.getElementById('Cardimg2').value
        var Cardimg3 = document.getElementById('Cardimg3').value
        var Cardimg4 = document.getElementById('Cardimg4').value
        var Cardimg5 = document.getElementById('Cardimg5').value
        var titleimg = titleimg.replace("C:\\fakepath\\", "assets/img/");
        var Cardimg1 = Cardimg1.replace("C:\\fakepath\\", "assets/img/");
        var Cardimg2 = Cardimg1.replace("C:\\fakepath\\", "assets/img/");
        var Cardimg3 = Cardimg1.replace("C:\\fakepath\\", "assets/img/");
        var Cardimg4 = Cardimg1.replace("C:\\fakepath\\", "assets/img/");
        var Cardimg5 = Cardimg1.replace("C:\\fakepath\\", "assets/img/");
        arr = {
            "id": "1012",
            "offername": offername,
            "type": "category",
            "startdate": Start_date,
            "enddate": End_date,
            "titleimg": titleimg,
            "cardimg": [
                {
                    "img": Cardimg1
                },
                {
                    "img": Cardimg2
                },
                {
                    "img": Cardimg3
                },
                {
                    "img": Cardimg4
                },
                {
                    "img": Cardimg5
                }
            ]
        }
        data.element.push(arr)
        console.log(data.element)
        localStorage.setItem('content', JSON.stringify(data));
    }