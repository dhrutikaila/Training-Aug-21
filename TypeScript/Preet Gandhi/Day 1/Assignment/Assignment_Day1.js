var employees = [
    { "Id": 1, "FirstName": "Hiren", "LastName": "Panchal", "Address": "Sai-Krupa appartment,Ahmedabad,Gujarat", "Salary": 25000 },
    { "Id": 2, "FirstName": "Jai", "LastName": "Patel", "Address": "Lotus appartment,Vadodara,Gujarat", "Salary": 20000 },
    { "Id": 3, "FirstName": "Jayesh", "LastName": "Shah", "Address": "Mansi park society,Ahmedabad,Gujarat", "Salary": 30000 },
    { "Id": 4, "FirstName": "Hitesh", "LastName": "Parikh", "Address": "Karnavati appartment,Ahmedabad,Gujarat", "Salary": 50000 },
    { "Id": 5, "FirstName": "Parth", "LastName": "Desai", "Address": "Sunlight Bunglows,Rajkot,Gujarat", "Salary": 35000 }
];
//Search by index number
var searchByIndex = employees;
console.log(searchByIndex[2]);
//search by employeeid
var searchById = employees;
console.log(searchById[3].Id);
//Insert Employye
var insertEmp = employees;
insertEmp.push({ "Id": 6, "FirstName": "Abc", "LastName": "xyz", "Address": "Jai-hind appartment,Ahmedabad,Gujarat", "Salary": 25000 });
console.log(insertEmp);
//Delete Employee
insertEmp.pop();
console.log(insertEmp);
//Create array and join with first one
var employee2 = [{ "Id": 6, "FirstName": "Abc", "LastName": "xyz", "Address": "Jai-hind appartment,Ahmedabad,Gujarat", "Salary": 25000 }];
var res2 = insertEmp.concat(employee2);
console.log(res2);
//Display in different format with computed PF.
var emps = employees;
var arr2 = [];
for (var _i = 0, emps_1 = emps; _i < emps_1.length; _i++) {
    var values = emps_1[_i];
    var Id = values.Id;
    var FullName = values.FirstName + values.LastName;
    var Address = values.Address.split(",");
    var Salary = values.Salary;
    var PF = values.Salary * 0.12;
    arr2.push({ "Id": Id, "FullName": FullName, "Address": Address, "Salary": Salary, "PF": PF });
}
console.log(arr2);
