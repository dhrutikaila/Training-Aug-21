const EmployeeModel = require("../model/employee.model");

class EmployeeDomain {
    // create an employee
    async createEmployee(req, res) {
        try {
            const data = req.body;
            const employee = new EmployeeModel(data);
            const result = await employee.save();
            res.send(result);
        }
        catch (err) { res.send(err) }
    }
    // get all employees
    async getAllEmployees(req, res) {
        try {
            const result = await EmployeeModel.find();
            if (result) { res.send(result); }
            else { res.status(401).json({ message: "employees not found" }) }

        }
        catch (err) { res.send(err) }
    }

    // get an employee
    async getAnEmployee(req, res) {
        try {
            const _id = req.params.id;
            const result = await EmployeeModel.findById({ _id });
            if (result) { res.send(result); }
            else { res.status(401).json({ message: "employee not found" }) }

        }
        catch (err) { res.send(err) }
    }

    // delete an employee
    async deleteAnEmployee(req, res) {
        try {
            const _id = req.params.id;
            const result = await EmployeeModel.findByIdAndDelete({ _id });
            if (result) { res.send(result); }
            else { res.status(401).json({ message: "employee not found" }) }

        }
        catch (err) { res.send(err) }
    }

    // update an employee
    async updateAnEmployee(req, res) {
        try {
            const _id = req.params.id;
            const data = req.body;
            const result = await EmployeeModel.findByIdAndUpdate({ _id }, { $set: data }, { new: 1 });
            if (result) { res.send(result); }
            else { res.status(401).json({ message: "employee not found" }) }

        }
        catch (err) { res.send(err) }
    }
    // get all assignments
    async getAllAssignments(req, res) {
        try {
            const _id = req.params.id;
            const result = await EmployeeModel.findById({ _id });
            if (result) { res.send(result.assignments); }
            else { res.status(401).json({ message: "employees not found" }) }

        }
        catch (err) { res.send(err) }
    }
    // get an assignment
    async getAnAssignment(req, res) {
        try {
            const _id = req.params.id;
            const assignmentId = parseInt(req.params.assignmentId);

            const employee = await EmployeeModel.findById({ _id });
            if (employee) {
                const result = await employee.assignments.find((ele) => ele._id === assignmentId);
                if (result) { res.send(result); }
                else { res.status(401).json({ message: "assignment not found" }) }
            }
            else { res.status(401).json({ message: "employee not found" }) }


        }
        catch (err) { res.send(err) }
    }

    // create an assignment

    async createAssignment(req, res) {
        try {
            const _id = req.params.id;
            const data = req.body;
            const employee = await EmployeeModel.findById({ _id });
            if (employee) {
                employee.assignments.addToSet(data);
                employee.save();
                res.send(employee);
            } else {
                res.status(401).json({
                    message: "Employee Not Found!",
                });
            }
        } catch (err) {
            res.send(err);
        }
    }

    // delete an assignment

    async deleteAssignment(req, res) {
        try {
            const _id = req.params.id;
            const assignmentId = parseInt(req.params.assignmentId);
            const employee = await EmployeeModel.findById({ _id });
            if (employee) {
                const result = employee.assignments.id(assignmentId);
                if (result) {
                    result.remove();
                    employee.save();
                    res.send(result);
                } else {
                    res.status(401).json({
                        message: "Assignment Not Found!",
                    });
                }
            } else {
                res.status(401).json({
                    message: "Employee Not Found!",
                });
            }
        } catch (err) {
            res.send(err);
        }
    }

    // update an assignment

    async updateAssignment(req, res) {
        try {
            const data = req.body;
            const _id = req.params.id;
            const assignmentId = parseInt(req.params.assignmentId);
            const employee = await EmployeeModel.findById({ _id });
            if (employee) {
                const result = await EmployeeModel.findOneAndUpdate(
                    { _id: _id, "assignments._id": assignmentId },
                    { $set: { "assignments.$": data } },
                    { new: 1 }
                );
                if (result) {
                    res.send(result);
                } else {
                    res.status(401).json({
                        message: "Assignment Not Found!",
                    });
                }
            } else {
                res.status(401).json({
                    message: "Employee Not Found!",
                });
            }
        } catch (err) {
            res.send(err);
        }
    }
}


module.exports = EmployeeDomain;