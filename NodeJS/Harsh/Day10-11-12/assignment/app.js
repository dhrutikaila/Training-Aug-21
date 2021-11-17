const express = require("express");

require("dotenv").config();
const port = process.env.PORT || 3000;

const app = express();
app.use(express.json());

// global configuration

global.config = require("./authentication/global.config");

// mongoDB connection

const mongoose = require("mongoose");
const mongoDB = "mongodb://localhost/dataDB";

const connect = async () => {
    try {
        await mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });
        console.log("connected");
    } catch (err) { console.log(err) }
};
connect();

// verify token
const verifytoken = require("./authentication/verifytoken");

// verify user
const { authPage } = require("./authentication/authorization");

// employee router

const employeeRouter = require("./controller/employee/employee.controller");
app.use("/emp", verifytoken, authPage(["employee", "admin"]), employeeRouter);

// student router

const studentRouter = require("./controller/student/student.controller");
app.use("/students", verifytoken, authPage(["student", "admin"]), studentRouter);

// user router

const userRouter = require("./controller/user/user.controller");
app.use("/user", userRouter);





app.listen(port, () => { console.log(`server started on port:${port}`) });