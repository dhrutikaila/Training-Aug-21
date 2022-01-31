/**
 * Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the employee from the Array. Create one more array emp and join the value with above array. When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.PF should be computed and total salary should be display.
 */

type employee = {
    Id:Number,
    FirstName:String,
    LastName:String,
    Address:String,
    Salary:Number
}

var arr:employee[] = [];

arr.push({
    Id:1,
    FirstName:"Raviraj",
    LastName:"Padhiyar",
    Address:"Sola,Ahmedabad,Gujarat",
    Salary:25000
})

arr.push({
    Id:2,
    FirstName:"Rahul",
    LastName:"Parmar",
    Address:"Bavla,Ahmedabad,Gujarat",
    Salary:20000
})

arr.push({
    Id:3,
    FirstName:"Abhi",
    LastName:"Vyas",
    Address:"kuchaman,Naguar,Rajasthan",
    Salary:30000
})

arr.push({
    Id:4,
    FirstName:"Mohil",
    LastName:"Vaghela",
    Address:"Nadia,kheda,gujarat",
    Salary:25000
})

arr.push({
    Id:5,
    FirstName:"Smit",
    LastName:"Patel",
    Address:"vastraput,Ahmedabad,Gujarat",
    Salary:30000
})

//searching operation

//search by index

function searchByIndex (array,index) : employee {
    if(index >= array.length){
        return null;
    }
    return arr[index];
}

var _5thEmployee: employee = searchByIndex(arr,4);
console.log(_5thEmployee);

//search by Id

function searchByEmployeeId(array,key) : employee {
    return array.filter(emp => emp.Id === key)[0];
}

var employeeWithId4 = searchByEmployeeId(arr,4);
console.log(employeeWithId4);


//insert employee

function InsertEmployee(employee) :void {
    arr.push(employee);
}

InsertEmployee({Id:6,FirstName:"Ronak",LastName:"Sharma",Address:"Surat",Salary:15000});

console.log(arr);

//delete employee
function DeleteEmployeebyId(Id:number) : void {
    arr = arr.filter(employee => employee.Id !== Id);
}

DeleteEmployeebyId(6);

console.log(arr);

// Create one more array emp and join the value with above array

var arr2:employee[] = [];

arr2.push({
    Id:10,
    FirstName:"Nirmal",
    LastName:"Kunar",
    Address:"SantaCruz,Mumbai,Maharashtra",
    Salary:25000
})

arr2.push({
    Id:11,
    FirstName:"Renish",
    LastName:"Patel",
    Address:"Kathlal,Kheda,Gujarat",
    Salary:30000
})


var arr3 = arr.concat(arr2);

//When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.PF should be computed and total salary should be

for(var emp of arr3){
    console.log(`FullName: ${emp.FirstName} ${emp.LastName} `);
    var address = emp.Address.split(",");
    console.log(`City: ${address[0]} Dist: ${address[1]} State : ${address[2]}`);
    var pf = emp.Salary.valueOf() * 0.12;
    console.log(`PF : ${pf} TotaSalary: ${emp.Salary.valueOf() - pf}`);
}
