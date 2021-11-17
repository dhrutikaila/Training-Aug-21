const DepartmentModel = require("../models/department.model");

class DepartmentDomain {
    //To get all department
    async getAllDepartments(req, res) {
        const department = await DepartmentModel.find();
        res.send(department);
    }
    //To get department
    async getDepartment(req, res) {
        let id = req.params.DepId;
        const department = await DepartmentModel.findById(id);
        if (department) {
            res.send(department);
        } else {
            res.status(404).send("Department Not Found");
        }
    }
    //To Insert department
    async insertDepartment(req, res) {
        let data = req.body;

        const department = new DepartmentModel(data);
        try {
            const result = await department.save();
            res.send(result);
        } catch (e) {
            res.send(e.message);
        }
    }
    //To delete a department
    async deleteDepartment(req, res) {
        let id = req.params.DepId;
        const department = await DepartmentModel.findByIdAndDelete(id);
        if (department) {
            res.send("Deleted Successfully");
        } else {
            res.status(404).send("Data Not Found");
        }
    }

    // To update a department
    async updateDepartment(req, res) {
        const _id = req.params.id;
        const data = req.body;
        const result = await DepartmentModel.findByIdAndUpdate({ _id }, { $set: data }, { new: 1 });
        if (result) { res.send(result); }
        else { res.status(401).json({ message: "department not found" }) }
    }
}

module.exports = DepartmentDomain;
