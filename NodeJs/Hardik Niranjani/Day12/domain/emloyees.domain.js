const EmployeeModel = require("../model/employee.model");

class EmployeeDomain {
  //crete new employee data
  async createAnEmployee(req, res) {
    //getting user input
    var data = req.body;
    const employee = new EmployeeModel(data);
    try {
      const result = await employee.save();
      res.send(result);
    } catch (e) {
      res.send(e.message);
    }
  }

  //get all employees data
  async getAllEmployees(req, res) {
    const employees = await EmployeeModel.find();
    res.send(employees);
  }

  //get employee from specific employeeId
  async getAnEmployee(req, res) {
    var id = req.params.EmpId;
    const employees = await EmployeeModel.findById(id);
    if (employees) {
      res.send(employees);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

  //To update an employee
  async updateAnEmployee(req, res) {
    
    var data = req.body;

    var id = req.params.EmpId;
    const employees = await EmployeeModel.find();
    var Emp_Data = employees.find((e) => e.id == id);

    if (Emp_Data) {
      const result = await EmployeeModel.findByIdAndUpdate(
        id,
        {
          $set: data,
        }
      );
      res.send(result);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

    //delete Employee data
    async deleteAnEmployee(req, res) {
      var id = req.params.EmpId;
      const employees = await EmployeeModel.findByIdAndDelete(id);
      if (employees) {
        res.send("Employee Record Deleted Successfully");
      } else {
        res.status(404).send("Data Not Found");
      }
    }

  //get all assignment data from employeeId
  async getAssignments(req, res) {
    var id = req.params.EmpId;

    const result = await EmployeeModel.findById(id);
    if (result) {
      res.send(result.Assignments);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

  //get assignment from specified assignmentId
  async getAnAssignment(req, res) {
    var id = req.params.EmpId;
    var AssignmentId = req.params.AssignmentId;

    const result = await EmployeeModel.findById(id);
    if (result) {
      const assignment = result.Assignments.find((a) => a.id == AssignmentId);
      if (assignment) {
        res.send(assignment);
      } else {
        res.status(404).send("Assignment Not Available");
      }
    } else {
      res.status(404).send("Data Not Found");
    }
  }
}

module.exports = EmployeeDomain;
