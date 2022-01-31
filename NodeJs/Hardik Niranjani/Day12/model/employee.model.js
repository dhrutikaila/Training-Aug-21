const mongoose = require("mongoose");
var mongoDB = "mongodb://localhost/day10";
mongoose
  .connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("Connected To MongoDB"));


const employeeSchema = new mongoose.Schema({
  
  FirstName: { type: String, required: true, maxLength:15 },
  LastName: { type: String, required: true, maxLength:20 },
  Assignments: [
    {
      
      AssignmentCategory: {type: String, required: true},
      AssignmentName: {type: String, required: true, maxLength:30},
      AssignmentStatus: {type: String, required: true},
    },
  ],
});

const EmployeeModel = mongoose.model("employee", employeeSchema);

module.exports = EmployeeModel;
