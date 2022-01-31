var express = require("express");
var router = express.Router({ mergeParams: true });
var StudentDomain = require("../../../domain/students.domain");

class ResultController {


  // get student result record from studentId
  static async getResult(req, res) {
    const studentDomain = new StudentDomain();
    studentDomain.getResult(req, res);
  }

    //update student data
    static async updateResult(req, res) {
      const studentDomain = new StudentDomain();
      studentDomain.updateResult(req, res);
    }

}

// get student result record from studentId
router.get("/", ResultController.getResult);

//update student data
router.put("/", ResultController.updateResult);
module.exports = router;
