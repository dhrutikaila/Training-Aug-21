const StudentModel = require("../model/student.model");


class StudentDomain {
    // create an student
    async createStudent(req, res) {
        try {
            const data = req.body;
            const student = new StudentModel(data);
            const result = await student.save();
            res.send(result);
        }
        catch (err) { res.send(err) }
    }
    // get all students
    async getAllStudents(req, res) {
        try {
            const result = await StudentModel.find();
            if (result) { res.send(result); }
            else { res.status(401).json({ message: "students not found" }) }
        }
        catch (err) { res.send(err) }
    }

    // get student
    async getStudent(req, res) {
        try {
            const _id = req.params.id;
            const result = await StudentModel.findById({ _id });
            if (result) { res.send(result); }
            else { res.status(401).json({ message: "student not found" }) }
        }
        catch (err) { res.send(err) }
    }

    // delete student
    async deleteStudent(req, res) {
        try {
            const _id = req.params.id;
            const result = await StudentModel.findByIdAndDelete({ _id });
            if (result) { res.send(result); }
            else { res.status(401).json({ message: "student not found" }) }

        }
        catch (err) { res.send(err) }
    }

    // update student
    async updateStudent(req, res) {
        try {
            const _id = req.params.id;
            const data = req.body;
            const result = await StudentModel.findByIdAndUpdate({ _id }, { $set: data }, { new: 1 });
            if (result) { res.send(result); }
            else { res.status(401).json({ message: "student not found" }) }
        }
        catch (err) { res.send(err) }
    }

    // get fees
    async getFees(req, res) {
        try {
            const _id = req.params.id;
            const student = await StudentModel.findById({ _id });
            if (student) {
                res.send(student.fees);
            } else {
                res.status(401).json({
                    message: "Student Not Found!",
                });
            }
        } catch (err) {
            res.send(err);
        }
    }

    //   get result
    async getResult(req, res) {
        try {
            const _id = req.params.id;
            const student = await StudentModel.findById({ _id });
            if (student) {
                res.send(student.result);
            } else {
                res.status(401).json({
                    message: "Student Not Found!",
                });
            }
        } catch (err) {
            res.send(err);
        }
    }
}


module.exports = StudentDomain;