//1 Using Function Expression, find the area of circle

var f = (r) => Math.PI * r ** r;
console.log(f(4));

//2  Using Function Constructor, find the area of rectangle

var s = new Function("a", "b", "return a*b");
var w = 23;
var h = 24;
console.log(s(w, h));

//3 Explain usage of Function Hosing using example

//call function
employeeinfo("vraj", "marvania");

//declare function
function employeeinfo(name, surname) {
  document.write("fullname:=  " + name + "  " + surname);
}

//4 Using Function call create employee object with field Name, Address and Designation and pass it to function.

function info(namee, address, designation) {
  const employee = {
    Name: namee,
    Address: address,
    Designation: designation,
  };
  console.log(
    "Name--> " + employee.Name,
    "  Address--> " + employee.Address,
    "   Designation--> " + employee.Designation
  );
}

info("vraj", "harinager main road", "er");

//5 Using Function Apply pass employee object to a function defined in the function.

function info2() {
  console.log(
    "Name--> " + employee.Name,
    "  Address--> " + employee.Address,
    "   Designation--> " + employee.Designation
  );
}

const employee = {
  Name: "darshan",
  Address: "150 fit ring road ",
  Designation: "doctor",
};
info2(employee);

//6 Explain Function closure with practical

// Closures

//inner function access all perameters of parent function
function empinfo(name, surname) {
  function fullname() {
    console.log(name + " " + surname);
  }
  fullname(); //call inner fun
}
//call parent fun
empinfo("vraj", "marvania");

// 2

function empinfo2(name, surname) {
  function fullname() {
    console.log(name + " " + surname);
  }
  return fullname;
}

var fname = empinfo2("karan", "patel");
console.log(fname); //show a function deff
fname();
