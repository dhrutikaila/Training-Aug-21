// const add = (function () {
// var counter1 = parseInt(document.getElementById("quantity1").innerHTML);
// return function () {counter1 += 1; return counter1;}
// })();

// const sub = (function () {
// var counter = counter1;
// return function () {counter -= 1; return counter;}
// })();

//functions for quantity1 incriment decriment
function add_qnt1()
{
    document.getElementById("quantity1").stepUp();
}

function less_qnt1()
{
    document.getElementById("quantity1").stepDown();
}
//functions for quantity2 incriment decriment
function add_qnt2()
{
    document.getElementById("quantity2").stepUp();
}

function less_qnt2()
{
    document.getElementById("quantity2").stepDown();
}
//functions for quantity3 incriment decriment
function add_qnt3()
{
    document.getElementById("quantity3").stepUp();
}

function less_qnt3()
{
    document.getElementById("quantity3").stepDown();
}
//functions for quantity4 incriment decriment
function add_qnt4()
{
    document.getElementById("quantity4").stepUp();
}

function less_qnt4()
{
    document.getElementById("quantity4").stepDown();
}
//functions for quantity5 incriment decriment
function add_qnt5()
{
    document.getElementById("quantity5").stepUp();
}

function less_qnt5()
{
    document.getElementById("quantity5").stepDown();
}
        
//function for get data
function add1()
{
    let pid = document.getElementById("pid1").innerHTML;
    let pname = document.getElementById("pname1").innerHTML;
    let price = document.getElementById("price1").innerHTML;
    let qnt = document.getElementById("quantity1").value;
    let total = parseInt(price) * parseInt(qnt);
    if(parseInt(qnt) > 0)
    {
        let obj = {"productId":pid,"ProductName":pname,"price":price,"quantity":qnt,"total":total};
        let myJSON = JSON.stringify(obj);
        localStorage.setItem("p1", myJSON);
    }
}

function add2()
{
    let pid = document.getElementById("pid2").innerHTML;
    let pname = document.getElementById("pname2").innerHTML;
    let price = document.getElementById("price2").innerHTML;
    let qnt = document.getElementById("quantity2").value;
    let total = parseInt(price) * parseInt(qnt);
    if(parseInt(qnt) > 0)
    {
        let obj = {"productId":pid,"ProductName":pname,"price":price,"quantity":qnt,"total":total};
        let myJSON = JSON.stringify(obj);
        localStorage.setItem("p2", myJSON);
    }
}

function add3()
{
    var pid = document.getElementById("pid3").innerHTML;
    var pname = document.getElementById("pname3").innerHTML;
    var price = document.getElementById("price3").innerHTML;
    var qnt = document.getElementById("quantity3").value;
    let total = parseInt(price) * parseInt(qnt);
    if(parseInt(qnt) > 0)
    {
        let obj = {"productId":pid,"ProductName":pname,"price":price,"quantity":qnt,"total":total};
        let myJSON = JSON.stringify(obj);
        localStorage.setItem("p3", myJSON);
    }
}

function add4()
{
    var pid = document.getElementById("pid4").innerHTML;
    var pname = document.getElementById("pname4").innerHTML;
    var price = document.getElementById("price4").innerHTML;
    var qnt = document.getElementById("quantity4").value;
    let total = parseInt(price) * parseInt(qnt);
    if(parseInt(qnt) > 0)
    {
        let obj = {"productId":pid,"ProductName":pname,"price":price,"quantity":qnt,"total":total};
        let myJSON = JSON.stringify(obj);
        localStorage.setItem("p4", myJSON);
    }
}

function add5()
{
    var pid = document.getElementById("pid5").innerHTML;
    var pname = document.getElementById("pname5").innerHTML;
    var price = document.getElementById("price5").innerHTML;
    var qnt = document.getElementById("quantity5").value;
    let total = parseInt(price) * parseInt(qnt);
    if(parseInt(qnt) > 0)
    {
        let obj = {"productId":pid,"ProductName":pname,"price":price,"quantity":qnt,"total":total};
        let myJSON = JSON.stringify(obj);
        localStorage.setItem("p5", myJSON);
    }
}

function cart_summary()
{
location.href = "./cart_summary.html";
}