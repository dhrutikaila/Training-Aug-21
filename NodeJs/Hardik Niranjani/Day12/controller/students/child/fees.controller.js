var express = require("express");
var router = express.Router({ mergeParams: true });
var StudentDomain = require("../../../domain/students.domain");

class FeesController {
  
  //get student fess record from studentId
  static async getFees(req, res) {
    const studentDomain = new StudentDomain();
    studentDomain.getFees(req, res);
  }
}

//get student fess record from studentId
router.get("/", FeesController.getFees);

module.exports = router;
