//Using Function Apply pass employee object to a function defined in the function.
//apply() takes array as an argument

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

Employee.apply(emp2, ['Developer', 'Ahmedabad', 'Senior Developer'])


