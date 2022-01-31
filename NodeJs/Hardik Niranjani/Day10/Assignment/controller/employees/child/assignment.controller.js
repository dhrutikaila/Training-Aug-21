var express = require("express");
var EmployeeDomain = require("../../../domain/emloyees.domain");
var router = express.Router({ mergeParams: true });

class AssignmentController {
  

  //get all assignment data 
  static async get(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.getAssignments(req, res);
  }
  //get assignment from specified assignmentId
  static async getAnAssignment(req, res) {
    const employeeDomain = new EmployeeDomain();
    employeeDomain.getAnAssignment(req, res);
  }

}

//get all assignment data 
router.get("/", AssignmentController.get);

 //get assignment from specified assignmentId
router.get("/:AssignmentId", AssignmentController.getAnAssignment);


module.exports = router;
