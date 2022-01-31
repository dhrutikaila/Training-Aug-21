const express = require("express");
const doctors = require("./controllers/doctor.controller");
const patients = require("./controllers/patient.controller");
const medicines = require("./controllers/medicine.controller");
const departments = require("./controllers/department.controller");
const assistants = require("./controllers/assistant.controller");

// mongoDB connection

const mongoose = require("mongoose");
const mongoDB = "mongodb://localhost/hospital";

const connect = async () => {
    try {
        await mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });
        console.log("connected");
    } catch (err) { console.log(err) }
};
connect();

const app = express();
const port = 3000;

app.use(express.json());

app.use("/doctors", doctors);
app.use("/patients", patients);
app.use("/medicines", medicines);
app.use("/departments", departments);
app.use("/assistants", assistants);

app.listen(port, () => {
    console.log(`app listening at port:${port}`);
});
