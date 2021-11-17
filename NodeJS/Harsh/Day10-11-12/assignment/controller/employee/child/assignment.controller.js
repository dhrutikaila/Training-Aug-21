const EmployeeDomain = require("../../../domain/employee.domain");

const express = require("express");
const router = express.Router({ mergeParams: true });


class AssignmentController {
    static getAllAssignments(req, res) {
        const assignment = new EmployeeDomain();
        assignment.getAllAssignments(req, res);
    }
    static getAnAssignment(req, res) {
        const assignment = new EmployeeDomain();
        assignment.getAnAssignment(req, res);
    }
    static createAssignment(req, res) {
        const assignment = new EmployeeDomain();
        assignment.createAssignment(req, res);
    }

}



router.get("/", AssignmentController.getAllAssignments);
router.get("/:assignmentId", AssignmentController.getAnAssignment);
router.post("/create", AssignmentController.createAssignment);

module.exports = router;


