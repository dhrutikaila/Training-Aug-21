var express = require("express");
var router = express.Router({ mergeParams: true });
var StudentDomain = require("../../../domain/students.domain");

class ResultController {


  // get student result record from studentId
  static async getResult(req, res) {
    const studentDomain = new StudentDomain();
    studentDomain.getResult(req, res);
  }


}

// get student result record from studentId
router.get("/", ResultController.getResult);


module.exports = router;
