const mongoose = require("mongoose");

const doctorSchema = new mongoose.Schema({
    _id: Number,
    name: {
        type: String,
        required: true,
        minlength: 1,
        maxlength: 20
    },
    patients:
    {
        type: Number,
        ref: "patient",
    },
}, { timestamps: true });

const DoctorModel = mongoose.model("doctor", doctorSchema);

module.exports = DoctorModel;
