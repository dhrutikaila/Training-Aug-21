let text = "ABCD EFGH IJKL MNOP QRST UVWX YZ";
        document.getElementById("0").innerHTML = "The string is: " +text;

        document.getElementById("1").innerHTML = "The string length is: " +text.length;

        document.getElementById("2").innerHTML = "Splitted string is: " +text.split(" ");

        document.getElementById("3").innerHTML = "Sliced string is: " +text.slice(5,20);

        document.getElementById("4").innerHTML = "Substring is: " +text.substring(12,26);

        document.getElementById("5").innerHTML = "Replaced string is: " +text.replace("ABCD","Leo Messi");

        document.getElementById("6").innerHTML = "lower case string is: " +text.toLowerCase();

        document.getElementById("7").innerHTML = "Char at 3rd position is: " +text.charAt(2);

        let x = 9.656;
        document.getElementById("8").innerHTML = 
        "Exponential function: " 
        +x.toFixed(0) + "<br>" 
        +x.toFixed(2) + "<br>" 
        +x.toFixed(4) + "<br>" 
        +x.toFixed(6)+ 
        "<br><br>To Precision: " 
        +x.toPrecision() + "<br>" +
        x.toPrecision(2) + "<br>" +
        x.toPrecision(4) + "<br>" +
        x.toPrecision(6);  

        var today = new Date();
        const d = new Date();
        const months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
        document.getElementById("9").innerHTML = 
        "Current date is: " +today.getDate()+"<br>" +
        "Current milliseconds are: " +today.getTime()+"<br>" +
        "Current month is: " +months[d.getMonth()]+"<br>" +
        "Current year is: " +today.getFullYear()+"<br>" +
        "Current Timezone offset is: " +today.getTimezoneOffset();