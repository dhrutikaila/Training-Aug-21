const express = require('express');
const app = express();
app.use(express.json());

const employee = require('./controller/employee.controller'); 

app.get("/", (req, res) => {
    res.send("Home Page");
  });

app.use("/emps", employee);

app.listen(3001);