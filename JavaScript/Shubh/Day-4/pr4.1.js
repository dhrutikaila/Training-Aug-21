function squareNumber(){

    function mySquare (num, callback){
        callback(num*num);
    }
    
    function print(square){
        document.getElementById('square').innerText = "Square : " + square;
    }
    
    number =  document.getElementById('number').value;
    mySquare(number,print);
    }