// Using Function Expression, find the area of circle

const PI = 3.14;

let areaofCircle = (radius) => {
    return PI * radius * radius;
}

console.log(areaofCircle(2));

// Using Function Constructor, find the area of rectangle

let areaofRectangle = new Function("height", "width", "return height*width");

console.log(areaofRectangle(2, 3));

// Explain usage of Function Hosing using example

add(2, 3);
//add function is called even if it isnt declared

function add(a, b) {
    return a + b;
}

//above code works fine because of  function hoisting javascript where every function is declared at top while JS is parsing


// Using Function call create employee object with field Name, Address and Designation and pass it to function.

var employee = {
}

function createObj(name, address, Designation) {
    this.name = name;
    this.address = address;
    this.designation = Designation;
};

createObj.call(employee, "Raviraj", "A-12,Oscar heights", "software engineer");

console.log(employee.name, employee.address, employee.designation);


// Using Function Apply pass employee object to a function defined in the function.

// console.log(employee);

function foo() {

    // console.log(employee.name, employee.address, employee.designation);

    function bar(emp) {
        console.log(emp.name);
        console.log(emp.address);
        console.log(emp.designation);
    }

    bar(this)
}

foo.apply(employee)


// Explain Function closure with practical

//clouse allow function to have its own local variable which cant be modified through outside

//a function which return number of times the funciton is called;

let myFun = (function () {
    //local variable var
    let count = 0;
    return () => {
        count++;
        return count;
    }
})();

console.log(myFun());
console.log(myFun());
console.log(myFun());
console.log(myFun());
console.log(myFun());
console.log(myFun());






