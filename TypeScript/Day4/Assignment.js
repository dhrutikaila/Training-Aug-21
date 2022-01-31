// Store 5 Employee Data(ID,Name,City,DOJ) in one Array. Search the employee with ID. Search the employees who has joined after year 2020. Search the employee who has joined after year 2020 and stays in Mumbai city.
var Employee = new Map();
Employee.set(1, { ID: 1, Name: "Jerry", City: "Ahm", DOJ: new Date(2021, 10, 24) });
Employee.set(2, { ID: 2, Name: "Resmi", City: "Mum", DOJ: new Date(2021, 10, 21) });
Employee.set(3, { ID: 3, Name: "James", City: "Del", DOJ: new Date(2021, 3, 10) });
Employee.set(4, { ID: 4, Name: "Priti", City: "Del", DOJ: new Date(2019, 10, 16) });
Employee.set(5, { ID: 5, Name: "Anisha", City: "Mum", DOJ: new Date(2020, 10, 30) });
// Employee.set(3, {ID : 3, Name : "Miya", City : "Ahm", DOJ : new Date(2021, 2, 13)});
// Display Employee Details
console.log("Employee Details : ");
for (var _i = 0, _a = Employee.entries(); _i < _a.length; _i++) {
    var entry = _a[_i];
    console.log(Employee.get(entry[0]));
}
seperator();
// Search By ID
console.log("Search by Id 2 : ");
var searchById = function () {
    var id = 2;
    if (Employee.has(id) == true) {
        console.log(Employee.get(id));
    }
    else {
        console.log("Data not found");
    }
};
searchById();
seperator();
// Joined after year 2020
console.log("Joined after year 2020 : ");
for (var _b = 0, _c = Employee.entries(); _b < _c.length; _b++) {
    var entry = _c[_b];
    if (entry[1].DOJ.getYear() > 120) {
        console.log(Employee.get(entry[0]));
    }
}
seperator();
// Joined after year 2020 and stays in Mumbai city.
console.log("Joined after year 2020 and stays in Mumbai city : ");
for (var _d = 0, _e = Employee.entries(); _d < _e.length; _d++) {
    var entry = _e[_d];
    if (entry[1].DOJ.getYear() > 120 && entry[1].City == "Mumbai") {
        console.log(Employee.get(entry[0]));
    }
}
seperator();
function seperator() {
    console.log("------------------------------------------------------------------------------------");
}
