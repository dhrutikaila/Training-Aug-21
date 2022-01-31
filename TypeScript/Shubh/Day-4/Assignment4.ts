//Store 5 Employee Data(ID,Name,City,DOJ) in one Array. Search the employee with ID. Search the employees who has joined after year 2020, Search the employee who has joined after year 2020 and stays in Mumbai city.

type empData = {
    Id: number;
    Name: string;
    City: string;
    DOJ: Date;
}

var emp: empData[] = 
[
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

 function searchEmp(id: number): void {
     emp.forEach(element => {
         if (element.Id == id) {
             console.log(`ID: ${element.Id} \nName: ${element.Name} \nCity: ${element.City} \nJining Date: ${element.DOJ}`);
         }        
     });
 }
 console.log("Search by id: ")
 searchEmp(1);

 // Search the employees who has joined after year 2020
 console.log("\nSearch by year > 2020:")
 emp.forEach(e => {
     if (e.DOJ.getFullYear() > 2020) {
             console.log(`ID ${e.Id} \n Name ${e.Name} \n City ${e.City} \n DOJ ${e.DOJ}`);
         }
 });
// Search the employee who has joined after year 2020 and stays in Mumbai city
console.log("\nSearch by city= Mumbai:")
emp.forEach(e => {
    if (e.DOJ.getFullYear() > 2020 && e.City=="Mumbai") {
            console.log(`ID ${e.Id} \n Name ${e.Name} \n City ${e.City} \n DOJ ${e.DOJ}`);
        }
});