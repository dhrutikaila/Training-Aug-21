//Task #2248 
/* Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary).
Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the
employee from the Array. Create one more array emp and join the value with above array.
 When display list combine firstname and lastname as fullname, From the address field flatnumber,
 city,state and should be splited.PF should be computed and total salary should be display.*/
// //: { emp_id: number, firstname: string,lastname: string ,address:string,salary:number}[] 
// : { emp_id: number, firstname: string,lastname: string ,address:string,salary:number}[] 
var Employee1 = [
    { emp_id: 0, firstname: "Saideep", lastname: "patel", address: "001,ahmedabad,guajarat", salary: 5000 },
    { emp_id: 1, firstname: "nirav", lastname: "ravat", address: "002 surat gujarat", salary: 4000 },
    { emp_id: 2, firstname: "bharat", lastname: "patel", address: "003 baroda gujarat", salary: 7000 },
    { emp_id: 3, firstname: "gopal", lastname: "raj", address: "004 ranchi jharkhand", salary: 4000 },
    { emp_id: 4, firstname: "sunil", lastname: "patel", address: "005 faridabad UP", salary: 5000 },
];
var Employee2 = [
    { emp_id: 5, firstname: "bharat", lastname: "patel", address: "003 ahmedabad guajarat", salary: 5000 },
    { emp_id: 6, firstname: "abhi", lastname: "ravat", address: "094 surat gujarat", salary: 4000 },
    { emp_id: 7, firstname: "manoj", lastname: "patel", address: "023 baroda gujarat", salary: 7000 },
    { emp_id: 8, firstname: "girish", lastname: "raj", address: "029 ranchi jharkhand", salary: 4000 },
    { emp_id: 9, firstname: "sumit", lastname: "patel", address: "093 faridabad UP", salary: 5000 },
];
var filteredElements1 = Employee1.filter(function (element) { return element.emp_id == 2; });
console.log("searched employee ".concat(filteredElements1[0].firstname));
// let filteredElements=Employee1.findIndex(element => element.emp_id == 2)
//  console.log(`searched employee ${filteredElements}`);
//2.adding employee
var New_Emp = [{
        "emp_id": 6,
        "firstname": "aman",
        "lastname": "parekh",
        "address": "ahmedabad",
        "salary": 5000
    }];
Employee2.push(New_Emp);
//3. pop operation deleting employee from array
// Employee1.pop();
console.log("popped from employee");
//4.concatenating employee
var newEmp = Employee1.concat(Employee2);
// newEmp.forEach(function (value) {
//    console.log(value);
// });
//5.fullname
for (var _i = 0, newEmp_1 = newEmp; _i < newEmp_1.length; _i++) {
    var k = newEmp_1[_i];
    var Fullname = k.firstname + k.lastname;
}
//6.separator and pf
// var dates = newEmp.map(item => item.address);
//  for (var data of newEmp) {
//      console.log(data.emp_id,data.firstname,data.lastname,dates,data.salary)
// }
// for(var t of Employee1){
//    var splitted = t.address.split(" "); 
// }
for (var i = 0; i < Employee1.length; i++) {
    console.log(Employee1[i].emp_id, Employee1[i].firstname + Employee1[i].lastname, Employee1[i].address.split(" "), Employee1[i].salary + ",", "PF is : " + Employee1[i].salary * 0.12 + ",", "Total salary is : " + Employee1[i].salary * 0.12 + Employee1[i].salary);
}
