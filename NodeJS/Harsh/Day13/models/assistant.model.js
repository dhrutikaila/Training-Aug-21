const mongoose = require("mongoose");

const assistantSchema = new mongoose.Schema({
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

const AssistantModel = mongoose.model("assistant", assistantSchema);

module.exports = AssistantModel;
