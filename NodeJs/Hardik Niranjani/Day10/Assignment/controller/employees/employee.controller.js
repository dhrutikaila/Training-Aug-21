var express = require("express");
var EmployeeDomain = require("../../domain/emloyees.domain");
var assignments = require("./child/assignment.controller");
var router = express.Router();

class EmployeeController {


  //crete new employee data 
  static async createAnEmployee(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.createAnEmployee(req, res);
  }

  //get all employees data
  static async get(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.getAllEmployees(req, res);
  }

  //get employee from specific employeeId 
  static async getAnEmployee(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.getAnEmployee(req, res);
  }
}

router.use("/:EmpId/assignments", assignments);

//crete new employee data 
router.post("/", EmployeeController.createAnEmployee);

//get all employees data
router.get("/", EmployeeController.get);

//get employee from specific employeeId 
router.get("/:EmpId", EmployeeController.getAnEmployee);

module.exports = router;
