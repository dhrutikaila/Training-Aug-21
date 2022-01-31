//calling sequence
        function myDisplayer(some) {
        document.getElementById("demo").innerHTML = some;
        }

        function myFirst() {
        myDisplayer("Hello");
        }

        function mySecond() {
        myDisplayer("Goodbye");
        }

        mySecond();
        myFirst();

        //js callbacks
        function myDisplayer(some) {
        document.getElementById("demo1").innerHTML = some;
        }

        function myCalculator(num1, num2, myCallback) {
        let sum = num1 * num2;
        myCallback(sum);
        }

        myCalculator(6, 48, myDisplayer);

        //promises
        function myDisplayer(some) {
        document.getElementById("6").innerHTML = some;
        }

        let myPromise = new Promise(function(myResolve, myReject) {
        let x = 0;

        // some code (try to change x to 5)

        if (x == 48) {
            myResolve("OK");
        } else {
            myReject("Error");
        }
        });

        myPromise.then(
        function(value) {myDisplayer(value);},
        function(error) {myDisplayer(error);}
        );