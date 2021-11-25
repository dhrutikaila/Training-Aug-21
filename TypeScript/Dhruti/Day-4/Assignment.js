//Store 5 Employee Data(ID,Name,City,DOJ) in one Array. Search the employee with ID.
//Search the employees who has joined after year 2020
//Search the employee who has joined after year 2020 and stays in Mumbai City
var Employee = [{ ID: 1, Name: "dhruti", City: "ahemdabad", DOJ: new Date(2019, 11, 2) },
    { ID: 2, Name: 'avni', City: 'Mumbai', DOJ: new Date(2019, 11, 2) },
    { ID: 3, Name: 'khushi', City: 'dheli', DOJ: new Date(2021, 11, 2) },
    { ID: 4, Name: 'gopi', City: 'maharastra', DOJ: new Date(2019, 11, 2) },
    { ID: 5, Name: 'meena', City: 'gandhinagr', DOJ: new Date(2021, 11, 2) }
];
var id = 1;
console.log(Employee[id - 1]);
//Search the employees who has joined after year 2020
for (var _i = 0, Employee_1 = Employee; _i < Employee_1.length; _i++) {
    var items = Employee_1[_i];
    if (items.DOJ.getFullYear() > 2020) {
        console.log(items);
    }
}
//Search the employee who has joined after year 2020 and stays in Mumbai city
for (var _a = 0, Employee_2 = Employee; _a < Employee_2.length; _a++) {
    var items = Employee_2[_a];
    if ((items.DOJ.getFullYear() > 2020) && (items.City.toUpperCase() == 'MUMBAI')) {
        console.log(items);
    }
}
