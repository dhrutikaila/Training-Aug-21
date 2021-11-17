const EmployeeDomain = require("../../domain/employee.domain");

const express = require("express");
const router = express.Router();

class EmployeeController {
    static createEmployee(req, res) {
        const employee = new EmployeeDomain();
        employee.createEmployee(req, res);
    }
    static getAllEmployees(req, res) {
        const employee = new EmployeeDomain();
        employee.getAllEmployees(req, res);
    }
    static getAnEmployee(req, res) {
        const employee = new EmployeeDomain();
        employee.getAnEmployee(req, res);
    }
    static deleteAnEmployee(req, res) {
        const employee = new EmployeeDomain();
        employee.deleteAnEmployee(req, res);
    }
    static updateAnEmployee(req, res) {
        const employee = new EmployeeDomain();
        employee.updateAnEmployee(req, res);
    }

}

// assignment router

const assignmentRouter = require("./child/assignment.controller");
router.use("/:id/child/assignments", assignmentRouter);

router.post("/create", EmployeeController.createEmployee);
router.get("/", EmployeeController.getAllEmployees);
router.get("/:id", EmployeeController.getAnEmployee);
router.delete("/:id", EmployeeController.deleteAnEmployee);
router.put("/:id", EmployeeController.updateAnEmployee);

module.exports = router;

