const mongoose = require("mongoose");

const employeeSchema = new mongoose.Schema({
    _id: Number,
    firstName: {
        type: String,
        required: true,
        minlength: 1,
        maxlength: 50
    },
    lastName: {
        type: String,
        required: true,
        minlength: 1,
        maxlength: 50
    },
    assignments: [{
        _id: { type: Number, unique: true },
        assignmentName: String,
        assignmentCategory: String,
        assignmentStatus: Boolean,
    }]
});

const EmployeeModel = mongoose.model("EmployeeDetail", employeeSchema);

module.exports = EmployeeModel;