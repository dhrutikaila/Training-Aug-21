// * Practical: 4 Using Function call create employee object with field Name, Address and Designation and pass it to function.
// * Practical: 5 Using Function Apply pass employee object to a function defined in the function.
let empData = {
  empName: "sagar",
  empAddress: "Ahmedabad",
  empDesignation: "CEO",
};

let obj = {
  fnData: function (method) {
    return `Method: ${method}\n Employee Name: ${this.empName}\n Employee Address: ${this.empAddress}\n Employee Designation: ${this.empDesignation}`;
  },
};
console.groupCollapsed("Employee Data:");
console.log(obj.fnData.call(empData, "Employee Data using call() method:"));
console.log(obj.fnData.apply(empData, ["Employee Data using apply() method:"]));
console.groupEnd();

// * Practical: 6 Explain Function closure with practical
console.log(`%c Closures:`, `color:orange`);
const count = (() => {
  let counter = 0; // * local(private) variable
  return () => {
    counter++;
    console.log(`%c Counter: ${counter}`, `color:lightgreen`);
  };
})();

count();
count();
count();
count();
count();
