// Practice exercise_1
function areaofcircle(num){
        let res = (3.14)*(num*num);
        document.getElementById("result").innerHTML ="Area of " + num + " radius circle is " + res;
}

// Practice exercise_2

// function areaofrectangle(num1, num2){
//     var number1 = parseInt(num1);
//     var number2 = parseInt(num2);
//     let result = number1 + number2;
//     document.getElementById("result").innerHTML ="Area of rectangle is" + result;
// }

function areaofrectangle()
{
    var number1 = document.getElementById("length").value;
    var number2 = document.getElementById("width").value;
    let res = number1*number2;
    document.getElementById("result").innerHTML ="Area of rectangle is " + res;
}






// Practice exercise_3
function hosting(h){
    hoist()
    function hoist(){
        h.innerHTML = 'Example of hosting '
    }
}




// Practice exercise_4
function empDetails(){

    var Emp1 = {
        name: "Rahul",
        add: "Rajkot",
        desg: "Designer"
    }

    var Emp2 = {
        name: "Akshay",
        add: "Mumbai",
        desg: "Devops"
    }

    var employee = {
        details : function() {
            return  "Name: " +this.name +"<br>"+ " Address: " +this.add + "<br>" + " Designtion: " +this.desg;
        }
    }

    document.getElementById('emp1').innerHTML = "Employee 1: " +employee.details.call(Emp1);
    document.getElementById('emp2').innerHTML = "Employee 2: " +employee.details.call(Emp2);
}



// Practice exercise_5
function empDetails1(){

   var Employee1 = {
        name: "Akshay"
    }

    var Employee2 = {
        name: "Ajay"
    }

    var Employee = {
        details : function(feild,add,desg){
            return this.name+ "-- Feild: " +feild+ ", Address: " +add+ ", Designation: " +desg;
        }
    }

    document.getElementById('EmpDetails1').innerHTML = (Employee.details.apply(Employee1, ["Devops", "Mumbai", "Designer"]));
    document.getElementById('EmpDetails2').innerHTML = (Employee.details.apply(Employee2, ["Sales", "Delhi", "Manager"]));
}


// Practice exercise_6
var count = (function () {
    var c = 0;
    return function () {
        return c++;
    }
})();

function closure() {
    document.getElementById('result').innerHTML = count();
}
