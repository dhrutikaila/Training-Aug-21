const mongoose = require("mongoose");
var mongoDB = "mongodb://localhost/day11";
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });

const studentSchema = new mongoose.Schema({
  
  Name: { type: String, required: true },
  Address: { type: String, required: true },
  Fees: [
    {
      Amount: { type: Number, required: true, maxValue: 50000, minValue:15000 },
      PaymentDate: { type: Date, required: true },
      Status: { type: Boolean, required: true },
    },
  ],
  Result: [
    {
      Hindi: { type: Number, required: true, min: 0, max: 100 },
      Eng: { type: Number, required: true, min: 0, max: 100 },
      Math: { type: Number, required: true, min: 0, max: 100 },
      Total: { type: Number, required: true, min: 0, max: 100 },
      Grade: {
        type: String,
        required: true,
        uppercase: true,
        enum: ["A+", "A", "B+", "B", "C", "D", "F"],
      },
    },
  ],
});

const StudentModel = mongoose.model("Student", studentSchema);

module.exports = StudentModel;
