const StudentModel = require("../model/student.model");


class StudentDomain {
  
  //To crate a new student record
  async creatStudent(req, res) {
    let data = req.body;
    const students = new StudentModel(data);
    try {
      const result = await students.save();
      res.send(result);
    } catch (e) {
      res.send(e.message);
    }
  }

  //To get all students
  async getAllStudents(req, res) {
    const students = await StudentModel.find();
    if (students) {
      res.json(students);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

  //To return a Particular Student Record
  async getStudentRecord(req, res) {
    let id = req.params.studentId;
    //checking if record available
    const students = await StudentModel.findById(id);
    if (students) {
      res.send(students);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

  //To return a particular student FEES Record
  async getFees(req, res) {
    let id = req.params.studentId;
    //checking if record available
    const result = await StudentModel.findById(id);
    if (result) {
      res.send(result.Fees);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

  //To return a particular student Exam Result
  async getResult(req, res) {
    let id = req.params.studentId;
    //checking if record available
    const result = await StudentModel.findById(id);
    if (result) {
      res.send(result.Result);
    } else {
      res.status(404).send("Data Not Found");
    }
  }
}

module.exports = StudentDomain;
