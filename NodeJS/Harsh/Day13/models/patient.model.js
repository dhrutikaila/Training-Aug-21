const mongoose = require("mongoose");

const patientSchema = new mongoose.Schema({
    _id: Number,
    name: {
        type: String,
        required: true,
        minlength: 1,
        maxlength: 20
    },
    department: {
        type: Number,
        ref: "department",
        required: true,
    },
    medicines: [
        {
            medicine: {
                type: Number,
                ref: "medicine",
            },
            doses: { type: String, enum: ["morning", "afternoon", "night"] },
        },
    ],
}, { timestamps: true });

const PatientModel = mongoose.model("patient", patientSchema);

module.exports = PatientModel;
