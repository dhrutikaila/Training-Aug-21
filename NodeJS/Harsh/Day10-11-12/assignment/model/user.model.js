const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    _id: {
        type: Number,
        required: true
    },
    userName: {
        type: String,
        required: true,
        minlength: 3,
        maxlength: 9,
        unique: true,
        lowercase: true
    },
    password: {
        type: String,
        required: true,
        minlength: 3,
        maxlength: 9,
        unique: true,
        lowercase: true
    },
    role: {
        type: String,
        required: true,
        enum: ["student", "employee", "admin"],
        lowercase: true
    },
}, { timestamps: true });

const UserModel = mongoose.model("UserDetail", userSchema);

module.exports = UserModel;