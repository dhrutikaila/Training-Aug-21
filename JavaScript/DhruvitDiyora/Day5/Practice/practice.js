//Using Function Expression, find the area of circle
const a = function (r) { return Math.PI * r * r }
console.log(a(5))


//Using Function Constructor, find the area of rectangle
function sides(len, breadth) {
    this.l = len;
    this.b = breadth;    
}
const rect =new sides(5, 10);
rect.area = function () {
    return this.l * this.b;
}
console.log(rect.area())

//Explain usage of Function Hosing using example

console.log(square(5));
function square(y) {
  return y * y;
}

//Using Function call create employee object with field Name, Address and Designation and pass it to function.
const company = {
  details: function() {
    return  " field Name is "+this.fieldName + " , Address  is " + this.address+ " and Designation is "+ this.designation;
  }
}

const employee = {
  fieldName:"science",
  address: "katargam,surat",
  designation:"professor"
}

console.log(company.details.call(employee));


//Using Function Apply pass employee object to a function defined in the function.
const companies = {
  details: function(area,country) {
    return  " field Name is "+this.fieldName + " , Address  is " + this.address+ " and Designation is "+ this.designation + " Area: " + area + "  country: "+country;
  }
}
console.log(companies.details.apply(employee, ["Surat", "India"]));


//Explain Function closure with practical
//use global 
function Counter() {
    var counter = 0;

    function IncreaseCounter() {
        return counter += 1;
    };

    return IncreaseCounter;
}

var counter = Counter();
console.log(counter()); // 1
console.log(counter()); // 2
console.log(counter()); // 3
console.log(counter()); // 4

var counters = (function() {
  var privateCounter = 0;
  function changeBy(val) {
    privateCounter += val;
  }
  return {
    increment: function() {
      changeBy(1);
    },
    decrement: function() {
      changeBy(-1);
    },
    value: function() {
      return privateCounter;
    }
  };   
})();

console.log(counters.value()); // 0
counters.increment();
counters.increment();
console.log(counters.value()); // 2
counters.decrement();
console.log(counters.value()); // 1
