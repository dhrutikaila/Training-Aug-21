//Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). 
//Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the employee from the Array. 
//Create one more array emp and join the value with above array. When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.
//PF should be computed and total salary should be display.



let employee: (any)[] = [{ id: 1, firstName: 'dhruti', lastName: 'patel', address: 'ahemdabad', salary: 3000 }];

//searching by indexnumber,employeeid
console.log(employee.indexOf(1));
console.log('searching by indexnumber,employeeid');
console.log(employee[0]);

//Insert the employee
employee.push({ id: 5, firstName: 'meet', lastName: 'patel', address: 'ahemdabad', salary: 5000 });
console.log('Insert the employee');
console.log(employee);

//delete the employee
employee.pop();
console.log('delete the employee');
console.log(employee);

//Create one more array emp and join the value with above array
let concatEmp = [{ id: 5, firstName: 'meet123', lastName: 'patel', address: 'ahemdabad', salary: 5000 },
{ id: 5, firstName: 'meet456', lastName: 'patel', address: 'ahemdabad', salary: 5000 }];
employee = employee.concat(concatEmp);
console.log('Create one more array emp and join the value with above array');
console.log(employee);

// When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited



//PF should be computed and total salary should be display.