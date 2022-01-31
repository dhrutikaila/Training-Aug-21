const mongoose = require("mongoose");
var mongoDB = "mongodb://localhost/day11";
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });


const studentSchema = new mongoose.Schema({
 
  Name: { type: String, required: true },
  Address: { type: String, required: true },
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
