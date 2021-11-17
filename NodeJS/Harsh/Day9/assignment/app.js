require("dotenv").config();
const express = require("express");
const app = express();

const port = process.env.PORT || 3000;

app.use(express.json());
global.config = require("./config");

app.listen(port, () => { console.log(`server started on port: ${port}`); })

const indexRoute = require("./routes/index");
const userRoute = require("./routes/user");
const employeeRoute = require("./routes/employee");
const studentRoute = require("./routes/student");

app.use("/users", userRoute);
app.use("/", indexRoute);
app.use("/employees", employeeRoute);
app.use("/students", studentRoute);

