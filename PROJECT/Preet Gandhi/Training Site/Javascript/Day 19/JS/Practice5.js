// Practice_Exercise4

var employee = {
    fieldName: "IT",
    address: "Ekyarth, Malabar county road, Chharodi",
    designation: "Software Developer",
}

var getData = {
    fullData: function (age,gender) {
        var res = document.getElementById("output");
        res.innerHTML = "<b>Field: </b>" + this.fieldName + ",<br> <b>Adress: </b>" + this.address + ",<br> <b>Designation: </b>" + this.designation + "<br><b>Age: </b>" + age + "<br><b>Gender: </b>" + gender ;
    }
}

getData.fullData.apply(employee,["15","Male"]);