var express = require("express");
var EmployeeDomain = require("../domain/emloyees.domain");
var router = express.Router();

class EmployeeController {
  //To get all employees
  static async get(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.getAllEmployees(req, res);
  }
  //To get an single employee by id
  static async getAnEmployee(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.getAnEmployee(req, res);
  }
  //To Create New Employee
  static async createAnEmployee(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.createAnEmployee(req, res);
  }
  //To Delete An Employee
  static async deleteAnEmployee(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.deleteAnEmployee(req, res);
  }
 
}



//To get all employees
router.get("/", EmployeeController.get);
//To get an single employee by id
router.get("/:EmpId", EmployeeController.getAnEmployee);
//To delete an employee
router.delete("/:EmpId", EmployeeController.deleteAnEmployee);
//To Create New Employee
router.post("/", EmployeeController.createAnEmployee);

module.exports = router;
