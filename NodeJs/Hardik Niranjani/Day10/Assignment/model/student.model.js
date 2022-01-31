const mongoose = require("mongoose");
var mongoDB = "mongodb://localhost/day10";
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });


const studentSchema = new mongoose.Schema({
  
  Name: String,
  Address: String,
  Fees: [
    {
      Amount: Number,
      PaymentDate: Date,
      Status: Boolean,
    },
  ],
  Result: [
    {
      Hindi: Number,
      Eng: Number,
      Math: Number,
      Total: Number,
      Grade: String,
    },
  ],
});

const StudentModel = mongoose.model("Student", studentSchema);

module.exports = StudentModel;
