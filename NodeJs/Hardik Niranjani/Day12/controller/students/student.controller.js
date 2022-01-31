var express = require("express");
var router = express.Router();
var StudentDomain = require("../../domain/students.domain");
var fees = require("./child/fees.controller");
var result = require("./child/result.controller");

class StudentController {
  //create student data
  static async createStudent(req, res) {
    const studentDomain = new StudentDomain();
    studentDomain.creatStudent(req, res);
  }
  //get all students data
  static async get(req, res) {
    const studentDomain = new StudentDomain();
    studentDomain.getAllStudents(req, res);
  }

  //get student data from studentId
  static async getStudentRecord(req, res) {
    const studentDomain = new StudentDomain();
    studentDomain.getStudentRecord(req, res);
  }

  //delete student data
  static async deleteAnStudent(req, res) {
    const studentDomain = new StudentDomain();
    studentDomain.deleteAnStudent(req, res);
  }
}

router.use("/:studentId/fees", fees);
router.use("/:studentId/result", result);

//create student data
router.post("/", StudentController.createStudent);

//get all students data
router.get("/", StudentController.get);

//get student data from studentId
router.get("/:studentId", StudentController.getStudentRecord);

//delete student data
router.delete("/:studentId", StudentController.deleteAnStudent);
module.exports = router;
