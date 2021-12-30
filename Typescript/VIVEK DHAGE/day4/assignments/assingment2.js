// Assignment
var employee = [
    { ID: 0, Name: "sandeep", City: "Mumbai", DOJ: "2019-01-02" },
    { ID: 1, Name: "Karthik", City: "shrinagar", DOJ: "2017-01-03" },
    { ID: 2, Name: "Kiran", City: "mumbai", DOJ: "2021-01-30" },
    { ID: 3, Name: "Revanth", City: "manglore", DOJ: "2020-01-02" },
    { ID: 4, Name: "Ravi", City: "chennai", DOJ: "2019-01-02" },
    { ID: 5, Name: "bhuvan", City: "mumbai", DOJ: "2019-01-02" },
    { ID: 6, Name: "kishan", City: "agartala", DOJ: "2019-01-02" },
];
//Search the employee with ID.
var filteredElements1 = employee.filter(function (element) { return element.ID == 2; });
console.log("searched employee ".concat(filteredElements1[0].Name));
// Search the employees who has joined after year 2020
// Search the employee who has joined after year 2020 and stays in Mumbai city
console.log("employees who joined after 2020 are:");
for (var i = 0; i < employee.length; i++) {
    var dtd = new Date(employee[i].DOJ);
    var constrainDate = new Date("2019-12-31");
    var smallCity = employee[i].City;
    smallCity.toLowerCase;
    if (dtd > constrainDate) {
        console.log("  ".concat(employee[i].ID, " ").concat(employee[i].Name));
    }
    // console.log(employee[i].City);
}
console.log("employees with location mumbai plus joined after 2020 are:");
for (var i = 0; i < employee.length; i++) {
    var dtd = new Date(employee[i].DOJ);
    var constrainDate = new Date("2019-12-31");
    var smallCity = employee[i].City;
    smallCity.toLowerCase;
    if (smallCity == "mumbai" && dtd > constrainDate) {
        console.log(" ".concat(employee[i].ID, " ").concat(employee[i].Name));
    }
    // console.log(employee[i].City);
}
