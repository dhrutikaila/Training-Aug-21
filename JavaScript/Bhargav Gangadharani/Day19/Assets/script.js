 // Question 1
 var area= function(n) {
    return Math.PI * n * n;
}
function areaCircle(r,ans){
    var radius = r.value
    var answer = area(radius).toFixed(3);
    console.log(answer)
    ans.innerHTML = answer; 
}
// Question 2
let areaRectangle = function(l,b) {
    this.ans = l * b;
    return this.ans;
}
function areaRect(h,w){
    let answer = new areaRectangle(h.value,w.value);
    console.log(answer)
}
// Question 3 
function ques3(x){
    hoist()
    function hoist(){
        x.innerHTML = 'This function is called before defining.'
    }
}
// Question 4 
function empObj(){
    var employee = {
        details : function() {
            return  "Name: " +this.name+ ", Address: " +this.add+ ", Designtion: " +this.desg;
        }
    }

    var Emp1 = {
        name: "Aakash",
        add: "Mumbai",
        desg: "Manager"
    }

    var Emp2 = {
        name: "Samay",
        add: "Ahmedabad",
        desg: "Manager"
    }
    document.getElementById('ans4').innerHTML = "Employee 1: " +employee.details.call(Emp1);
    document.getElementById('ans5').innerHTML = "Employee 2: " +employee.details.call(Emp2);
}
// Question 5
function empObj2(){
    var Employee = {
        details : function(feild,add,desg){
            return this.name+ "-- Feild: " +feild+ ", Address: " +add+ ", Designation: " +desg;
        }
    }

    var Employee1 = {
        name: "Tanmay"
    }

    var Employee2 = {
        name: "Rahul"
    }

    document.getElementById('ans6').innerHTML = (Employee.details.apply(Employee1, ["Web Developer", "Ahmedabad", "Manager"]));
    document.getElementById('ans7').innerHTML = (Employee.details.apply(Employee2, ["Sales", "Pune", "Manager"]));
}

// Question 6
  var add = (function () {
    var counter = 0;
    return function () {
        counter += 1;
        return counter;
    }
})();

function closure() {
    document.getElementById('displaycounter').innerHTML = add();
}