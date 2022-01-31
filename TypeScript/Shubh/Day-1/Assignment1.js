// Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the employee from the Array. Create one more array emp and join the value with above array. When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.PF should be computed and total salary should be display.
var emp = [];
//Pushing values into array
emp.push({
    Id: 1,
    FirstName: "Shubh",
    LastName: "Patel",
    Address: "007-Address Such Tough, No Diwali Gifts, Received yet-110001",
    Salary: 64800
});
emp.push({
    Id: 2,
    FirstName: "Leo",
    LastName: "Diy",
    Address: "LM10-Camp Nou, FC Barcelona, Spain-408975",
    Salary: 10000
});
emp.push({
    Id: 3,
    FirstName: "Xavi",
    LastName: "Hernandez",
    Address: "06-Park Street, Barcelona, Spain-498756",
    Salary: 66600
});
emp.push({
    Id: 4,
    FirstName: "Sunil",
    LastName: "Chhetri",
    Address: "11-G.O.A.T. House, Fortrada- Bangalore, India-256896",
    Salary: 11100
});
emp.push({
    Id: 5,
    FirstName: "Frenkie",
    LastName: "de Jong",
    Address: "21-Ajax House of Amsterdom, Magic Compound, Holand-774856",
    Salary: 212100
});
// 1. Searching by Index
function searchByIndex(array, index) {
    if (index >= array.length) {
        return null;
    }
    return emp[index];
}
var newEmp = searchByIndex(emp, 0);
console.log(newEmp);
// 2. Search by EmployeeId
function searchByEmployeeId(array, key) {
    return array.filter(function (emp) { return emp.EmpId === key; })[0];
}
var emp4 = searchByEmployeeId(emp, 4);
console.log(emp4);
// 3. Adding new Employee
function InsertEmployee(employee) {
    emp.push(employee);
}
emp.push({
    Id: 6,
    FirstName: "Cristiano",
    LastName: "Ronaldo",
    Address: "Malabar County, B/h. Nirma Uni., Ahmedabad",
    Salary: 77700
});
console.log(emp);
// 4. Deleting Employee
function DeleteEmployeebyId(Id) {
    emp = emp.filter(function (employee) { return employee.Id !== Id; });
}
DeleteEmployeebyId(6);
console.log(emp);
// 5. Creating new array
var emp2 = [];
emp2.push({
    Id: 7,
    FirstName: "Pedri",
    LastName: "Gonsalez",
    Address: "La-Masia Hostel, Barcelona-408975",
    Salary: 606060
});
// 6. Concating Array 1 & 2
var emp3 = emp.concat(emp2);
//7. Displaying details of Employees with asked changes
for (var _i = 0, emp3_1 = emp3; _i < emp3_1.length; _i++) {
    var emps = emp3_1[_i];
    console.log("Name: ".concat(emps.FirstName, " ").concat(emps.LastName, " "));
    var address = emps.Address.split(",");
    console.log("flat number:".concat(address[0], ", flat: ").concat(address[1], " , City: ").concat(address[2], ", state: ").concat(address[3]));
    var pf = emps.Salary.valueOf() * 0.12;
    console.log("PF : ".concat(pf, " Total Salary: ").concat(emps.Salary.valueOf() - pf));
}
