//Using Function call create employee object with field Name, Address and Designation and pass it to function.
//call() method takes arguments separtely
function Employee(FieldName, Address, Designation) {
    console.log(this.Name +" "+FieldName + " " + Address + " " + Designation);
}

const emp1 = {
    Name: "Shreya Thakkar"
}
const emp2 = {
    Name: "Diya Thakkar"
}
const emp3 = {
    Name: "Riya Patel"
}

Employee.call(emp1, "Developer", "Ahmedabad", "Senior Developer")


