/*Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary). Do the operation searching by indexnumber, EmployeeID,
Insert the employee, delete the employee from the Array. Create one more array emp and join the value with above array. When display
list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.PF 
should be computed and total salary should be display.*/

let Emp_Data :{EmpId:number,EmpFirstName:string , EmpLastName :string ,Address:string , Salry : number}[] = [
    {"EmpId":1 , "EmpFirstName":"Shreya","EmpLastName":"Thakkar" ,"Address":"10,Radhe park ,Barejadi,Gujarat","Salry":25000 },
    {"EmpId":2 , "EmpFirstName":"Diya","EmpLastName":"Thakkar" ,"Address":"11,Krishna park ,Surat,Gujarat","Salry":30000 },
    {"EmpId":3 , "EmpFirstName":"Dharal","EmpLastName":"Patel" ,"Address":"15,Radhe park ,Ahmedabad,Gujarat","Salry":20000 },
    {"EmpId":4 , "EmpFirstName":"Bhavya","EmpLastName":"Trivedi" ,"Address":"19,Radhe park ,Rajkot,Gujarat","Salry":25000 },
    {"EmpId":5 , "EmpFirstName":"Riya","EmpLastName":"Patel" ,"Address":"20,Radhe park ,Vadodara,Gujarat","Salry":15000 }
];

//insert 
console.log("-----------insert employee-----------")
var NewEmp = {"EmpId":6 , "EmpFirstName":"Dhyanavi","EmpLastName":"Patel" ,"Address":"Gota","Salry":35000 }
Emp_Data.push(NewEmp)
console.log(Emp_Data)


//remove data
console.log("-----after delete--------- ")
console.log(Emp_Data.pop())

//join array
console.log("------join two array------")
let emp1 =[{"EmpId":7 , "EmpFirstName":"Dharal","EmpLastName":"Patal" ,"Address":"Barejadi","Salry":25000 }] ;
Emp_Data = Emp_Data.concat(emp1);
for(var item of Emp_Data){
    console.log(item)
}

//searching 
console.log("-------Searching element by using index Number------")
var emp_id = Emp_Data.filter(function(find){
    return find.EmpId==1;
} );
console.log(emp_id)

//pf and salary
for(var i in Emp_Data){
    var val = Emp_Data[i];
    var pf = val.Salry*(0.12)
    var address = val["Address"].split(",");
    console.log(`Full name is ${val.EmpFirstName} ${val.EmpLastName}`)
    console.log(`Flat number and society name is ${address[0]},${address[1]}`)
    console.log(`City is ${address[2]}`)
    console.log(`State is ${address[3]}`)
    var netSalary = val.Salry-pf;
    console.log(`Pf of employee id ${val.EmpId} is ${pf}`)
    console.log(`Net salary ${val.EmpId} id is ${netSalary}`)
}

//for full name 

