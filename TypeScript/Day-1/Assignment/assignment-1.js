/*Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). Do the operation searching by indexnumber, EmployeeID,
Insert the employee, delete the employee from the Array. Create one more array emp and join the value with above array. When display
list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.PF
should be computed and total salary should be display.*/
var Emp_Data = [
    { "EmpId": 1, "EmpFirstName": "Shreya", "EmpLastName": "Thakkar", "Address": "10,Radhe park ,Barejadi,Gujarat", "Salry": 25000 },
    { "EmpId": 2, "EmpFirstName": "Diya", "EmpLastName": "Thakkar", "Address": "11,Krishna park ,Surat,Gujarat", "Salry": 30000 },
    { "EmpId": 3, "EmpFirstName": "Dharal", "EmpLastName": "Patel", "Address": "15,Radhe park ,Ahmedabad,Gujarat", "Salry": 20000 },
    { "EmpId": 4, "EmpFirstName": "Bhavya", "EmpLastName": "Trivedi", "Address": "19,Radhe park ,Rajkot,Gujarat", "Salry": 25000 },
    { "EmpId": 5, "EmpFirstName": "Riya", "EmpLastName": "Patel", "Address": "20,Radhe park ,Vadodara,Gujarat", "Salry": 15000 }
];
//insert 
console.log("-----------insert employee-----------");
var NewEmp = { "EmpId": 6, "EmpFirstName": "Dhyanavi", "EmpLastName": "Patel", "Address": "Gota", "Salry": 35000 };
Emp_Data.push(NewEmp);
console.log(Emp_Data);
//remove data
console.log("-----after delete--------- ");
console.log(Emp_Data.pop());
//join array
console.log("------join two array------");
var emp1 = [{ "EmpId": 7, "EmpFirstName": "Dharal", "EmpLastName": "Patal", "Address": "Barejadi", "Salry": 25000 }];
Emp_Data = Emp_Data.concat(emp1);
for (var _i = 0, Emp_Data_1 = Emp_Data; _i < Emp_Data_1.length; _i++) {
    var item = Emp_Data_1[_i];
    console.log(item);
}
//searching 
console.log("-------Searching element by using index Number------");
var emp_id = Emp_Data.filter(function (find) {
    return find.EmpId == 1;
});
console.log(emp_id);
//pf and salary
for (var i in Emp_Data) {
    var val = Emp_Data[i];
    var pf = val.Salry * (0.12);
    var address = val["Address"].split(",");
    console.log("Full name is ".concat(val.EmpFirstName, " ").concat(val.EmpLastName));
    console.log("Flat number and society name is ".concat(address[0], ",").concat(address[1]));
    console.log("City is ".concat(address[2]));
    console.log("State is ".concat(address[3]));
    var netSalary = val.Salry - pf;
    console.log("Pf of employee id ".concat(val.EmpId, " is ").concat(pf));
    console.log("Net salary ".concat(val.EmpId, " id is ").concat(netSalary));
}
//for full name 
