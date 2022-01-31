// Store 5 Employee Data(ID,Name,City,DOJ) in one Array

var employees: { Id: number, Name: string, City: string, Doj: Date }[] =
    [{ "Id": 1, "Name": "Hiren", "City": "Ahmedabad", "Doj": new Date("2021-11-25") },
    { "Id": 2, "Name": "Jai", "City": "Vadodara", "Doj": new Date("2020-12-20") },
    { "Id": 3, "Name": "Meet", "City": "Ahmedabad", "Doj": new Date("2015-06-15") },
    { "Id": 4, "Name": "Jeet", "City": "Mumbai", "Doj": new Date("2021-11-25") },
    { "Id": 5, "Name": "Het", "City": "Rajkot", "Doj": new Date("2000-02-05") }
    ];


// Search the employee with ID.
function findEmpById(id: number) {
    for (let emp of employees) {
        if (id == emp.Id) {
            console.log(emp);
        }
    }
}

findEmpById(4);
console.log("----------------------------");

//Search the employees who has joined after year 2020

employees.forEach((emp) => {
    if (emp.Doj.getFullYear() > 2020) {
        console.log(`Id: ${emp.Id}, Name: ${emp.Name}, City: ${emp.City}, Doj: ${emp.Doj}`);
    }
});
console.log("----------------------------");

//Search the employee who has joined after year 2020 and stays in Mumbai city
employees.forEach((emp) => {
    if (emp.Doj.getFullYear() > 2020 && emp.City == "Mumbai") {
        console.log(`Id: ${emp.Id}, Name: ${emp.Name}, City: ${emp.City}, Doj: ${emp.Doj}`);
    }
});

