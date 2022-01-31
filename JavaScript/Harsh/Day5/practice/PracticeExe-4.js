//Using Function call create employee object with field Name, Address and Designation and pass it to function.
//call() method takes arguments separtely
function Employee(FieldName, Address, Designation) {
    console.log(this.Name + " " + FieldName + " " + Address + " " + Designation);
}

const emp1 = {
    Name: "Manav Patel"
}
const emp2 = {
    Name: "Raj Shah"
}
const emp3 = {
    Name: "Rahul Prajapati"
}

Employee.call(emp1, "Developer", "Ahmedabad", "Senior Developer")


