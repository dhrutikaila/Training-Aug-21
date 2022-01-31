class employee {
    Id:number;
    name:string;
    city:string;
    DOJ:Date;

    constructor(Id:number, name:string,city:string,DOJ:Date) {
        this.Id = Id;
        this.name = name;
        this.city = city;
        this.DOJ = DOJ;
    }
}


let employees = new Set<employee>();

employees.add( new employee(1,"Raviraj Padhiyar","Ahmedabad",new Date("2021-08-15")));
employees.add( new employee(2,"Uttam Patel","Gandhinagar",new Date("2020-02-15")));
employees.add( new employee(3,"Rahul Singh","Mumbai",new Date("2020-06-15")));
employees.add( new employee(4,"Abhi Vyas","Nadiad",new Date("2018-06-15")));

console.log(employees);

//retrive employee with Id = 2;
console.log("search employee with Id 2");


function serachByIndex(emps:Set<employee>,index:number) : void {
    for(var emp of emps){
        if(emp.Id == index){
            console.log(emp);
        }
    }
}

serachByIndex(employees,2);



// search employee who joined in year 2020

console.log("search employees who joined in year 2020");

function searchByYear(emps:Set<employee>,yearOfJoining:number) : void {
    for (const emp of emps) {
        if(emp.DOJ.getFullYear() == yearOfJoining){
            console.log(emp);
        }
    }
}

searchByYear(employees,2020);


//search by location and year
console.log("search employee who has joined in year 2020 and living in mumbai");

function searchByYearAndLocation(emps:Set<employee>,yearOfJoining,location:string) : void {
    emps.forEach(emp => {
        if(emp.DOJ.getFullYear() == yearOfJoining && emp.city == location) 
            console.log(emp);
    });
}

searchByYearAndLocation(employees,2020,"Mumbai");
