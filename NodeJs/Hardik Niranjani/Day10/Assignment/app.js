const express = require("express");
const emplyees = require("./controller/employees/employee.controller");
const students = require("./controller/students/student.controller");
const login = require("./controller/login/login.controller");
const verifytoken = require("./authentication/verifytoken");
const logger = require("./middleware/logger");

const app = express();


app.use(express.json());
app.use(logger);
app.get("/", (req, res) => {
  res.send("Home Page!");
});

app.use("/login", login);
app.use(verifytoken);
app.use("/emps", emplyees);
app.use("/students", students);


app.listen(3005);
