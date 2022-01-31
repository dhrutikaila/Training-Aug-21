var express = require("express");
const DepartmentDomain = require("../domains/department.domain");
var router = express.Router();

class DepartmentController {
    //To get all department
    static async get(req, res) {
        const departmentDomain = new DepartmentDomain();
        departmentDomain.getAllDepartments(req, res);
    }
    //to get department
    static async getDepartment(req, res) {
        const departmentDomain = new DepartmentDomain();
        departmentDomain.getDepartment(req, res);
    }
    //To insert department
    static async insertDepartment(req, res) {
        const departmentDomain = new DepartmentDomain();
        departmentDomain.insertDepartment(req, res);
    }
    //To delete department
    static async deleteDepartment(req, res) {
        const departmentDomain = new DepartmentDomain();
        departmentDomain.deleteDepartment(req, res);
    }
    //To update department
    static async updateDepartment(req, res) {
        const departmentDomain = new DepartmentDomain();
        departmentDomain.updateDepartment(req, res);
    }
}

//To get all departments
router.get("/", DepartmentController.get);
//To get a single department by id
router.get("/:DepId", DepartmentController.getDepartment);
//To delete a department
router.delete("/:DepId", DepartmentController.deleteDepartment);
//To insert department
router.post("/", DepartmentController.insertDepartment);
//To update department
router.put("/:id", DepartmentController.updateDepartment);

module.exports = router;
