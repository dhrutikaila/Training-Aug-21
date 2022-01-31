const express = require("express");
const router = express.Router();
const assignments = require("../data/assignment.json");
const verifytoken = require("../middlewares/verifytoken");
const { authpage, authPermission } = require("../middlewares/middleware");

router.get("/", (req, res, next) => {
    res.send("welcome to employees module");
});

router.get("/assignments", verifytoken, authpage(["employee"]), (req, res, next) => {
    res.send(assignments);
});

router.get("/assignments/:id", verifytoken, authpage(["employee"]), authPermission, (req, res, next) => {
    const assignment = assignments.find((c) => c.AssignmentId === parseInt(req.params.id));
    res.send(assignment);
});


module.exports = router;