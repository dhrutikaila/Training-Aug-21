//Using Function Apply pass employee object to a function defined in the function.
//apply() takes array as an argument

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

Employee.apply(emp2 , ['Developer', 'Ahmedabad', 'Senior Developer'] )


