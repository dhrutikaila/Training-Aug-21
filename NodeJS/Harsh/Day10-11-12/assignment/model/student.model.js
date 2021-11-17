const mongoose = require("mongoose");

const studentSchema = new mongoose.Schema({
    _id: { type: Number, required: true },
    firstName: {
        type: String,
        required: true,
        lowercase: true,
        minlength: 3,
        maxlength: 9
    },
    lastName: {
        type: String,
        required: true,
        lowercase: true,
        minlength: 3,
        maxlength: 9
    },
    address: {
        type: String,
        required: true,
        lowercase: true,
    },
    Fees: [{
        Amount: {
            type: Number,
            required: true,
        },
        PaymentDate: {
            type: Date,
            required: true,
        },
        Status: {
            type: Boolean,
            required: true,
        },
    },
    ],
    Result: [
        {
            Hindi: {
                type: Number,
                required: true,
            },
            Eng: {
                type: Number,
                required: true,
            },
            Maths: {
                type: Number,
                required: true,
            },
            Total: {
                type: Number,
                required: true,
            },
            Grade: {
                type: String,
                required: true,
            },
        },
    ],
}, { timestamps: true });

const StudentModel = mongoose.model("StudentDetail", studentSchema);

module.exports = StudentModel;





