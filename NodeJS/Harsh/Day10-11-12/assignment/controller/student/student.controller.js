const StudentDomain = require("../../domain/student.domain");

const express = require("express");
const router = express.Router();

class StudentController {
    static createStudent(req, res) {
        const student = new StudentDomain();
        student.createStudent(req, res);
    }
    static getAllStudents(req, res) {
        const student = new StudentDomain();
        student.getAllStudents(req, res);
    }
    static getStudent(req, res) {
        const student = new StudentDomain();
        student.getStudent(req, res);
    }
    static deleteStudent(req, res) {
        const student = new StudentDomain();
        student.deleteStudent(req, res);
    }
    static updateStudent(req, res) {
        const student = new StudentDomain();
        student.updateStudent(req, res);
    }

}

router.post("/create", StudentController.createStudent);
router.get("/", StudentController.getAllStudents);
router.get("/:id", StudentController.getStudent);
router.delete("/:id", StudentController.deleteStudent);
router.put("/:id", StudentController.updateStudent);

module.exports = router;

