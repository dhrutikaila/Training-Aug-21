//Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). 
//Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the employee from the Array. 
//Create one more array emp and join the value with above array. When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.
//PF should be computed and total salary should be display.



let employees: (any)[] = [{ id: 1, firstName: 'dhruti', lastName: 'patel', address: 'ahemdabad', salary: 3000 },
{ id: 2, firstName: 'avni', lastName: 'patel', address: 'ahemdabad', salary: 3000 },
{ id: 3, firstName: 'khushi', lastName: 'kaila', address: 'ahemdabad', salary: 3000 },
{ id: 4, firstName: 'gopi', lastName: 'patel', address: 'ahemdabad', salary: 3000 },
{ id: 5, firstName: 'meena', lastName: 'patel', address: 'ahemdabad', salary: 3000 }
];
//Searching an employee
console.log("Search employee by Employee ID : 1");
var employee = employees.filter(e=>e.ID==1);
console.log(employee);

//Inserting new employee
console.log("Inserting new employee");
employee.push({ID:6,FirstName:"neha",LastName:"patel",Address:"601, gujratcity, gujarat",Salary:40000});
//  console output
for (var item of employee){
    console.log(item);
}

//Deleting an Employee
console.log("Deleting the employee of index number 3");
var removed = employee.splice(3,1);
console.log(removed);
for (var i in  employee){
      console.log(employee[i]);
}


// Concate another array of employee
let emp : any=[{ID:7,FirstName:"yasvi",LastName:"patel",Address:"701, kalpatru, gujarat",Salary:50000},
            {ID:8,FirstName:"charvi",LastName:"dave",Address:"1101, shreeji, gujarat",Salary:80000}];
console.log("Inserting new employees")
employee = employee.concat(emp);
for (var item of employee){
    console.log(item);
}
console.log("Employee Record");

// When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited
for (var item of employee){
    let add=item.Address;
    //console.log(add);
    var address = add.split(',');
    var PF = Number(item.Salary) * 0.12;
    
    console.log(`* ID: ${item.ID} -- EmployeeName: ${item.FirstName} ${item.LastName}`);
    console.log(`--> Address: FlatNumber: ${address[0]} City:${address[1]} State:${address[2]}`);
    console.log(`--> Salary: Basic Salary ${item.Salary} PF:${PF}`);
    console.log("-----------------------------------------------------");
}