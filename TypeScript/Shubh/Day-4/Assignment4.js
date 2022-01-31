//Store 5 Employee Data(ID,Name,City,DOJ) in one Array. Search the employee with ID. Search the employees who has joined after year 2020, Search the employee who has joined after year 2020 and stays in Mumbai city.
var emp = [
    {
        Id: 1,
        Name: "Messi",
        City: "Buenos Aires",
        DOJ: new Date("2004-09-16")
    },
    {
        Id: 2,
        Name: "MATS",
        City: "Munich",
        DOJ: new Date("2015-01-18")
    },
    {
        Id: 3,
        Name: "Pedri",
        City: "Barcelona",
        DOJ: new Date("2020-08-09")
    },
    {
        Id: 4,
        Name: "Alves",
        City: "Mumbai",
        DOJ: new Date("2021-11-19")
    },
    {
        Id: 5,
        Name: "Xavi",
        City: "Barcelona",
        DOJ: new Date("2021-11-20")
    }
];
function searchEmp(id) {
    emp.forEach(function (element) {
        if (element.Id == id) {
            console.log("ID: ".concat(element.Id, " \nName: ").concat(element.Name, " \nCity: ").concat(element.City, " \nJining Date: ").concat(element.DOJ));
        }
    });
}
console.log("Search by id: ");
searchEmp(1);
// Search the employees who has joined after year 2020
console.log("\nSearch by year > 2020:");
emp.forEach(function (e) {
    if (e.DOJ.getFullYear() > 2020) {
        console.log("ID ".concat(e.Id, " \n Name ").concat(e.Name, " \n City ").concat(e.City, " \n DOJ ").concat(e.DOJ));
    }
});
// Search the employee who has joined after year 2020 and stays in Mumbai city
console.log("\nSearch by city= Mumbai:");
emp.forEach(function (e) {
    if (e.DOJ.getFullYear() > 2020 && e.City == "Mumbai") {
        console.log("ID ".concat(e.Id, " \n Name ").concat(e.Name, " \n City ").concat(e.City, " \n DOJ ").concat(e.DOJ));
    }
});
