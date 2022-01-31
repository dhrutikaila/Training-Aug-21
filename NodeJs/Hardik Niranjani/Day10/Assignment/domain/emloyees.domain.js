const EmployeeModel = require("../model/employee.model");

class EmployeeDomain {

    //crete new employee data 
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

    
//get all employees data
  async getAllEmployees(req, res) {
    const employees = await EmployeeModel.find();
    res.send(employees);
  }

//get employee from specific employeeId 
  async getAnEmployee(req, res) {
    let id = req.params.EmpId;
    const employees = await EmployeeModel.findById(id);
    if (employees) {
      res.send(employees);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

 
  //get all assignment data from employeeId
  async getAssignments(req, res) {
    let id = req.params.EmpId;

    const result = await EmployeeModel.findById(id);
    if (result) {
      res.send(result.Assignments);
    } else {
      res.status(404).send("Data Not Found");
    }
  }
  
  //get assignment from specified assignmentId
  async getAnAssignment(req, res) {
    let id = req.params.EmpId;
    let AssignmentId = req.params.AssignmentId;

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
