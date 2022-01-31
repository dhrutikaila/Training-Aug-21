const mongoose = require("mongoose");
var mongoDB = "mongodb://localhost/day10";
mongoose
  .connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("Connected To MongoDB"));


const employeeSchema = new mongoose.Schema({
  
  FirstName:  String,
  LastName: String,
  Assignments: [
    {
      
      AssignmentCategory: String,
      AssignmentName: String,
      AssignmentStatus: String,
    },
  ],
});

const EmployeeModel = mongoose.model("employee", employeeSchema);

module.exports = EmployeeModel;
