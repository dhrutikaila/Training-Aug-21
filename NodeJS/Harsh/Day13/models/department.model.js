const mongoose = require("mongoose");

const departmentSchema = new mongoose.Schema({
    _id: {
        type: Number,
        required: true
    },
    name: {
        type: String,
        required: true,
        minlength: 1,
        maxlength: 20,
    },
}, { timestamps: true });

const DepartmentModel = mongoose.model("department", departmentSchema);

module.exports = DepartmentModel;
