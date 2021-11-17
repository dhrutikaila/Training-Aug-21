// Create EmployeeObject with ID, Name, Address, skills and store it empcollection.

var mongoose = require("mongoose");
const mongoDB = "mongodb://localhost:27017/employeeDb";

// connecting to mongodb server and database
const connect = async () => { try { await mongoose.connect(mongoDB) } catch (err) { console.log(err) } };
connect();

const employeeSchema = new mongoose.Schema({
    _id: Number,
    Name: String,
    Address: {
        Addressline1: String,
        Addressline2: String,
        Addressline3: String
    },
    skills: Array,
});


const EmployeeModel = mongoose.model("empcollection", employeeSchema);


const createEmployee = async () => {
    try {
        const employee = new EmployeeModel({
            _id: 3,
            Name: "manav",
            Address: {
                Addressline1: "bopal",
                Addressline2: "ahemdabad",
                Addressline3: "gujarat"
            },
            skills: ["js", ".net", "java"],
        })
        const result = await employee.save();
        console.log(result);
    } catch (err) {
        console.log(err);
    }
};

createEmployee();

