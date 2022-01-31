require("dotenv").config();
const port = process.env.PORT;

var express = require("express");
var app = express();
app.use(express.json());
var mongoose = require("mongoose");

const mongoDB = "mongodb://localhost:27017/demoDb";


// connecting to mongodb server and database
const connect = async () => { try { await mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true }) } catch (err) { console.log(err) } };
connect();
// schema(structure of document)

const userSchema = new mongoose.Schema({
    _id: {
        type: Number,
        // unique: true,
        required: true,
    },
    name: {
        type: String,
        required: true,
        lowercase: true,
        alias: "userName",
        unique: true,
        trim: true,
        minlength: 3,
        maxlengh: 3
    },
    phoneNumber: {
        type: Number,
        unique: true,
        required: true,
        validate(value) {
            if (value.toString().length != 10) { throw new Error("please enter valid phone number"); }

        }
    },
    email: {
        type: String,
        unique: true,
        required: true,
        // async custom validator
        validate: {
            validator: () => Promise.resolve(false),
            message: "please enter proper email",
        }
    },
    admin: {
        type: Boolean,
        required: true,
        default: false
    },
    // updatedAt: {
    //     type: Date,
    //     default: Date.now(),
    // },
    gender: {
        type: String,
        required: true,
        enum: ["male", "female"]
    },
    birthDate: {
        type: Date,
        required: true
    }
}, { timestamps: true });

// model(create collection)

const UserDetail = mongoose.model("UserDetail", userSchema);


// insert or create document
const createUser = async () => {
    try {
        const userSagar = new UserDetail({
            _id: 6,
            name: "sachinn",
            phoneNumber: 9346541234,
            email: "sachin113@gmail.com",
            admin: 0,
            gender: "male",
            birthDate: "2000-11-23"
        })
        const user = new UserDetail({
            _id: 7,
            name: "gopal",
            phoneNumber: 9276541234,
            email: "gopal113@gmail.com",
            admin: 0,
            gender: "male",
            birthDate: "2000-11-23"
        })
        const result = await UserDetail.insertMany([userSagar, user]);
        console.log(result);
    } catch (err) {
        console.log(err);
    }
};

createUser();

// read document

// const getDocument = async () => {
//     try {
//         const result = await UserDetail.find();
//         console.log(result)
//     }
//     catch (err) { console.log(err) }
// };

// getDocument();


// const getDocument = async () => {
//     try {
//         const result = await UserDetail.find().limit(2);
//         console.log(result)
//     }
//     catch (err) { console.log(err) }
// };

// getDocument();

// read userName

// const getDocument = async () => {
//     try {
//         const result = await UserDetail.find().select({ name: 1 }).limit(2);
//         console.log(result)
//     }
//     catch (err) { console.log(err) }
// };

// getDocument();


// const getDocument = async () => {
//     try {
//         const result = await UserDetail.find({ _id: { $gt: 6 } });
//         console.log(result)
//     }
//     catch (err) { console.log(err) }
// };

// getDocument();

// const getDocument = async () => {
//     try {
//         const result = await UserDetail.find({ name: "sagar" });
//         console.log(result)
//     }
//     catch (err) { console.log(err) }
// };

// getDocument();

// update users

// updateOne

// const updateUsers = async (_id) => {
//     try {
//         const result = await UserDetail.updateOne({ _id }, { $set: { name: "fahim" } });
//         console.log(result);
//     }
//     catch (err) { console.log(err) }
// }

// updateUsers(2);

// findByIdAndUpdate

// const updateUsers = async (_id) => {
//     try {
//         const result = await UserDetail.findByIdAndUpdate({ _id }, { $set: { name: "meet" } }, { new: true });
//         console.log(result);
//     }
//     catch (err) { console.log(err) }
// }

// updateUsers(2);


// delete the documents

// deleteOne

// const deleteDocument = async (_id) => {
//     try {
//         const result = await UserDetail.deleteOne({ _id });
//         console.log(result);
//     }
//     catch (err) { console.log(err) }
// }

// deleteDocument(7);

// findByIdAndDelete

// const deleteDocument = async (_id) => {
//     try {
//         const result = await UserDetail.findByIdAndDelete({ _id });
//         console.log(result);
//     }
//     catch (err) { console.log(err) }
// }

// deleteDocument(6);

// const deleteDocument = async () => {
//     try {
//         const result = await UserDetail.deleteMany({ admin: { $eq: false } });
//         console.log(result);
//     }
//     catch (err) { console.log(err) }
// }

// deleteDocument();


// Regular Expression


// Regular expression

const regexName = async () => {
    const result = await UserDetail.find({ name: { $regex: /av$/, $options: "i" } }).select({ name: 1 })
    console.log(result);
}

regexName();

