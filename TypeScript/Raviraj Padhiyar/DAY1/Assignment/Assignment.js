/**
 * Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the employee from the Array. Create one more array emp and join the value with above array. When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.PF should be computed and total salary should be display.
 */
var arr = [];
arr.push({
    Id: 1,
    FirstName: "Raviraj",
    LastName: "Padhiyar",
    Address: "Sola,Ahmedabad,Gujarat",
    Salary: 25000
});
arr.push({
    Id: 2,
    FirstName: "Rahul",
    LastName: "Parmar",
    Address: "Bavla,Ahmedabad,Gujarat",
    Salary: 20000
});
arr.push({
    Id: 3,
    FirstName: "Abhi",
    LastName: "Vyas",
    Address: "kuchaman,Naguar,Rajasthan",
    Salary: 30000
});
arr.push({
    Id: 4,
    FirstName: "Mohil",
    LastName: "Vaghela",
    Address: "Nadia,kheda,gujarat",
    Salary: 25000
});
arr.push({
    Id: 5,
    FirstName: "Smit",
    LastName: "Patel",
    Address: "vastraput,Ahmedabad,Gujarat",
    Salary: 30000
});
//searching operation
//search by index
function searchByIndex(array, index) {
    if (index >= array.length) {
        return null;
    }
    return arr[index];
}
var _5thEmployee = searchByIndex(arr, 4);
console.log(_5thEmployee);
//search by Id
function searchByEmployeeId(array, key) {
    return array.filter(function (emp) { return emp.Id === key; })[0];
}
var employeeWithId4 = searchByEmployeeId(arr, 4);
console.log(employeeWithId4);
//insert employee
function InsertEmployee(employee) {
    arr.push(employee);
}
InsertEmployee({ Id: 6, FirstName: "Ronak", LastName: "Sharma", Address: "Surat", Salary: 15000 });
console.log(arr);
//delete employee
function DeleteEmployeebyId(Id) {
    arr = arr.filter(function (employee) { return employee.Id !== Id; });
}
DeleteEmployeebyId(6);
console.log(arr);
// Create one more array emp and join the value with above array
var arr2 = [];
arr2.push({
    Id: 10,
    FirstName: "Nirmal",
    LastName: "Kunar",
    Address: "SantaCruz,Mumbai,Maharashtra",
    Salary: 25000
});
arr2.push({
    Id: 11,
    FirstName: "Renish",
    LastName: "Patel",
    Address: "Kathlal,Kheda,Gujarat",
    Salary: 30000
});
var arr3 = arr.concat(arr2);
//When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.PF should be computed and total salary should be
for (var _i = 0, arr3_1 = arr3; _i < arr3_1.length; _i++) {
    var emp = arr3_1[_i];
    console.log("FullName: ".concat(emp.FirstName, " ").concat(emp.LastName, " "));
    var address = emp.Address.split(",");
    console.log("City: ".concat(address[0], " Dist: ").concat(address[1], " State : ").concat(address[2]));
    var pf = emp.Salary.valueOf() * 0.12;
    console.log("PF : ".concat(pf, " TotaSalary: ").concat(emp.Salary.valueOf() - pf));
}
