const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    _id: Number,
    userName: {
        type: String,
        required: true,
        minlength: 1,
        maxlength: 50,
        unique: true
    },
    password: {
        type: String,
        minlength: 5,
        maxlength: 1024,
        required: true,
        unique: true
    },
    email: {
        type: String,
        required: true,
        minlength: 1,
        maxlength: 9,
        unique: true
    },
    phoneNumber: {
        type: Number,
        required: true,
        unique: true
    },
    role: {
        type: String,
        enum: ["admin", "user"],
        required: true
    },
    isActive: {
        type: "boolean",
        default: 1
    }
}, { timestamps: true });


const UserModel = mongoose.model("userDetail", userSchema);

module.exports = UserModel;