const EmployeeModel = require("../model/employee.model");

class EmployeeDomain {
  //To get all employees
  async getAllEmployees(req, res) {
    const employees = await EmployeeModel.find();
    res.send(employees);
  }
  //To get an employee by EmpId
  async getAnEmployee(req, res) {
    let id = req.params.EmpId;
    const employees = await EmployeeModel.findById(id);
    if (employees) {
      res.send(employees);
    } else {
      res.status(404).send("Data Not Found");
    }
  }
  //To Create an Employee
  async createAnEmployee(req, res) {
    //getting user input
    let data = req.body;
    const employee = new EmployeeModel(data);
    try {
      const result = await employee.save();
      res.send(result);
    } catch (e) {
      res.send(e.message);
    }
  }
  //To delete an employee
  async deleteAnEmployee(req, res) {
    let id = req.params.EmpId;
    const employees = await EmployeeModel.findByIdAndDelete(id);
    if (employees) {
      res.send("Employee Record Deleted Successfully");
    } else {
      res.status(404).send("Data Not Found");
    }
  }
  
}

module.exports = EmployeeDomain;
