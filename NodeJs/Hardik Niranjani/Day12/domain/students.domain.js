const StudentModel = require("../model/student.model");


class StudentDomain {
  
  //create new student data
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

  //get all students data
  async getAllStudents(req, res) {
    const students = await StudentModel.find();
    if (students) {
      res.json(students);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

  //get spcific student data from id
  async getStudentRecord(req, res) {
    let id = req.params.studentId;

    const students = await StudentModel.findById(id);
    if (students) {
      res.send(students);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

    //delete student data
    async deleteAnStudent(req, res) {
      let id = req.params.studentId;
      const student = await StudentModel.findByIdAndDelete(id);
      if (student) {
        res.send("Student Record Deleted Successfully");
      } else {
        res.status(404).send("Data Not Found");
      }
    }

  //get fees data from specific student id 
  async getFees(req, res) {
    let id = req.params.studentId;

    const result = await StudentModel.findById(id);
    if (result) {
      res.send(result.Fees);
    } else {
      res.status(404).send("Data Not Found");
    }
  }

  //get result data from specific student id
  async getResult(req, res) {
    let id = req.params.studentId;

    const result = await StudentModel.findById(id);
    if (result) {
      res.send(result.Result);
    } else {
      res.status(404).send("Data Not Found");
    }
  }
}

module.exports = StudentDomain;
