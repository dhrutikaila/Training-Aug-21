var empObj = {
    name : "Dilip Kumavat",
    address : "A-28 vasant society,ishwarnagar,ahmedabad",
    fieldName : "IT",
    designation : "Developer"
}

var getData = {
    data : function(city,country){
        console.log(`Name : ${this.name}`);
        console.log(`Address : ${this.address}`);
        console.log(`fielddName : ${this.fieldName}`);
        console.log("Designation : ",this.designation);
        console.log("city : ",city);
        console.log("country : ",country);
    }
}

getData.data.apply(empObj,["Ahmedabad","India"]);