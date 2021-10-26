//4.Using Function call create employee object with field Name, Address and Designation and pass it to function.
//5.Using Function Apply pass employee object to a function defined in the function.

let empDisplay = { empData: function(param) {

    return this.empName + '\t' +this.empAddress + '\t' + this.empDesignation + '\t' + param;
}}

let empDisplay2 = { empData: function(param) {

    return this.empName + '\t' +this.empAddress + '\t' + this.empDesignation + '\t' + param;
}}

let empObject = {
    empName: 'Niraj',
    empAddress: 'abc',
    empDesignation: 'Developer'
}

console.log(empDisplay.empData.call(empObject,'call method'));
console.log(empDisplay2.empData.apply(empObject,['apply method']));
